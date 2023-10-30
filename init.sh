

#!/bin/bash
#防火墙
systemctl stop firewalld.service
systemctl disabled firewalld.service
systemctl stop NetworkManager
systemctl disabled  NetworkManager
setenforce 0
sed -ri '/^SELINUX/c SELINUX=disabled' /etc/selinux/config

#chrony 
cp /root/chrony.conf /etc/chrony.conf
systemctl restart chronyd && systemctl enable chronyd
