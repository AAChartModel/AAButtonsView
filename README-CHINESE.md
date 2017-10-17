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

### 使用方法
``` objective-c
    AAButtonsView *btnsView = [[AAButtonsView alloc]init];
    btnsView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-300);
    btnsView.backgroundColor = [UIColor lightGrayColor];
    btnsView.layoutType = AAButtonsViewLayoutStaggerly;//设置按钮的布局样式为流式布局
    btnsView.selectionType = AAButtonsViewSelectionMultiple;//设置视图的按钮是多选类型
    NSArray *wholeContentArr = @[@"AAChartKit",
                                 @"AAChartKit-Swift",
                                 @"AAButtonsView",
                                 @"Python",
                                 @"Java",
                                 @"AAUniversalTableViewCell",
                                 @"AACategory",
                                 @"AAMapStudio",
                                 @"AAChartKit-Slim",
                                 @"AATextWatchdog",
                                 @"风之旅人",
                                 @"闪客",
                                 @"忍者龙剑传",
                                 @"合金弹头",
                                 @"机械迷城",
                                 @"世界大战の勇敢的心",
                                 @"Frame",
                                 @"纸境",
                                 @"Limbo",
                                 @"inside",
                                 @"神秘海域",
                                 @"最后生还者",
                                 @"仁王",
                                 @"血源",
                                 @"孤岛危机",
                                 @"看火人",
                                 @"半条命",
                                 @"饥荒"];
    btnsView.btnsTitleArr = wholeContentArr;//设置视图上的按钮内容数组
    [self.view addSubview:btnsView];
    
    btnsView.selectedBtnBlock = ^(UIButton *button) {//视图上按钮被点击的 block 回调事件
        NSLog(@"当前点击的按钮的标题是 %@",button.titleLabel.text);
        
    };
```

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



## 使用证书

 AAButtonsView is CAAopyright (c) 2017 An An and released as open source under the attached [MIT LICENSE](https://github.com/AAChartModel/AAButtonsView/blob/master/LICENSE).

## 贡献者

This project exists thanks to all the people who contribute. [[Contribute]](https://github.com/onevcat/AAButtonsView/blob/master/CONTRIBUTING.md).
<a href="https://github.com/AAChartModel/AAButtonsView/graphs/contributors"><img src="https://opencollective.com/AAButtonsView/contributors.svg?width=890" /></a>

## 代办清单
- [ ]  支持即时获得`AAButtonsView`动态高度
- [ ]  支持更多的按钮样式自定义选项
- [ ]  支持`AAButtonsViewLayout`自定义布局类
- [ ]  支持高效绘制按钮的圆角效果
- [ ]  支持`Cocoapods`导入
- [ ]  编写`AAButtonsView`的`Swift`版本
- [ ]  编写完整的English Introduction




