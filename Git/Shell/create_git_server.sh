#!/bin/bash
# ==============================
# author 余小波 https://edk24.com
# date 2019-10-25 02:19
# ==============================

if [ `whoami` != "root" ];then
	echo "Please run with sudo permission!";
    exit 0;
fi

#create group if not exists
egrep "^git" /etc/group >& /dev/null
if [ $? -ne 0 ]
then
    groupadd git
fi

#create user if not exists
egrep "^git" /etc/passwd >& /dev/null
if [ $? -ne 0 ]
then
    useradd -g git git
else
    usermod -a -G git git
fi

echo "请输入仓库名称(webapp):";
printf "/home/git/";
read target;

echo "请输入部署目录 (如/www/wwwroot/edk24.com):";
read build;

echo "请输入密钥(可忽略):";
read keyw;

if [ ! -d "/home/git" ]; then
  mkdir /home/git
fi

if [ ! -d "/home/git/.ssh" ]; then
  mkdir /home/git/.ssh
fi
echo "$keyw" >> /home/git/.ssh/authorized_keys;
cd /home/git
git init --bare $target.git
echo '#!/bin/bash' > /home/git/$target.git/hooks/post-receive;
echo "git --work-tree=$build checkout -f" >> /home/git/$target.git/hooks/post-receive;



chmod +x /home/git/$target.git/hooks/post-receive
chown -R git:git /home/git/$target.git
chmod -R 755 /home/git
chmod -R 755 $build

echo "successify!";
echo "";
echo "=================================";
echo "";
echo -e "\033[31m your git url: git clone git@your_server_ip:/home/git/$target.git \033[0m";
echo "";
echo -e "\033[31m Password free login: Append the key(id_ras.pub) to the file '/home/git/.ssh/authorized_keys', and save it. \033[0m";
echo "";
echo "=================================";
echo "author yuxiaobo (https://edk24.com)";
echo "";
echo "";