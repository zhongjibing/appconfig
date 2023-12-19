# netsh

- ## netsh interface portproxy
  + ### show
    ```
    show all       - 显示所有端口代理参数。
    show v4tov4    - 显示 IPv4 代理连接到另一个 IPv4 端口的参数。
    show v4tov6    - 显示 IPv4 代理连接到 IPv6 的参数。
    show v6tov4    - 显示 IPv6 代理连接到 IPv4 的参数。
    show v6tov6    - 显示 IPv6 代理连接到另一个 IPv6 端口的参数。

    netsh interface portproxy show all
    ```

  + ### add
    ```
    add v4tov4     - 添加通过 IPv4 的 IPv4 和代理连接到的侦听项目
    add v4tov6     - 添加通过 IPv6 的 IPv4 和代理连接到的侦听项目
    add v6tov4     - 添加通过 IPv4 的 IPv6 和代理连接到的侦听项目
    add v6tov6     - 添加通过 IPv6 的 IPv6 和代理连接到的侦听项目

    netsh interface portproxy add v4tov4 [listenport=]<integer>|<servicename>
            [connectaddress=]<IPv4 address>|<hostname>
            [[connectport=]<integer>|<servicename>]
            [[listenaddress=]<IPv4 address>|<hostname>]
            [[protocol=]tcp]
    参数:
        标记            值
        listenport      - IPv4 侦听端口
        connectaddress  - IPv4 连接地址
        connectport     - IPv4 连接端口
        listenaddress   - IPv4 侦听地址
        protocol        - 使用的协议。现在只支持 TCP。
    
    netsh interface portproxy add v4tov4 listenport=6379 listenaddress=0.0.0.0 connectport=6379 connectaddress=172.20.10.4
    ```
    
  + ### delete
    ```
    delete v4tov4  - 删除通过 IPv4 的 IPv4 和代理连接到的侦听项目。
    delete v4tov6  - 删除通过 IPv6 的 IPv4 和代理连接到的侦听项目。
    delete v6tov4  - 删除通过 IPv4 的 IPv6 和代理连接到的侦听项目。
    delete v6tov6  - 删除通过 IPv6 的 IPv6 和代理连接到的侦听项目。
    
    netsh interface portproxy delete v4tov4 [listenport=]<integer>|<servicename>
            [[listenaddress=]<IPv4 address>|<hostname>]
            [[protocol=]tcp]
    参数:
       标记             值
       listenport     - 要侦听的 IPv4 端口。
       listenaddress  - 要侦听的 IPv4 地址。
       protocol       - 要使用的协议。当前仅支持 TCP。
    
    netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=6379
    ```
