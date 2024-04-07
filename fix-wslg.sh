#!/bin/bash
echo \
'# Type Path           Mode UID  GID  Age Argument
L+     /tmp/.X11-unix -    -    -    -   /mnt/wslg/.X11-unix' | sudo tee /etc/tmpfiles.d/wslg.conf