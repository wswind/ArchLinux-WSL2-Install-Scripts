Inspired by ArchWSL: https://github.com/yuk7/ArchWSL-FS/blob/main/Makefile

Help scripts to install ArchLinux on WSL2 with docker preinstalled.

How to use:
```
# run on wsl to get rootfs image
# image downloaded to C:\arch-image\archlinux-bootstrap.tar
# curl and bsdtar are needed
./get-image.sh

# run on windows to import the image
setup.cmd
```

Fix systemd issue and enable docker:  
https://github.com/yuk7/ArchWSL/issues/356#issuecomment-2040997626

```
sudo systemctl list-jobs | grep running
sudo systemctl cancel <job-number>
sudo systemctl disable systemd-networkd-wait-online

wsl --shutdown

sudo systemctl enable docker
```

Fix wslg issue:
https://github.com/yuk7/ArchWSL/issues/342
https://github.com/microsoft/wslg/issues/43#issuecomment-826039096

```
echo 'L+     /tmp/.X11-unix -    -    -    -   /mnt/wslg/.X11-unix' | sudo tee /etc/tmpfiles.d/wslg.conf
```

For Chinese users: https://github.com/wswind/ArchLinux-WSL2-Install-Scripts/tree/cn