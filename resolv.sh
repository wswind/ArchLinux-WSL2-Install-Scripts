#!/bin/bash
sudo unlink /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf

echo '[network]
generateResolvConf=false' | sudo tee -a /etc/wsl.conf
