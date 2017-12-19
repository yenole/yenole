---
title: SSH正向和反向代理
date: 2017-12-19 14:29:28
tags: ['linux']
categories: 'linux'
---

## 正向代理
```
ssh -L l_host:port:s_host:port use@s_host
```

## 反向代理
```
ssh -R s_host:port:l_host:port use@s_host
```

## 备注
 * -N 不执行命令
 * -f 后台执行