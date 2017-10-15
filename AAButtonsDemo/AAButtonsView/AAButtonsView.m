//
//  AAButtonsView.m
//  AAButtonsDemo
//
//  Created by An An on 2017/8/1.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAButtonsView.h"
#define AAScreenWidth    [UIScreen mainScreen].bounds.size.width
@interface AAButtonsView(){
    UIView *_btnsFatherView;
}
@property (nonatomic, strong) UIButton *justOneSelectedBtn;//记录仅仅支持单选的按钮 tag
@end

@implementation AAButtonsView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpBasicStyle];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpBasicStyle];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpBasicStyle];
    }
    return self;
}

- (void)setBtnsTitleArr:(NSArray *)btnsTitleArr {
    if (_btnsTitleArr != btnsTitleArr) { //此处可能有点问题,后续修改
        _btnsTitleArr = btnsTitleArr;
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self setUpTheOriginalView];
    }
}

- (void)setUpBasicStyle {
    [self dismissFromSuperView];
    self.btnLayerCornerRadius = 3;
    self.btnSelectedColor = [UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0];//app主色调
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    self.btnFontSize = 11;
}



- (void)setUpTheOriginalView {
    _btnsFatherView = [[UIView alloc]init];
    _btnsFatherView.backgroundColor = [UIColor whiteColor];
    //    _btnsFatherView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:_btnsFatherView];
  
    float btnX ;
    float btnY ;
    
    __block CGFloat btnsFatherViewHeight;
    if (self.layoutType == AAButtonsViewLayoutTypeOrderly) {
        btnX = 20;
        btnY = 20;
        for (int i = 0; i < self.btnsTitleArr.count; i++) {
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
            NSString *btnTitle = self.btnsTitleArr[i];
            BOOL selected = NO;
            if ( [self.selectedBtnsTitleArr containsObject:btnTitle]) {
                selected = YES;
            }
            UIButton *button = [self configureTheButtonsWithButtonX:btnX
                                                            buttonY:btnY
                                                        buttonWidth:btnWidth
                                                        buttonTitle:btnTitle
                                                     buttonSelected:selected
                                                          buttonTag:i];
            
            if ([self.selectedBtnsTitleArr containsObject:btnTitle]) {
                self.justOneSelectedBtn = button;
            }
            
            btnX = CGRectGetMaxX(button.frame)+10;
            
            btnsFatherViewHeight = btnY+25+15;
            if (i == self.btnsTitleArr.count-1) {//通过得到最后一个按钮的坐标来获得_btnsFatherView的高度
                _btnsFatherView.frame = CGRectMake(0, -btnsFatherViewHeight, self.frame.size.width, btnsFatherViewHeight);
            }
        }
    } else {
        btnX = 15;
        btnY = 17+10;
        for(int i = 0; i < self.btnsTitleArr.count; i++) {
            //宽度自适应
            NSDictionary *fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:self.btnFontSize+3]};
            CGRect frame_W = [self.btnsTitleArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                             attributes:fontDict
                                                                context:nil];
            
            if (btnX+frame_W.size.width+20>AAScreenWidth-15) {
                btnX = 15;
                btnY += 35;
            }
            NSString *btnTitle = self.btnsTitleArr[i];
            
            BOOL selected = NO;
            if ([self.selectedBtnsTitleArr containsObject:btnTitle]) {
                selected = YES;
            }
            
            UIButton *button =  [self configureTheButtonsWithButtonX:btnX
                                                             buttonY:btnY
                                                         buttonWidth:frame_W.size.width+10
                                                         buttonTitle:btnTitle
                                                      buttonSelected:selected
                                                           buttonTag:i];
            
            if ([self.selectedBtnsTitleArr containsObject:btnTitle]) {
                self.justOneSelectedBtn = button;
            }
            btnX = CGRectGetMaxX(button.frame)+5;
            
            btnsFatherViewHeight = btnY+25+15;
            if (i == self.btnsTitleArr.count-1) { //获得_btnsFatherView的高度
                _btnsFatherView.frame = CGRectMake(0, -btnsFatherViewHeight, self.frame.size.width,btnsFatherViewHeight);
            }
            
        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        _btnsFatherView.frame = CGRectMake(0, 0, self.frame.size.width, btnsFatherViewHeight);
    }];
    
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
    [_btnsFatherView addSubview:btn];
    if (btnSelected == YES) {
        [self changeTheSelectedButtonStyleWithSelectedButton:btn];
    }
    return btn;
}

- (void)buttonOfAAButtonsViewWasClicked:(UIButton *)sender {
    if (self.selectionType == AAButtonsViewSelectionSingle) {
        //        [self swipeGestureEvent];
        [self changeTheSelectedButtonStyleWithSelectedButton:self.justOneSelectedBtn];
        self.justOneSelectedBtn = sender;
    }
    
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

//轻触灰色半透明蒙版后消失
- (void)dismissFromSuperView {
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureEvent)];
    //    设置轻扫的方向向右
    swipeGestureRight.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipeGestureRight];
}

- (void)swipeGestureEvent {
    [UIView animateWithDuration:0.3 animations:^{
        _btnsFatherView.frame = CGRectMake(0, -(_btnsFatherView.frame.size.height), self.frame.size.width, _btnsFatherView.frame.size.height);
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor= [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
