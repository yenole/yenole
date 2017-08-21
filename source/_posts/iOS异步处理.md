---
title: iOS异步处理
date: 2017-08-21 20:49:28
tags: ["iOS","objc","async"]
categories: 代码收集
---
``` object-c
dispatch_async(dispatch_get_global_queue(0, 0), ^{ 
    // 处理耗时操作的代码块... 
    
    //通知主线程刷新 
    dispatch_async(dispatch_get_main_queue(), ^{ 
        //回调或者说是通知主线程刷新， 
    }); 

});
```