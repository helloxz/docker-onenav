# docker-onenav
onenav docker版



## 运行

```bash
docker run -itd -p 5080:80 \ 
	-e USER='xiaoz' -e PASSWORD='1993' \
	-v /data/onenav:/data/wwwroot/default/data
    temp/onenav:10
```

