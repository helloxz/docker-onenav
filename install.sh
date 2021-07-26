#!/bin/sh

#更新软件
apk update
#安装timezone
apk add -U tzdata
#查看时区列表
ls /usr/share/zoneinfo
#拷贝需要的时区文件到localtime
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#查看当前时间
date
#为了精简镜像，可以将tzdata删除了
apk del tzdata
#安装nginx
apk add nginx
#安装PHP
apk add php7 php7-fpm php7-openssl php7-sqlite3 php7-pdo_sqlite php7-curl php7-json php7-session
#安装git
apk add git

#更名php-fpm配置文件
mv /etc/php7/php-fpm.d/www.conf /etc/php7/php-fpm.d/www.conf.bak
#更名PHP配置文件
mv /etc/php7/php.ini /etc/php7/php.ini.bak
#更名nginx配置文件
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak

#复制配置文件
cp /root/site.conf /etc/nginx/conf.d/
cp /root/www.conf /etc/php7/php-fpm.d/
cp /root/nginx.conf /etc/nginx/
cp /root/run.sh /usr/sbin/
#cp /root/php.ini /etc/php7/
#启动脚本赋予权限
chmod +x /usr/sbin/run.sh

#创建目录
mkdir -p /data/wwwroot/default
#创建用户和用户组
#addgroup -S www && adduser -S www -G www
#chown -R www:www /data/wwwroot/default/
#拉取代码
cd /data/wwwroot/default
#git glone https://github.com/helloxz/onenav.git .
rm -rf /data/wwwroot/default/*
git clone https://github.com/helloxz/onenav.git .

apk del git

echo '----------------------------------------------'
echo 'Install Success.'
echo '----------------------------------------------'