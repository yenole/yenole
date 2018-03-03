---
title: 搭建Redmine
date: 2018-03-03 11:09:51
tags: ['docker']
categories: 'docker'
---

## 搭建Redmine
## 编辑docker-compose.yml文件
```
redmine:
  image: redmine
  external_links:
    - mysql:mysql
  ports:
    - 3000:3000
  environment:
    - REDMINE_DB_MYSQL:mysql
    - REDMINE_DB_PASSWORD:数据库密码
  volumes:
    - /home/xuchao/ymls/redmine/files:/usr/src/redmine/files
```
## 编辑nginx代理
```
server {
  listen 0.0.0.0:80;
  server_name redmine.yenole.com;

  client_max_body_size 100m;
  
  location / {
    proxy_read_timeout      300;
    proxy_connect_timeout   300;
    proxy_redirect          off;
    proxy_buffers 8 8k;
    proxy_buffer_size 32k;
    proxy_busy_buffers_size 32k;

    proxy_set_header    Host                $http_host;
    proxy_set_header    X-Real-IP           $remote_addr;
    proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
    proxy_set_header    X-Frame-Options     SAMEORIGIN;

    proxy_pass http://127.0.0.1:3000;
  }
}
```
## 常用命令
* 启动服务：docker-compose up -d
* 销毁服务：docker-compose down 
* 重启服务：docker-compose restart