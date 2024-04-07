#!/bin/bash
sudo unlink /etc/resolv.conf
echo "nameserver 119.29.29.29" | sudo tee /etc/resolv.conf

echo '[network]
generateResolvConf=false' | sudo tee -a /etc/wsl.conf
