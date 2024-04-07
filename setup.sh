#!/bin/bash
set -e

# locale
sed -i \
-e "s/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" \
-e "s/^#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/" \
/etc/locale.gen

locale-gen

echo 'LANG=en_US.UTF-8' > /etc/locale.conf

# pacman
echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
pacman-key --init && pacman-key --populate
pacman -Sy --noconfirm archlinux-keyring && pacman -Su --noconfirm

# uninstall packages
pacman -R --noconfirm arch-install-scripts

# install packages
pacman -S --needed --noconfirm vim sudo wget man base-devel pacman-contrib

# create user
read -p "Please enter your username: " username
sed -i -e "s/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/" /etc/sudoers
useradd $username -m -G wheel -s /bin/bash
echo "password for $username"
passwd $username

# default user, enable systemd
echo -e "[user]\ndefault=$username\n[boot]\nsystemd=true" > /etc/wsl.conf

# docker
pacman -S --needed --noconfirm docker
usermod -aG docker $username

mkdir /etc/docker

MIRROR=http://hub-mirror.c.163.com
cat << EOF > /etc/docker/daemon.json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "registry-mirrors": ["$MIRROR"]
}
EOF