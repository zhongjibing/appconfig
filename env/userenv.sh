# Global user environment variable definition

# JAVA
export JAVA_HOME=/usr/java/default
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin

# SCALA
export SCALA_HOME=/usr/share/scala

PATH=$PATH:$SCALA_HOME/bin

# ZOOKEEPER
export ZOO_HOME=/usr/local/zookeeper-3.4.9

#PATH=$PATH:$ZOO_HOME/bin

# KAFKA
export KAFKA_HOME=/usr/local/kafka_2.12-0.10.2.0

#PATH=$PATH:$KAFKA_HOME/bin

# HADOOP
export HADOOP_HOME=/usr/local/hadoop-2.7.3

# SPARK
export SPARK_HOME=/usr/local/spark-2.1.0-bin-hadoop2.7

# HBASE
export HBASE_HOME=/usr/local/hbase-1.2.4

# ACTIMEMQ_HOME
export ACTIVEMQ_HOME=/usr/local/apache-activemq-5.14.4

# REDIS_HOME
export REDIS_HOME=/usr/local/redis-3.2.8

# MYSQL
export MYSQL_HOME=/usr/local/mysql

PATH=$PATH:$MYSQL_HOME/bin

# export PATH
export PATH

