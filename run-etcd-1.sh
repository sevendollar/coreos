#!/bin/bash

curl -LO http://10.5.15.66:32772/etcd-1.json
sudo coreos-install -d /dev/sda -C stable -i etcd-1.json -o vmware_raw
sudo systemctl reboot
