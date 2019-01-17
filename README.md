# assh
自动登录ssh脚本，使用 expect ，优化操作和加入配置文件

### 第一步，需先安装 expect
```bash
sudo apt install -y expect
``` 

centos/redhat 系列需先安装

```bash
sudo yum instal -y expect
```

> 其他发行版自行使用包管理安装 `expect` 包

### 第二步，配置服务器连接信息
配置文件位于项目目录/ssh_hosts.conf，里面有注释说明以及配置格式

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
# 示例
# alias assh='/var/www/assh/assh.sh'

# 即时生效
source ~/.bashrc
```