#!/usr/bin/env bash
echo net.ipv4.ip_local_port_range = 1024 65535 >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
cat /proc/sys/net/ipv4/ip_local_port_range
