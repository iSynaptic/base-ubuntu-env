#!/bin/bash

source ./common.sh

IP_ADDR=`ifconfig enp0s8 | grep "inet addr" | awk '{ print substr($2,6) }'`

if ! which docker > /dev/null; then
    installing "Docker 17.06.2"

    apt-get update
    apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce=17.06.2~ce-0~ubuntu
    
    sudo usermod -aG docker vagrant
    systemctl enable docker
fi

MINIMUM_DC_VERSION=1.15.0
EXISTING_DC_VERSION=$((which docker-compose && (docker-compose --version | awk '{print $3}')) || echo "0.0.0")

if ! which docker-compose >> /dev/null || version_gt $MINIMUM_DC_VERSION $EXISTING_DC_VERSION ; then
    installing "Docker Compose $MINIMUM_DC_VERSION"

    if [ -f /usr/local/bin/docker-compose ]; then
        rm /usr/local/bin/docker-compose
    fi

    curl -sL https://github.com/docker/compose/releases/download/$MINIMUM_DC_VERSION/docker-compose-Linux-x86_64 -o /tmp/dc
    install /tmp/dc /usr/local/bin/docker-compose
    rm /tmp/dc
fi

if ! which dc > /dev/null; then
    doing "Linking" "docker-compose to 'dc'"
    sudo ln -s $(which docker-compose) /usr/local/bin/dc
fi

mkdir -p /var/docker

if [ ! "$(ls -1 /var/docker | jq -Rrsj 'split("\n") | map(select(length > 0)) | sort | .[]')" = "ca-cert.pemca-cert.srlca-key.pemclient-cert.pemclient-key.pemserver-cert.pemserver-key.pem" ]; then
    doing "Deleting" "Incomplete Docker TLS fileset"
    rm -f /var/docker/**
    rm -f /etc/docker/daemon.json
fi

if [ ! -f /var/docker/ca-key.pem ]; then
    doing "Generating" "Docker CA Key"
    openssl genrsa -out /var/docker/ca-key.pem 4096 > /dev/null 2>&1
    chmod 400 /var/docker/ca-key.pem
fi

if [ ! -f /var/docker/ca-cert.pem ]; then
    doing "Generating" "Docker CA Certificate"
    openssl req -new \
            -x509 \
            -subj "/C=US/O=MN/OU=Vagrant/CN=$(hostname)" \
            -days 365 \
            -key /var/docker/ca-key.pem \
            -sha256 \
            -out /var/docker/ca-cert.pem > /dev/null 2>&1
    chmod 400 /var/docker/ca-cert.pem
fi

if [ ! -f /var/docker/server-key.pem ]; then
    doing "Generating" "Docker Host Key"
    openssl genrsa -out /var/docker/server-key.pem 4096 > /dev/null 2>&1
    chmod 400 /var/docker/server-key.pem
fi

if [ ! -f /var/docker/server-cert.pem ]; then
    doing "Generating" "Docker Host Certificate"
    openssl req -subj "/CN=$(hostname)" \
                -sha256 \
                -new \
                -key /var/docker/server-key.pem \
                -out /tmp/server.csr > /dev/null 2>&1

    cat > /tmp/extfile.cnf <<EOF
  extendedKeyUsage = serverAuth
  subjectAltName = DNS:$(hostname),IP:$IP_ADDR,IP:127.0.0.1
EOF

    openssl x509 -req \
                 -days 365 \
                 -sha256 \
                 -in /tmp/server.csr \
                 -CA /var/docker/ca-cert.pem \
                 -CAkey /var/docker/ca-key.pem \
                 -CAcreateserial \
                 -out /var/docker/server-cert.pem \
                 -extfile /tmp/extfile.cnf > /dev/null 2>&1

    chmod 400 /var/docker/server-cert.pem

    rm /tmp/server.csr
    rm /tmp/extfile.cnf
fi

if [ ! -f /var/docker/client-key.pem ]; then
    doing "Generating" "Docker Client Key"
    openssl genrsa -out /var/docker/client-key.pem 4096 > /dev/null 2>&1

    chmod 400 /var/docker/client-key.pem
fi

if [ ! -f /var/docker/client-cert.pem ]; then
    doing "Generating" "Docker Client Certificate"
    openssl req -subj '/CN=client' \
            -new \
            -key /var/docker/client-key.pem \
            -out /tmp/client.csr > /dev/null 2>&1

    cat > /tmp/extfile.cnf <<EOF
  extendedKeyUsage = clientAuth
EOF

    openssl x509 -req \
        -days 365 \
        -sha256 \
        -in /tmp/client.csr \
        -CA /var/docker/ca-cert.pem \
        -CAkey /var/docker/ca-key.pem \
        -CAcreateserial \
        -out /var/docker/client-cert.pem \
        -extfile /tmp/extfile.cnf > /dev/null 2>&1

    chmod 400 /var/docker/client-cert.pem

    rm /tmp/client.csr
    rm /tmp/extfile.cnf
fi

if cat /lib/systemd/system/docker.service | grep '^ExecStart=/usr/bin/dockerd \-H fd://$' > /dev/null; then
    doing "Removing" "Host Flag from Docker SystemD service config"
    sed -i -e 's/dockerd -H fd:\/\//dockerd/g' /lib/systemd/system/docker.service
    rm -f /etc/docker/daemon.json
    sudo systemctl daemon-reload
fi

cat > /tmp/docker-daemon.json <<EOF
{
    "tls": true,
    "tlsverify": true,
    "tlscacert": "/var/docker/ca-cert.pem",
    "tlscert": "/var/docker/server-cert.pem",
    "tlskey": "/var/docker/server-key.pem",
    "hosts": ["fd://", "tcp://$IP_ADDR:2376", "tcp://127.0.0.1:2376"]
}
EOF

if [ ! "$(cat /tmp/docker-daemon.json | jq 'has("hosts")')" = "true" ]; then
    doing "Defaulting" "Docker configuration to host on Unix socket"
    cat /tmp/docker-daemon.json | jq '. + {"hosts":["fd://"]}' > /tmp/docker-daemon2.json
    rm /tmp/docker-daemon.json
    mv /tmp/docker-daemon2.json /tmp/docker-daemon.json
fi

if [ ! -f /etc/docker/daemon.json ]; then
    configuring "Docker Daemon"
    cp /tmp/docker-daemon.json /etc/docker/daemon.json

    service docker stop
    sleep 1
    service docker start
fi

if [ ! "$(md5sum /etc/docker/daemon.json | awk '{ print $1 }' )" = "$(md5sum /tmp/docker-daemon.json | awk '{ print $1 }')" ]; then
    doing "Updating" "Docker Daemon configuration"
    rm /etc/docker/daemon.json
    cp /tmp/docker-daemon.json /etc/docker/daemon.json
    
    service docker stop
    sleep 1
    service docker start
fi

rm /tmp/docker-daemon.json