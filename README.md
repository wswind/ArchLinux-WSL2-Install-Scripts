本仓库用于在 Windows WSL 环境中，安装 ArchLinux。[For English](https://github.com/wswind/ArchLinux-WSL2-Install-Scripts/tree/en)

使用方法：
1. Git 克隆到本地后，通过 Ubuntu 或 Debian WSL 发行版运行 get-image.sh 打包rootfs，运行前需安装 curl 与 bsdtar。打包的 rootfs 文件会存放至：C:\arch-image\archlinux-bootstrap.tar
2. 运行 setup.cmd 导入 rootfs 文件，并进行系统配置。
3. 你可手动调用 fix-systemd.sh，fix-wslg.sh 等脚本处理 wsl 配置问题。
