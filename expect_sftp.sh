#!/usr/bin/expect
set user [lindex $argv 0]
set ip [lindex $argv 1]
set port [lindex $argv 2]
set password [lindex $argv 3]
set home [lindex $argv 4]
set timeout 10
if { [regexp -nocase "/" $password] } {
	spawn sftp -o ServerAliveInterval=60 -P ${port} -i ${password} ${user}@${ip}
} else {
	spawn sftp -o ServerAliveInterval=60 -P ${port} ${user}@${ip}
}

# 判断条件，发送交互数据,
expect {
	timeout {puts "timeout"; exit}
	"*yes/no"	{send "yes\r"; exp_continue}
	"*password:" {send "${password}\r"; exp_continue}
	"sftp*" {send "cd ${home}\r"}
}
# 启用交互
interact
