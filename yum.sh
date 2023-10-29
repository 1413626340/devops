#!/bin/bash
Path=/etc/yum.repos.d
mkdir $Path/repo.bak
mv $Path/*  $Path/repo.bak/

cat <<EOF>$Path/Base.repo
[base]
name=CentOS-$releasever - Base
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
baseurl=file:///mnt/AppStream
gpgcheck=0
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1
EOF

yum clean all
yum makecache
