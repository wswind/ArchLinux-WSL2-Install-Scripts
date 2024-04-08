#!/bin/bash
sudo systemctl disable $(systemctl list-unit-files --state=enabled --quiet | awk '{print $1}')