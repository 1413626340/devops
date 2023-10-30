#!/bin/bash
Czombie=`top -b -n 1 | grep Tasks | awk '{print $10}'`
Cuser=`top -b -n 1 | grep Cpu | awk '{ print $2 }'`
Csys=`top -b -n 1 | grep Cpu | awk '{ print $4 }'`
TMem=`top -b -n 1 | grep "KiB Mem" | awk '{ print $4}'`
FMem=`top -b -n 1 | grep "KiB Mem" | awk '{ print $6}'`
UMem=`top -b -n 1 | grep "KiB Mem" | awk '{ print $8}'`

echo "僵尸进程数:$Czombie"
echo "用户占用CPU率:$Cuser"
echo "系统占用CPU率:$Csys"
echo "总物理内存:$TMem"
echo "空闲物理内存:$FMem"
echo "正在使用的物理内存:$UMem"
