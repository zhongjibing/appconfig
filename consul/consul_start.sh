#!/bin/bash

consul_home='/opt/consul'
consul_run="$consul_home/consul"
consul_data="$consul_home/data"
consul_log="$consul_home/log"

rm -rf $consul_data/*
nohup $consul_run agent -dev -data-dir=$consul_data 2>&1 1>$consul_log/consul.log &
