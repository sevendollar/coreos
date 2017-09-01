#!/bin/bash
# matchbox v0.6.1
curl -sLO https://github.com/coreos/matchbox/releases/download/v0.6.1/matchbox-v0.6.1-linux-amd64.tar.gz && \
tar zxvf matchbox-v0.6.1-linux-amd64.tar.gz && rm -rf matchbox-v0.6.1-linux-amd64.tar.gz && \
cd matchbox-v0.6.1-linux-amd64/scripts/tls/ && \
export SAN=DNS.1:matchbox.example.com && \
./cert-gen && \
sudo mkdir -p /etc/matchbox && \
sudo cp ca.crt server.crt server.key client.crt client.key /etc/matchbox && \
sudo mkdir -p /var/lib/matchbox/assets && \
sudo docker run -d --net=host -v /var/lib/matchbox:/var/lib/matchbox:Z -v /etc/matchbox:/etc/matchbox:Z,ro quay.io/coreos/matchbox:latest -address=0.0.0.0:8080 -rpc-address=0.0.0.0:8081 -log-level=debug
