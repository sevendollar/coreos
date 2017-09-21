#!/bin/bash
# install matchbox v0.6.1
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

# run matchbox v0.6.1 container
sudo docker run -d --net=host -v /var/lib/matchbox:/var/lib/matchbox:Z -v /etc/matchbox:/etc/matchbox:Z,ro quay.io/coreos/matchbox:latest -address=0.0.0.0:8080 -rpc-address=0.0.0.0:8081 -log-level=debug

# run dnsmasq container
sudo docker run -d --cap-add=NET_ADMIN --net=host quay.io/coreos/dnsmasq -d -q --dhcp-range=10.5.1.101,10.5.1.200 --enable-tftp --tftp-root=/var/lib/tftpboot --dhcp-userclass=set:ipxe,iPXE --dhcp-boot=tag:#ipxe,undionly.kpxe --dhcp-boot=tag:ipxe,http://matchbox.example.com:8080/boot.ipxe --address=/matchbox.example.com/10.5.1.5 --log-queries --log-dhcp
