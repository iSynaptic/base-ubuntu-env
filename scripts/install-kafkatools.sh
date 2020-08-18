#!/bin/bash

source ./common.sh

if ! which kafkacat > /dev/null; then
    installing "Kafkacat (may take a while)"
    
    cat > /tmp/make-kafkacat.sh <<EOF
#!/bin/bash

apt-get update
apt-get install -y curl python wget build-essential

cd /tmp
curl -o /tmp/kafkacat.tar.gz -sSL https://github.com/edenhill/kafkacat/archive/1.4.0.tar.gz
tar -vxzf /tmp/kafkacat.tar.gz
cd /tmp/kafkacat-1.4.0
./bootstrap.sh
mv /tmp/kafkacat-1.4.0/kafkacat /tmp/kafkacat
rm -rf /tmp/kafkacat-1.4.0 /tmp/kafkacat.tar.gz
EOF

    chmod +x /tmp/make-kafkacat.sh
    docker run --rm -v /tmp:/tmp debian:9.5 /tmp/make-kafkacat.sh
    install /tmp/kafkacat /usr/local/bin/kafkacat
    rm /tmp/kafkacat /tmp/make-kafkacat.sh
fi

if ! which kt > /dev/null; then
    installing "KT"

    curl -o /tmp/kt.txz -sSL https://github.com/fgeller/kt/releases/download/v13.0.0/kt-v13.0.0-linux-amd64.txz
    (cd /tmp && tar -xf /tmp/kt.txz)
    install /tmp/kt /usr/local/bin/kt
    rm /tmp/kt.txz /tmp/kt
fi