## Nginx配置转发

##### 首先是location进行的是模糊匹配

1) 没有"/"时, location /abc/def 可以匹配 /abc/defghi 请求, 也可以匹配 /abc/def/ghi 等
2) 而有"/"时, location /abc/def/ 不能匹配 /abc/defghi 请求, 只能匹配 /abc/def/anything 这样的请求

##### 下面四种情况分别用http://192.168.1.4/proxy/test.html 进行访问。
- 第一种：
```
location  /proxy/ {
    proxy_pass http://127.0.0.1:81/;
}
```
结论：会被代理到http://127.0.0.1:81/test.html 这个url

- 第二种(相对于第一种，最后少一个 /)
```
location  /proxy/ {
    proxy_pass http://127.0.0.1:81;
}
```
结论：会被代理到http://127.0.0.1:81/proxy/test.html 这个url

- 第三种：
```
location  /proxy/ {
    proxy_pass http://127.0.0.1:81/ftlynx/;
}
```
结论：会被代理到http://127.0.0.1:81/ftlynx/test.html 这个url。

- 第四种(相对于第三种，最后少一个 / )：
```
location  /proxy/ {
    proxy_pass http://127.0.0.1:81/ftlynx;
}
```

结论：会被代理到http://127.0.0.1:81/ftlynxtest.html 这个url
