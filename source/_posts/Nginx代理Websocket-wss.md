---
title: 'Nginx代理Websocket(''wss://'')'
date: 2017-08-21 19:54:18
tags: ["nginx","websocket"]
categories: ['linux','nginx']
---

``` conf
server {
    listen 443;
    server_name domain.com;

    // 配置证书
    ssl on;
    ssl_certificate     ./ssl/lee.crt;
    ssl_certificate_key ./ssl/lee.key;

    // wss://domain.com/127.0.0.1/8090/ 解析出IP和PORT并代理
    location /wss {
        rewrite '^/wss/(.*)/(.*)$' /wss;
        set $wss_ip $1;
        set $wss_port $2;
        break;

        access_log off;
        proxy_pass http://$wss_ip:$wss_port;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        # WebSocket support (nginx 1.4)
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
