#!/bin/sh
##########		name:Onenav容器运行入口			##########
##########		update:2021/03/22				##########
##########		author:xiaoz<xiaoz93@outlook.com>	######

onenav_path='/data/wwwroot/default'

#start php-fpm
php-fpm7 -RD
#start nginx
/usr/sbin/nginx
# 设置DNS
echo "nameserver 223.5.5.5" > /etc/resolv.conf
echo "nameserver 119.29.29.29" >> /etc/resolv.conf
tail -f /var/log/nginx/error.log
