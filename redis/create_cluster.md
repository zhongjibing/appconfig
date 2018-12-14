# Redis-Cluster 安装

## 1. 下载, 编译, 安装
```shell
cd /opt
wget http://download.redis.io/releases/redis-3.0.3.tar.gz
tar xzf redis-3.0.3.tar.gz
cd redis-3.0.3
make
make install PREFIX=/usr/local/redis

# 创建集群时使用
cp src/redis-trib.rb /usr/local/redis/bin/
```

## 2. 配置目录, 数据目录
```shell
cd /usr/local/redis
mkdir data
mkdir conf
```

## 3. 配置redis节点
在conf下添加6个(7000-7005) redis-${port}.conf作为6个节点的配置文件, 其中7000-7005是六个端口号
```shell
port 7000  
cluster-enabled yes  
cluster-config-file nodes-7000.conf  
cluster-node-timeout 5000  
dir "/usr/local/redis/data/"  
appendonly yes  
appendfilename "appendonly-7000.aof"  
daemonize yes
```

生成另外五个文件
```shell
sed 's/7000/7001/g' redis-7000.conf > redis-7001.conf
sed 's/7000/7002/g' redis-7000.conf > redis-7002.conf
sed 's/7000/7003/g' redis-7000.conf > redis-7003.conf
sed 's/7000/7004/g' redis-7000.conf > redis-7004.conf
sed 's/7000/7005/g' redis-7000.conf > redis-7005.conf
```

## 4. 启动六个节点
```shell
/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis-7000.conf
/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis-7001.conf
/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis-7002.conf
/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis-7003.conf
/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis-7004.conf
/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis-7005.conf
```

查看节点是否都已启动
```shell
root@i-9klcakkw:/usr/local/redis/conf# ps -ef | grep redis
root     19160     1  0 17:40 ?        00:00:00 /usr/local/redis/bin/redis-server *:7000 [cluster]                     
root     19162     1  0 17:40 ?        00:00:00 /usr/local/redis/bin/redis-server *:7001 [cluster]                     
root     19166     1  0 17:40 ?        00:00:00 /usr/local/redis/bin/redis-server *:7002 [cluster]                     
root     19170     1  0 17:40 ?        00:00:00 /usr/local/redis/bin/redis-server *:7003 [cluster]                     
root     19176     1  0 17:40 ?        00:00:00 /usr/local/redis/bin/redis-server *:7004 [cluster]                     
root     19180     1  0 17:40 ?        00:00:00 /usr/local/redis/bin/redis-server *:7005 [cluster]
```

查看单个节点. 此时六个节点是分散的, 没有形成集群, 所有cluster_state=fail
```shell
root@i-9klcakkw:/usr/local/redis/conf# ../bin/redis-cli -c -p 7000
127.0.0.1:7000> cluster info
cluster_state:fail
cluster_slots_assigned:0
cluster_slots_ok:0
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:1
cluster_size:0
cluster_current_epoch:0
cluster_my_epoch:0
cluster_stats_messages_sent:0
cluster_stats_messages_received:0
```

## 5. 使用Redis-Cluster的Ruby工具创建集群
```shell
# 安装ruby
apt-get install ruby
# 安装 redis
gem install redis

# 创建集群
/usr/local/redis/bin/redis-trib.rb create --replicas 1 172.28.0.4:7000 172.28.0.4:7001 172.28.0.4:7002 172.28.0.4:7003 172.28.0.4:7004 172.28.0.4:7005

root@i-9klcakkw:/usr/local/redis# /usr/local/redis/bin/redis-trib.rb create --replicas 1 172.28.0.4:7000 172.28.0.4:7001 172.28.0.4:7002 172.28.0.4:7003 172.28.0.4:7004 172.28.0.4:7005
>>> Creating cluster
Connecting to node 172.28.0.4:7000: OK
Connecting to node 172.28.0.4:7001: OK
Connecting to node 172.28.0.4:7002: OK
Connecting to node 172.28.0.4:7003: OK
Connecting to node 172.28.0.4:7004: OK
Connecting to node 172.28.0.4:7005: OK
>>> Performing hash slots allocation on 6 nodes...
Using 3 masters:
172.28.0.4:7000
172.28.0.4:7001
172.28.0.4:7002
Adding replica 172.28.0.4:7003 to 172.28.0.4:7000
Adding replica 172.28.0.4:7004 to 172.28.0.4:7001
Adding replica 172.28.0.4:7005 to 172.28.0.4:7002
M: aca1d77e41f8ea88ef7da905717e524195b17847 172.28.0.4:7000
   slots:0-5460 (5461 slots) master
M: 71d3a9dd5c1ba0c5afe9349653b0853f1254aa35 172.28.0.4:7001
   slots:5461-10922 (5462 slots) master
M: b4509589971b5ae83f61e3ecff8e7a8de05a74c5 172.28.0.4:7002
   slots:10923-16383 (5461 slots) master
S: dd8a2f7a7ccd9141ce6e654fdf172282cf581b02 172.28.0.4:7003
   replicates aca1d77e41f8ea88ef7da905717e524195b17847
S: def963e2430b6d07a689a3f3eae1b80bd80597ff 172.28.0.4:7004
   replicates 71d3a9dd5c1ba0c5afe9349653b0853f1254aa35
S: a095d5fef87c205d0265032855677466ba88bce8 172.28.0.4:7005
   replicates b4509589971b5ae83f61e3ecff8e7a8de05a74c5
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join...
>>> Performing Cluster Check (using node 172.28.0.4:7000)
M: aca1d77e41f8ea88ef7da905717e524195b17847 172.28.0.4:7000
   slots:0-5460 (5461 slots) master
M: 71d3a9dd5c1ba0c5afe9349653b0853f1254aa35 172.28.0.4:7001
   slots:5461-10922 (5462 slots) master
M: b4509589971b5ae83f61e3ecff8e7a8de05a74c5 172.28.0.4:7002
   slots:10923-16383 (5461 slots) master
M: dd8a2f7a7ccd9141ce6e654fdf172282cf581b02 172.28.0.4:7003
   slots: (0 slots) master
   replicates aca1d77e41f8ea88ef7da905717e524195b17847
M: def963e2430b6d07a689a3f3eae1b80bd80597ff 172.28.0.4:7004
   slots: (0 slots) master
   replicates 71d3a9dd5c1ba0c5afe9349653b0853f1254aa35
M: a095d5fef87c205d0265032855677466ba88bce8 172.28.0.4:7005
   slots: (0 slots) master
   replicates b4509589971b5ae83f61e3ecff8e7a8de05a74c5
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

## 6. 确认集群是否安装成功
```shell
root@i-9klcakkw:/usr/local/redis# bin/redis-cli -c -p 7000
127.0.0.1:7000> cluster info
cluster_state:ok
cluster_slots_assigned:16384
cluster_slots_ok:16384
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:6
cluster_size:3
cluster_current_epoch:6
cluster_my_epoch:1
cluster_stats_messages_sent:875
cluster_stats_messages_received:875
```

查看slots使用情况
```shell
127.0.0.1:7000> cluster slots
1) 1) (integer) 0
   2) (integer) 5460
   3) 1) "172.28.0.4"
      2) (integer) 7000
   4) 1) "172.28.0.4"
      2) (integer) 7003
2) 1) (integer) 5461
   2) (integer) 10922
   3) 1) "172.28.0.4"
      2) (integer) 7001
   4) 1) "172.28.0.4"
      2) (integer) 7004
3) 1) (integer) 10923
   2) (integer) 16383
   3) 1) "172.28.0.4"
      2) (integer) 7002
   4) 1) "172.28.0.4"
      2) (integer) 7005
```
