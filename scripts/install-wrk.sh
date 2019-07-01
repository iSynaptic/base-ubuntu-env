#!/bin/bash

source ./common.sh

if ! which wrk > /dev/null; then
    installing "Wrk 4.1.0 (may take a while)"
    
    cat > /tmp/make-wrk.sh <<EOF
#!/bin/bash

apt-get update
apt-get install -y curl build-essential libssl-dev git

cd /tmp
git clone https://github.com/wg/wrk.git /tmp/wrk-git
cd /tmp/wrk-git
git checkout 4.1.0
make
mv /tmp/wrk-git/wrk /tmp/wrk
cd /tmp
rm -rf /tmp/wrk-git /tmp/wrk.tar.gz
EOF

    chmod +x /tmp/make-wrk.sh
    docker run --rm -v /tmp:/tmp debian:9.5 /tmp/make-wrk.sh
    install /tmp/wrk /usr/local/bin/wrk
    rm /tmp/wrk /tmp/make-wrk.sh
fi
