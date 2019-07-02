# assh
自动登录ssh/sftp脚本，使用 expect ，优化操作和加入配置文件

只限制 linux/Mac 机器使用


linux 系统在开发中连接 ssh 很不方便，没有像 windows 有趁手的客户端，但系统自带的终端很得我心，所以写了这个脚本可以继承原生终端的优点，又可以自动连接服务器


### 第一步，需先安装 expect
```bash
sudo apt install -y expect
// mac
brew install expect
``` 

centos/redhat 系列需先安装

```bash
sudo yum instal -y expect
```

Mac

```bash
brew install expect
``` 

> 其他发行版自行使用包管理安装 `expect` 包

### 第二步，配置服务器连接信息
配置文件位于/项目目录/ssh_hosts.conf，里面有注释说明以及配置格式

### 第三步，运行脚本选择服务器进行连接
```bash
cd 此项目目录
./assh.sh
# 输入序号进行连接(直接回车默认0)
# 如无执行权限，请先  chmod +x run.sh expect.sh
```
### 第四部，配置alias，简化操作
```bash
vi ~/.bashrc
# 最后一行加入
alias assh='/此项目绝对路径/assh.sh'
alias asftp='/此项目绝对路径/asftp.sh'
alias assh_conf='vi /此项目绝对路径/ssh_config.conf'
# 示例
# alias assh='/var/www/assh/assh.sh'

# 即时生效
source ~/.bashrc
```

### Features
- 优化超时，每60秒发送ping包，避免终端假死
- 兼容密码和私钥登录，自行配置
- 使用原生ssh命令，非编程语言接口封装，所以你用的终端是什么样，连接后的操作也是什么样。(比如继承ctrl+c/v)
