//
//  AAButtonsView.m
//  AAButtonsDemo
//
//  Created by An An on 2017/8/1.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAButtonsView.h"
#define AAScreenWidth    [UIScreen mainScreen].bounds.size.width

@implementation AAButtonsView {
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setTitlesArr:(NSArray *)titlesArr {
    if (_titlesArr != titlesArr) {
        _titlesArr = titlesArr;
        [self setUpTheOriginalView];
    }
}

- (void)setUpTheOriginalView {
    
    float btnX = 20;
    float btnY = 20;
    for(int i = 0; i < _titlesArr.count; i++) {
        //宽度自适应
        CGFloat btnWidth;
        if (AAScreenWidth>320) {
            btnWidth = (AAScreenWidth-40+10)/5-10;
        } else {
            btnWidth = (AAScreenWidth-40+10)/4-10;
        }
        if (btnX+btnWidth-10>AAScreenWidth-20) {
            btnX = 20;
            btnY += 35;
        }
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, btnY, btnWidth, 25);
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:_titlesArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn.layer setBorderColor:[[UIColor  grayColor]CGColor]];//边框颜色
        [btn.layer setBorderWidth:0.5]; //边框宽度
        [btn addTarget:self action:@selector(sonChoicesNameButtonsClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self addSubview:btn];
        btnX = CGRectGetMaxX(btn.frame)+10;
    }

    
}

- (void)sonChoicesNameButtonsClicked:(UIButton *)sender {
    
}

@end
