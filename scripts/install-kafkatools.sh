#!/bin/bash

source ./common.sh

if ! which kafkacat > /dev/null; then
    installing "Kafkacat (may take a while)"
    
    cat > /tmp/make-kafkacat.sh <<EOF
#!/bin/bash

apt-get update
apt-get install -y curl python wget build-essential

cd /tmp
curl -o /tmp/kafkacat.tar.gz -sSL https://github.com/edenhill/kafkacat/archive/1.3.1.tar.gz
tar -vxzf /tmp/kafkacat.tar.gz
cd /tmp/kafkacat-1.3.1
./bootstrap.sh
mv /tmp/kafkacat-1.3.1/kafkacat /tmp/kafkacat
rm -rf /tmp/kafkacat-1.3.1 /tmp/kafkacat.tar.gz
EOF

    chmod +x /tmp/make-kafkacat.sh
    docker run --rm -v /tmp:/tmp debian:9.1 /tmp/make-kafkacat.sh
    install /tmp/kafkacat /usr/local/bin/kafkacat
    rm /tmp/kafkacat /tmp/make-kafkacat.sh
fi

if [ ! -d /opt/kafka ]; then
    installing "Kafka 0.8 Distribution"

    curl -o /tmp/kafka.tgz -sSL https://archive.apache.org/dist/kafka/0.8.2.2/kafka_2.11-0.8.2.2.tgz
    (cd /tmp && tar -vxzf /tmp/kafka.tgz > /dev/null)
    rm /tmp/kafka.tgz
    mv /tmp/kafka_2.11-0.8.2.2 /opt/kafka
fi

if ! which kt > /dev/null; then
    installing "KT"

    curl -o /tmp/kt.txz -sSL https://github.com/fgeller/kt/releases/download/v11.1.0/kt-v11.1.0-linux-amd64.txz
    (cd /tmp && tar -xf /tmp/kt.txz)
    install /tmp/kt /usr/local/bin/kt
    rm /tmp/kt.txz /tmp/kt
fi