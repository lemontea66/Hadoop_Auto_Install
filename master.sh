#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE="\033[0;35m"
CYAN='\033[0;36m'
PLAIN='\033[0m'

checkroot(){
	[[ $EUID -ne 0 ]] && echo -e "${RED}请使用 root 用户运行本脚本！${PLAIN}" && exit 1
}

preinfo() {
	clear
	echo "———————————————————Hadoop环境一键安装脚本——————————————————"
	echo "       适用系统：CentOS 6.X"
	echo "       更多教程请查阅:  https://www.shujuhe.cn/archives/44/"
	echo "       脚本更新: 2022/03/08"
	echo "       作者：董宇轩 LemonTea"
	echo "——————————————————————————————————————————————————————————————————"
	sleep 3
	echo -e "${RED}水平有误，出现任何问题请立即使用手动配置环境，不要找我麻烦！${PLAIN}！"
	sleep 3
	echo -e "${RED}建议只运行一遍脚本即可，不要多次重复运行，否则大概率会出问题！！${PLAIN}！"
	sleep 3
	clear
}

alert() {
	echo -e "${RED}请将三台机器分别配置好主机名、host、IP后再运行！！否则后果自负${PLAIN}"
	sleep 3
	clear
}

checkwget() {
	if  [ ! -e '/usr/bin/wget' ]; then
	        echo -e "${YELLOW}正在安装 Wget${PLAIN}"
	                yum update > /dev/null 2>&1
	                yum -y install wget > /dev/null 2>&1
				clear
	fi
}

checkjdk() {
	if  [ ! -e '/usr/lib/jvm/jdk1.8.0_05' ]; then
	        echo -e "${YELLOW}正在安装 JDK${PLAIN}"
			sleep 5
			cd /usr/lib/jvm > /dev/null
			wget http://file.shujuhe.cn/jdk-8u5-linux-i586.tar.gz
			tar -zxvf jdk-8u5-linux-i586.tar.gz
			mv ./jdk1.8.0_05 ./default-java
			clear
	        
	fi
}

checkhadoop() {
	if  [ ! -e '/usr/local/hadoop' ]; then
	        echo -e "${YELLOW}正在安装 Hadoop柠檬茶一键安装包${PLAIN}"
			sleep 5
			cd /usr/local
			wget http://file.shujuhe.cn/hadoop.dyx.tar.gz
			tar -zxf hadoop.dyx.tar.gz
			clear
	        
	fi
}

vimprofile() {
	echo -e "${YELLOW}正在配置环境变量${PLAIN}"
			sleep 5
			rm -rf /etc/profile
			cd /etc
			wget http://file.shujuhe.cn/profile
			source /etc/profile
			clear
};

last(){
	echo "———————————————————Hadoop环境一键安装脚本————————————————————————————"
	echo "       适用系统：CentOS 6.X"
	echo "       更多教程请查阅:  https://www.shujuhe.cn/archives/44/"
	echo "       脚本更新: 2022/03/07"
	echo "       作者：董宇轩 LemonTea"
	echo "——————————————————————————————————————————————————————————————————"
	echo -e "       ${GREEN}安装脚本运行完毕${PLAIN}"
	echo -e "       ${RED}强烈建议您运行pi计算以确保安装配置全部完成${PLAIN}"
	echo "       遇到任何问题敬请咨询作者 QQ：845903950"
	echo "       一键脚本只为懒人方便，强烈建议您手动操作进行配置"
	echo "——————————————————————————————————————————————————————————————————"
}



runall() {
	checkroot;
	preinfo;
	alert;
	checkwget;
	checkjdk;
	checkhadoop;
	vimprofile;
	last
}

runall
