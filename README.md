# devops Centos7的环境初始化 包括时间同步 从防火墙关闭 本地yum源 ssh互信
ssh.sh 使用之前 创建/root/hostdie 并且ssh-keygen已经执行过了(已测试)

init.sh使用之前 确保chrony.conf已经移动到/root目录下了(未测试)

yum.sh 需要yum命令 挂载的是本地盘sr0(已测试)
