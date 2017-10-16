# AAButtonsView
## 功能特点


- [x]  支持视图上按钮点击事件回调,可自由选择代理事件和 block 回调
- [x]  支持视图上下左右布局和流式布局样式
- [x]  支持自定义视图按钮样式
- [x] 支持记忆上一次点击按钮功能
- [x]  支持 iOS 6及以上环境



视图中多个按钮的对齐方式 `AAButtonsViewLayout`

``` objective-c
typedef NS_ENUM(NSInteger,AAButtonsViewLayout) {
AAButtonsViewLayoutOrderly = 0,//左右上下对齐
AAButtonsViewLayoutStaggerly   //参差错落布局
};
```

##### 左右上下对齐



##### 参差错落布局


视图支持的选择类型 `AAButtonsViewSelection`

``` objective-c
typedef NS_ENUM(NSInteger,AAButtonsViewSelection) {
AAButtonsViewSelectionSingle = 0, //仅仅支持单选
AAButtonsViewSelectionMultiple    //支持多选
};
```
##### 仅仅支持单选

##### 支持多选

### 作者
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



### LICENSE

 AAButtonsView is CAAopyright (c) 2017 An An and released as open source under the attached [MIT LICENSE](https://github.com/AAChartModel/AAButtonsView/blob/master/LICENSE).



