FROM alpine:3.12

WORKDIR /root
#复制启动文件
COPY *.sh /root/
RUN sh install.sh
# 复制zdir配置文件
COPY *.conf /root/
#复制nginx配置文件
#COPY ./nginx.conf /etc/nginx
# 复制php.ini
COPY ./php.ini /etc/php7/
# 复制php-fpm配置
#COPY ./www.conf /etc/php7/php-fpm.d/
VOLUME /data/wwwroot/default/data
EXPOSE 80