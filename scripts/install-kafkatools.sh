#!/bin/bash

source ./common.sh

if ! which kafkacat > /dev/null; then
    installing "kafkacat (may take a while)"
    
    cat > /tmp/make-kcat.sh <<EOF
#!/bin/bash

apt-get update
apt-get install -y \
    curl \
    python \
    wget \
    build-essential \
    libcurl4-openssl-dev \
    pkg-config \
    cmake \
    libssl-dev \
    liblz4-dev \
    liblzma-dev \
    zlib1g-dev \
    libsnappy-dev \
    libsasl2-dev \
    libzstd-dev \
    libjansson-dev

cd /tmp
curl -o /tmp/kcat.tar.gz -sSL https://github.com/edenhill/kcat/archive/1.6.0.tar.gz
tar -vxzf /tmp/kcat.tar.gz
cd /tmp/kcat-1.6.0
./bootstrap.sh
mv /tmp/kcat-1.6.0/kafkacat /tmp/kafkacat
rm -rf /tmp/kcat-1.6.0 /tmp/kcat.tar.gz
EOF

    chmod +x /tmp/make-kcat.sh
    docker run --rm -v /tmp:/tmp debian:11.1 /tmp/make-kcat.sh
    install /tmp/kafkacat /usr/local/bin/kafkacat
    rm /tmp/kafkacat /tmp/make-kcat.sh
fi

if ! which kt > /dev/null; then
    installing "KT"

    curl -o /tmp/kt.txz -sSL https://github.com/fgeller/kt/releases/download/v13.0.0/kt-v13.0.0-linux-amd64.txz
    (cd /tmp && tar -xf /tmp/kt.txz)
    install /tmp/kt /usr/local/bin/kt
    rm /tmp/kt.txz /tmp/kt
fi