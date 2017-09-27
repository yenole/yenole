---
title: npm淘宝源
date: 2017-09-27 10:37:42
tags: ['nodejs','npm']
categories: 'javascript'
---
## 使用国内源（推荐）
 * npm config set registry https://registry.npm.taobao.org
 * npm info underscore 如果上面配置正确这个命令会有字符串response）

## 命令行绑定方式
 * npm --registry https://registry.npm.taobao.org info underscore

## 配置“~/.npmrc”方式
 * registry = https://registry.npm.taobao.org