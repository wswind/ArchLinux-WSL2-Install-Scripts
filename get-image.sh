#!/bin/bash
set -e

programs=("curl" "bsdtar")
for program in "${programs[@]}"
do
    if ! command -v "$program" &> /dev/null; then
        echo "$program is not installed"
        exit 1
    fi
done

if [ ! -d "/tmp/arch" ]; then
    mkdir /tmp/arch
fi

pushd /tmp/arch
curl -# -O https://mirrors.edge.kernel.org/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst
sudo bsdtar -xpf archlinux-bootstrap-x86_64.tar.gz
sudo bsdtar -cpf archlinux-bootstrap.tar -C root.x86_64 .
popd

if [ ! -d "/mnt/c/arch-image" ]; then
    mkdir /mnt/c/arch-image
fi

sudo mv /tmp/arch/archlinux-bootstrap.tar /mnt/c/arch-image
sudo rm -rf /tmp/arch