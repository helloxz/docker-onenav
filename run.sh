#!/bin/sh
##########		name:Onenav容器运行入口			##########
##########		update:2021/03/22				##########
##########		author:xiaoz<xiaoz93@outlook.com>	######

onenav_path='/data/wwwroot/default'

#复制onenav配置
if [ ! -f "${onenav_path}/data/config.php" ]
	then
		cp ${onenav_path}/config.simple.php ${onenav_path}/data/config.php
		cp ${onenav_path}/db/onenav.simple.db3 ${onenav_path}/data/onenav.db3
		cp -r ${onenav_path}/db/index.html ${onenav_path}/db/
		cd ${onenav_path}
		sed -i "s%xiaoz'%${USER}'%g" data/config.php
		sed -i "s%xiaoz.me'%${PASSWORD}'%g" data/config.php
		#start php-fpm
		php-fpm7 -D
		#start nginx
		/usr/sbin/nginx
		tail -f /var/log/nginx/error.log
	else
		#start php-fpm
		php-fpm7 -D
		#start nginx
		/usr/sbin/nginx
		tail -f /var/log/nginx/error.log
fi