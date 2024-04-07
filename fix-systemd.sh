#!/bin/bash
sudo systemctl cancel $(sudo systemctl list-jobs | grep running | awk '{print $1}')
sudo systemctl disable systemd-networkd-wait-online