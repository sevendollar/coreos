#!/bin/bash
# dnsmasq
sudo docker run -d --cap-add=NET_ADMIN --net=host quay.io/coreos/dnsmasq -d -q --dhcp-range=10.5.1.101,10.5.1.200 --enable-tftp --tftp-root=/var/lib/tftpboot --dhcp-userclass=set:ipxe,iPXE --dhcp-boot=tag:#ipxe,undionly.kpxe --dhcp-boot=tag:ipxe,http://matchbox.cvl.com.tw:8080/boot.ipxe --address=/matchbox.cvl.com.tw/10.5.1.5 --log-queries --log-dhcp
