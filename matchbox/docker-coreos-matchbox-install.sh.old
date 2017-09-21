#!/bin/bash
# matchbox v0.6.1
rm -rf {matchbox-v0.6.1-linux-amd64,matchbox-v0.6.1-linux-amd64.tar.gz} && \
curl -LO https://github.com/coreos/matchbox/releases/download/v0.6.1/matchbox-v0.6.1-linux-amd64.tar.gz && \
tar zxvf matchbox-v0.6.1-linux-amd64.tar.gz && rm -rf matchbox-v0.6.1-linux-amd64.tar.gz && \
cd matchbox-v0.6.1-linux-amd64/scripts/tls/ && \
export SAN=DNS.1:matchbox.example.com,IP.1:10.5.1.5 && \
./cert-gen && \
sudo mkdir -p /etc/matchbox && \
sudo cp ca.crt server.crt server.key client.crt client.key /etc/matchbox && \
cd ../../.. && rm -rf matchbox-v0.6.1-linux-amd64 && \
sudo mkdir -p /var/lib/matchbox/assets

