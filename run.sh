#!/bin/sh
##########		name:Onenav容器运行入口			##########
##########		update:2022/04/23				##########
##########		author:xiaoz<xiaoz93@outlook.com>	######

onenav_path='/data/wwwroot/default'

#start php-fpm
php-fpm7 -RD
#start nginx
/usr/sbin/nginx
tail -f /var/log/nginx/error.log