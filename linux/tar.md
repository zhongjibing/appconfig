## 压缩解压命令: tar

命令名称: tar  
命令所在路径: /bin/tar  
执行权限: 所有用户  

### tar 压缩
语法: tar 选项[cvf] [目录]  
> -c 产生tar打包文件  
> -v 显示详细信息  
> -f 指定压缩后的文件名  
> -z 打包同时压缩

功能描述: 打包目录
压缩后文件格式: .tar.gz

- 将目录dir1压缩成一个打包并压缩文件
```
$ tar -zcvf dir1.tar.gz dir1
```

### tar 解压缩
语法: tar 选项[xvf] 文件  
> -x 解包.tar文件  
> -v 显示详细信息  
> -f 指定解压文件  
> -z 解压缩

- 将dir1解压缩到当前目录
```
$ tar -zxvf dir1.tar.gz
```
