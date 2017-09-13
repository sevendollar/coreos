#!/bin/bash

curl -LO http://10.5.15.66:32772/etcd3-server/etcd-2.json
sudo coreos-install -d /dev/sda -C stable -i etcd-2.json -o vmware_raw
sudo systemctl reboot
