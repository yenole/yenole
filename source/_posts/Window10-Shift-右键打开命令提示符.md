---
title: Window10 Shift+右键打开命令提示符
date: 2017-08-30 11:44:57
tags: "window"
categories: "window"
---
## Win+R运行输入regiest.ext
## 依次进入“HKEY_CLASSES_ROOT\Directory\Background\shell”
## 显示命令提示符
 * 右键cmd权限
 * 高级
 * 所有者 改成当前用户
 * 选中“替换子容器和对象的所有者”
 * 确定
 * 添加 当前用户
 * 选中 改成“完全控制”
 * 确定
 * 重命名cmd中“HideBasedOnVelocityId”为“ShowBasedOnVelocityId”
 
## 隐藏Powershell
 * 右键Powershell权限
 * 高级
 * 所有者 改成当前用户
 * 选中“替换子容器和对象的所有者”
 * 确定
 * 添加 当前用户
 * 选中 改成“完全控制”
 * 确定
 * 重命名Powershell中“ShowBasedOnVelocityId”为“HideBasedOnVelocityId”


	
