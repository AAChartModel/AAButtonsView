//
//  AAButtonsView.h
//  AAButtonsDemo
//
//  Created by An An on 2017/8/1.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AAButtonsViewLayoutType) {
    AAButtonsViewLayoutTypeOrderly = 0,
    AAButtonsViewLayoutTypeStaggered
};

@protocol AAButtonsViewDelegate <NSObject>

@required
- (void)aaButtonsViewDidSelectedButtonWithTheTag:(NSInteger)selectedButtonTag;

@end

@interface AAButtonsView : UIView

@property (nonatomic, strong) UIColor *buttonsColor;
@property (nonatomic, strong) NSArray *titlesArr;
@property (nonatomic, assign) AAButtonsViewLayoutType layoutType;
@property (nonatomic, weak) id<AAButtonsViewDelegate> delegate;

@end
