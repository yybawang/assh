#!/bin/bash
source /etc/os-release
case $ID in
debian|ubuntu|devuan)
    sudo apt-get install -y expect
    ;;
centos|fedora|rhel)
    yumdnf="yum"
    if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0; then
        yumdnf="dnf"
    fi
    sudo $yumdnf install -y expect
    ;;
esac

case $ID_LIKE in
debian|ubuntu|devuan)
    sudo apt-get install -y expect
    ;;
centos|fedora|rhel)
    yumdnf="yum"
    if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0; then
        yumdnf="dnf"
    fi
    sudo $yumdnf install -y expect
    ;;
*)
    echo "该自动脚本不支持此发行版，请手动安装";
    exit 1
    ;;
esac

git clone https://github.com/yybawang/assh.git
cd assh

echo "alias assh='`pwd`/assh.sh'" >> ~/.bashrc
echo "alias assh_config='vi `pwd`/ssh_hosts.conf'" >> ~/.bashrc
# 不会立即生效
source ~/.bashrc