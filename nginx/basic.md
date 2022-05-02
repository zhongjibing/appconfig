# 添加用户
```sh
useradd -s /bin/false -M nginx
```

> 名称: useradd - 创建一个新用户或更新默认新用户信息
> 
> 用法：useradd [选项] 登录
>       useradd -D
>       useradd -D [选项]
> 
> 选项：
>   -b, --base-dir BASE_DIR       新账户的主目录的基目录
>   -c, --comment COMMENT         新账户的 GECOS 字段
>   -d, --home-dir HOME_DIR       新账户的主目录
>   -D, --defaults                显示或更改默认的 useradd 配置
>   -e, --expiredate EXPIRE_DATE  新账户的过期日期
>   -f, --inactive INACTIVE       新账户的密码不活动期
>   -g, --gid GROUP               新账户主组的名称或 ID
>   -G, --groups GROUPS           新账户的附加组列表
>   -h, --help                    显示此帮助信息并推出
>   -k, --skel SKEL_DIR           使用此目录作为骨架目录
>   -K, --key KEY=VALUE           不使用 /etc/login.defs 中的默认值
>   -l, --no-log-init             不要将此用户添加到最近登录和登录失败数据库
>   -m, --create-home             创建用户的主目录
>   -M, --no-create-home          不创建用户的主目录
>   -N, --no-user-group           不创建同名的组
>   -o, --non-unique              允许使用重复的 UID 创建用户
>   -p, --password PASSWORD       加密后的新账户密码
>   -r, --system                  创建一个系统账户
>   -R, --root CHROOT_DIR         chroot 到的目录
>   -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
>   -s, --shell SHELL             新账户的登录 shell
>   -u, --uid UID                 新账户的用户 ID
>   -U, --user-group              创建与用户同名的组

> 有时系统创建一个服务需要指定用户来运行该服务，但又不希望该用户能登录系统仅仅希望使用该用户来运行指定的服务而已，所以就需要创建一个不能登录，没有家目录的用户，如nginx服务需要创建一个nginx用户来运行worker进程: 
> useradd -s /bin/false -M nginx

# 编译nginx源码安装

```sh
# ./configure --prefix=/opt/nginx --with-http_stub_status_module --with-http_ssl_module
# make & make install
```
