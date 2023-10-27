#!/bin/bash
>/root/hostdie
read -p "将你互信的网段输入" addr
read -p "将你互信的结束地址号输入" fip
read -p "将你要互信的所有主机的密码输入" pw

if [ -z $addr  ];then
   echo "输入不能为空"
fi


if [ "$fip" -lt "1" ] || [ "$fip" -gt "255" ]; then
   echo "输入的结尾号不符合要求"
fi

if [ -z $pw  ];then
   echo "密码输入不能为空"
   fi

for((i=2;i<=fip;i++))
do
{
	ping -w1 -c1 $addr.$i &> /dev/null
	if [ $? -eq 0 ]; then
		echo "$addr.$i live"
       /bin/expect<<-EOF
           spawn scp -r /root/.ssh $addr.$i:/root/
           expect { 
           "yes/no" { send "yes\r" ; exp_continue }
           "password" { send "$pw\r" }
           }
          expect eof
		EOF
	else
		echo "$addr.$i die" >> /root/hostdie
	fi
} &
done
wait
echo "互信成功"
#if [ -z $ip  ];then
#	echo "输入不能为空"
#else
#	ping -w1 -c1 $ip &>/dev/null
#	if [ $? -eq  0 ];then
#		echo "主机存活"
#		/bin/expect<<-EOF
#			spawn scp -r /root/.ssh $ip:/root/
#			expect { 
#			"yes/no" { send "yes\r" ; exp_continue }
#			"password" { send "$pw\r" }
#			}
#			expect eof
#		EOF
#	else
#		echo "主机未存活"
#	fi
#fi
