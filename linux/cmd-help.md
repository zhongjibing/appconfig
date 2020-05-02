## linux 命令

#### du 显示目录或文件的大小
 - 显示目录或者文件所占空间
 ```
 # du
 608     ./test6
 308     ./test4
 4       ./scf/lib
 4       ./scf/service/deploy/product
 4       ./scf/service/deploy/info
 12      ./scf/service/deploy
 16      ./scf/service
 4       ./scf/doc
 4       ./scf/bin
 32      ./scf
 8       ./test3
 1288    .
 ```

 - 显示指定文件所占空间
 ```
 # du log2012.log 
 300     log2012.log
 ```
 
 - 以K，M，G为单位, 显示目录或者文件所占空间
 ```
 # du -h test
 608K    test/test6
 308K    test/test4
 4.0K    test/scf/lib
 4.0K    test/scf/service/deploy/product
 4.0K    test/scf/service/deploy/info
 12K     test/scf/service/deploy
 16K     test/scf/service
 4.0K    test/scf/doc
 4.0K    test/scf/bin
 32K     test/scf
 8.0K    test/test3
 1.3M    test
 ```
 
 - 显示总计占用空间
 ```
 # du -sh test
 22M     test
 ```
 
