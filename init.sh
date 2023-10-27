#!/bin/bash
#防火墙
systemctl stop firewalld.service
systemctl disabled firewalld.service
systemctl stop NetworkMnager
systemctl disabled  NetworkMnager
setenforce 0
sed -ri '/^SELINUX/c SELINUX=disabled' /etc/selinux/config

#chrony 
cp /root/chrony.conf /etc/chrony.conf
sysyemctl restart chronyd && systemctl enable chronyd


