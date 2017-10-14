//
//  AAButtonsView.h
//  AAButtonsDemo
//
//  Created by An An on 2017/8/1.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^AAButtonsViewSelectedButtonBlock)(UIButton *button);
typedef NS_ENUM(NSInteger,AAButtonsViewLayoutType) {
    AAButtonsViewLayoutTypeOrderly = 0,//左右上下对齐
    AAButtonsViewLayoutTypeStaggerly   //参差错落布局
};


@protocol AAButtonsViewDelegate <NSObject>

@optional
- (void)aa_buttonsViewDidSelectedButtonWithTheButton:(UIButton *)selectedButton;
@end

@interface AAButtonsView : UIView


/**
 视图上的按钮的标题数组
 */
@property (nonatomic, strong) NSArray *btnsTitleArr;

/**
 视图上的已被选中的按钮标题数组
 */
@property (nonatomic, strong) NSArray *selectedBtnsTitleArr;

/**
 视图上多个按钮的布局类型
 */
@property (nonatomic, assign) AAButtonsViewLayoutType layoutType;


/**
 视图上按钮被点击后执行的 block 方法
 */
@property (nonatomic, copy) AAButtonsViewSelectedButtonBlock selectedBtnBlock;

/**
 视图上按钮被点击后执行的 delegate 方法
 */
@property (nonatomic, weak) id<AAButtonsViewDelegate> selectedBtnDelegate;

/**
 按钮被点击选中之后的颜色
 */
@property (nonatomic, strong) UIColor *btnSelectedColor;

/**
 按钮的圆角半径
 */
@property (nonatomic, assign) CGFloat btnLayerCornerRadius;

/**
 按钮的字体大小
 */
@property (nonatomic, assign) CGFloat btnFontSize;

/**
 按钮字体颜色
 */
@property (nonatomic, strong) UIColor *btnTextColor;


/**
 是否支持多选
 */
@property (nonatomic, assign) BOOL supppotMultipleSelection;

@end
