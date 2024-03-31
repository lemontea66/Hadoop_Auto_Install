#!/usr/bin/env bash
echo net.ipv4.ip_local_port_range = 1024 65535 >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
echo 请查看端口使用范围
cat /proc/sys/net/ipv4/ip_local_port_range