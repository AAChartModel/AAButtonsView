# AAButtonsView
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAButtonsView/blob/master/LICENSE)
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAButtonsView)
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAButtonsView)
[![](https://img.shields.io/badge/support-Swift-orange.svg)](https://github.com/AAChartModel/AAButtonsView-Swift)
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAButtonsView/blob/master/README-CHINESE.md)
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAButtonsView)

[中文文档](https://github.com/AAChartModel/AAButtonsView/blob/master/README-CHINESE.md)  |  [English Introduction](https://github.com/AAChartModel/AAButtonsView)
[TOC]

## 功能特点


- [x]  支持视图上按钮`点击事件回调`,可自由选择`代理`事件和 `block`回调
- [x]  支持视图`上下左右布局`和`流式布局`样式
- [x]  支持自由设置视图`单选`或`多选`功能
- [x]  支持`自定义`视图按钮样式
- [x]  支持`记忆`上一次点击按钮功能
- [x]  支持` iOS 6`及以上环境



### 视图中多个按钮的对齐方式 `AAButtonsViewLayout`

``` objective-c
typedef NS_ENUM(NSInteger,AAButtonsViewLayout) {
AAButtonsViewLayoutOrderly = 0,//左右上下对齐
AAButtonsViewLayoutStaggerly   //参差错落布局
};
```

1. 左右上下对齐
![](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAButtonsViewImageResource/上下左右对齐.png)



2. 参差错落布局
![](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAButtonsViewImageResource/参差错落样式.png)


### 视图支持的选择类型 `AAButtonsViewSelection`

``` objective-c
typedef NS_ENUM(NSInteger,AAButtonsViewSelection) {
AAButtonsViewSelectionSingle = 0, //仅仅支持单选
AAButtonsViewSelectionMultiple    //支持多选
};
```
1.  仅仅支持单选
![](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAButtonsViewImageResource/单选按钮.png)
2. 支持多选
![](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAButtonsViewImageResource/多选按钮.png)

## 安装
### 手动安装
1. 下载`AAButtonsView`文件夹内的所有内容
2. 将`AAButtonsView`内的源文件拖放添加至你的工程中
3. 导入`AAButtonsView.h`

### CocoaPods导入
1. 在 `Podfile` 中添加` pod 'AAButtonsView'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入` AAButtonsView.h`。

## 作者
An An 
```java

                       _oo0oo_
                      o8888888o
                      88" . "88
                      (| -_- |)
                      0\  =  /0
                    ___/`---'\___
                  .' \\|     |// '.
                 / \\|||  :  |||// \
                / _||||| -:- |||||- \
               |   | \\\  -  /// |   |
               | \_|  ''\---/''  |_/ |
               \  .-\__  '-'  ___/-. /
             ___'. .'  /--.--\  `. .'___
          ."" '<  `.___\_<|>_/___.' >' "".
         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
         \  \ `_.   \_ __\ /__ _/   .-` /  /
     =====`-.____`.___ \_____/___.-`___.-'=====
                       `=---='
*******************************************************
     ¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥
         €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
               $$$$$$$$$$$$$$$$$$$$$$$  
                   BUDDHA_BLESS_YOU       
                      AWAY_FROM
                         BUG

```



## LICENSE

 AAButtonsView is CAAopyright (c) 2017 An An and released as open source under the attached [MIT LICENSE](https://github.com/AAChartModel/AAButtonsView/blob/master/LICENSE).


