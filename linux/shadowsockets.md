## instal

### conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda config --set auto_activate_base false

conda create -n proxy python=3.8
conda activate proxy

pip install git+https://github.com/shadowsocks/shadowsocks.git@master

### edit shadowsocks.json and set env variable LD_LIBRARY_PATH 
sudo find / -name "libcrypto.a"

### start with conf
/home/ubuntu/miniconda3/envs/proxy/bin/ssserver -c /etc/shadowsocks.json


## .bashrc
```
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/home/ubuntu/miniconda3/pkgs/openssl-3.0.16-h5eee18b_0/lib:/home/ubuntu/miniconda3/envs/proxy/lib:/home/ubuntu/miniconda3/lib2:$LD_LIBRARY_PATH
alias cap='conda activate proxy'
alias sp='cap && cd /home/ubuntu/miniconda3/lib2 && sudo -E /home/ubuntu/miniconda3/envs/proxy/bin/ssserver -c /etc/shadowsocks.json'
```


## /etc/shadowsocks.json
```
{
    "server": "0.0.0.0",
    "server_port": 121,
    "password": "123456",
    "method": "aes-256-gcm"
}
```


## client
https://github.com/shadowsocks/shadowsocks-windows/releases