# docker-onenav
onenav docker版



## 运行

```bash
docker run -itd -p 3080:80 \
	-e USER='test' -e PASSWORD='test123' \
	-v /data/onenav:/data/wwwroot/default/data \
	helloz/onenav
```

