#!/bin/bash
set timeout=1
pwd=$(cd `dirname $0`; pwd)
declare -i i=0
while read line
do
	if [[ ${line} == "" || ${line} =~ ^"#" ]]; then
		continue
	fi
	user_info=`echo ${line} |grep @ | cut -d "@" -f 1`
	connection=`echo ${line} | cut -d "@" -f 2`
	# 提取用户名密码
	user[$i]=`echo ${user_info} | cut -d ":" -f 1`
	password[$i]=`echo ${user_info} | cut -d ":" -f 2`
	# 提取连接信息
	address=`echo ${connection} | cut -d "/" -f 1`
	ip[$i]=`echo ${address} | cut -d ":" -f 1`
	port[$i]=`echo ${address} | cut -d ":" -f 2`
	if [[ ${ip[$i]} == ${port[$i]} ]]; then
		port[$i]=22
	fi
	home[$i]=`echo ${connection} | cut -d "/" -f 2-`
	if [[ ${address} == ${home[$i]} ]]; then
		home[$i]="~"
	else
		home[$i]="/"${home[$i]}
	fi

	echo $i: ${user[$i]}@${ip[$i]}:${port[$i]}
	i+=1
done < ${pwd}/ssh_hosts.conf
echo -n "输入序号连接(0): "
read num
#echo ${user[${num}]} ${ip[${num}]} ${port[${num}]} ${password[${num}]} ${home[${num}]}

exec ${pwd}/expect_sftp.sh ${user[${num}]} ${ip[${num}]} ${port[${num}]} ${password[${num}]} ${home[${num}]}
