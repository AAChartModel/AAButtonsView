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
        [self SetUpBasicStyle];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self SetUpBasicStyle];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self SetUpBasicStyle];
    }
    return self;
}


- (void)setNormalBtnTitlesArr:(NSArray *)normalBtnTitlesArr {
    if (_normalBtnTitlesArr != normalBtnTitlesArr) {
        _normalBtnTitlesArr = normalBtnTitlesArr;
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self setUpTheOriginalView];
    }
}

- (void)SetUpBasicStyle {
    self.btnLayerCornerRadius = 3;
    self.btnSelectedColor = [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0];//app主色调
    self.btnFontSize = 11;
 }


- (void)setUpTheOriginalView {
    float btnX ;
    float btnY ;
    if (self.layoutType == AAButtonsViewLayoutTypeOrderly) {
        btnX = 20;
        btnY = 20;
        for(int i = 0; i < self.normalBtnTitlesArr.count; i++) {
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
            NSString *btnTitle = self.normalBtnTitlesArr[i];
            BOOL selected = NO;
            if (self.selectedBtnTitlesArr && [self.selectedBtnTitlesArr containsObject:btnTitle]) {
                selected = YES;
            }
            UIButton *button = [self configureTheButtonsWithButtonX:btnX
                                                            buttonY:btnY
                                                        buttonWidth:btnWidth
                                                        buttonTitle:btnTitle
                                                     buttonSelected:selected
                                                          buttonTag:i];
            btnX = CGRectGetMaxX(button.frame)+10;
            
            
        }
    }else {
        btnX = 15;
        btnY = 17+10;
        for(int i = 0; i < self.normalBtnTitlesArr.count; i++){
            
            //宽度自适应
            NSDictionary *fontDict = @{
                                       NSFontAttributeName:[UIFont systemFontOfSize:self.btnFontSize+3]
                                       };
            CGRect frame_W = [self.normalBtnTitlesArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                                   attributes:fontDict
                                                                      context:nil];
            
            if (btnX+frame_W.size.width+20>AAScreenWidth-15) {
                btnX = 15;
                btnY += 55;
            }
            NSString *btnTitle = self.normalBtnTitlesArr[i];
            
            BOOL selected = NO;
            if (self.selectedBtnTitlesArr && [self.selectedBtnTitlesArr containsObject:btnTitle]) {
                selected = YES;
            }
            
            UIButton *button =  [self configureTheButtonsWithButtonX:btnX
                                                             buttonY:btnY
                                                         buttonWidth:frame_W.size.width
                                                         buttonTitle:btnTitle
                                                      buttonSelected:selected
                                                           buttonTag:i];
            btnX = CGRectGetMaxX(button.frame)+10;
            
        }
    }
    
}


- (UIButton *)configureTheButtonsWithButtonX:(CGFloat)btnX
                                     buttonY:(CGFloat)btnY
                                 buttonWidth:(CGFloat)btnWidth
                                 buttonTitle:(NSString *)btnTitle
                              buttonSelected:(BOOL)btnSelected
                                   buttonTag:(NSInteger)btnTag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(btnX, btnY, btnWidth, 25);
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:self.btnFontSize];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn.layer setBorderColor:[[UIColor  grayColor] CGColor]];//边框颜色
    [btn.layer setBorderWidth:0.5]; //边框宽度
    [btn addTarget:self action:@selector(buttonOfAAButtonsViewWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = btnTag;
    [self addSubview:btn];
    if (btnSelected == YES) {
        [self changeTheSelectedButtonStyleWithSelectedButton:btn];
    }
    return btn;
}

- (void)buttonOfAAButtonsViewWasClicked:(UIButton *)sender {
    [self changeTheSelectedButtonStyleWithSelectedButton:sender];
    if (self.selectedBtnBlock) {
        self.selectedBtnBlock(sender);
    } else {
        [self.selectedBtnDelegate aa_buttonsViewDidSelectedButtonWithTheButton:sender];
    }
    
}

- (void)changeTheSelectedButtonStyleWithSelectedButton:(UIButton *)selectedBtn {
    if (selectedBtn.selected == NO) {
        selectedBtn.backgroundColor = self.btnSelectedColor;
        [selectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [selectedBtn.layer setBorderColor:[self.btnSelectedColor CGColor]];
    } else {
        selectedBtn.backgroundColor = [UIColor whiteColor];
        [selectedBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [selectedBtn.layer setBorderColor:[[UIColor grayColor] CGColor]];
    }
        selectedBtn.selected = !selectedBtn.selected;
}

@end
