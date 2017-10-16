//
//  AAButtonsViewLayoutTypeVC.m
//  AAButtonsDemo
//
//  Created by An An on 2017/10/10.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAButtonsViewLayoutTypeVC.h"
#import "AAButtonsView.h"
@interface AAButtonsViewLayoutTypeVC ()<AAButtonsViewDelegate>{
    AAButtonsView *_btnsView;
}
@property (nonatomic, copy) NSString *selectedString;
@end

@implementation AAButtonsViewLayoutTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpTheButtonsView];
    _selectedString = @"五音不全";

}

- (void)setUpTheButtonsView {
    AAButtonsView *btnsView = [[AAButtonsView alloc]init];
//    btnsView.backgroundColor = [UIColor whiteColor];
    btnsView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-300);
    btnsView.selectedBtnDelegate = self;
    btnsView.layoutType = self.buttonsViewLayoutType;
    NSArray *wholeContentArr;
    NSArray *selectedContentArr;
    if (self.buttonsViewLayoutType == AAButtonsViewLayoutOrderly) {
        self.title = @"Layout Orderly";
        wholeContentArr = @[@"基本信息",@"客户开发",@"返款记录",@"铺垫记录",@"顾客上门",@"顾客充值",@"结算记录",@"诊疗记录",@"回访计划",@"回访列表",@"开发记录",@"优惠记录"];
        selectedContentArr = @[@"元旦",@"中秋",@"国庆节",@"端午",@"春节",@"基本信息",@"铺垫记录",@"顾客充值",@"回访列表",@"结算记录",@"优惠记录"];
        
    } else {
        self.title = @"Layout Staggerly";
        wholeContentArr = @[@"AAChartKit",
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
        
        selectedContentArr = @[@"AAChartKit",
                               @"AAChartKit-Slim",
                               @"AATextWatchdog",
                               @"风之旅人",
                               @"使命召唤",
                               @"荣誉勋章",
                               @"重返德军总部",
                               @"合金弹头",
                               @"纸境",
                               @"孤岛危机",
                               @"Limbo",
                               @"最后生还者",
                               @"细胞分裂",
                               @"仁王",
                               @"AAMapStudio",
                               @"Java",
                               @"看火人"];
    }
    
    //    btnsView.selectedBtnsTitleArr = selectedContentArr;// NOTE:属性selectedBtnsTitleArr的设置必须在btnsTitleArr设置的前面
    btnsView.btnsTitleArr = wholeContentArr;
//    btnsView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    __weak typeof(self)weakSelf = self;
    btnsView.selectedBtnBlock = ^(UIButton *button) {
        NSLog(@"当前点击的按钮的标题是 %@",button.titleLabel.text);
        [_btnsView removeFromSuperview];

 
        _btnsView = [[AAButtonsView alloc]init];
        
        if (weakSelf.buttonsViewLayoutType == 0) {
            _btnsView.selectionType = AAButtonsViewSelectionSingle;
        } else {
            _btnsView.selectionType = AAButtonsViewSelectionMultiple;
        }
         _btnsView.frame = CGRectMake(0, 350, weakSelf.view.frame.size.width, 350);
        _btnsView.selectedBtnDelegate = weakSelf;
        _btnsView.layoutType = weakSelf.buttonsViewLayoutType;
        NSArray *wholeContentArr;
        NSArray *selectedContentArr;
        wholeContentArr = @[@"基本信息",@"客户开发",@"返款记录",@"铺垫记录",@"顾客上门",@"顾客充值",@"结算记录",@"诊疗记录",@"回访计划",@"回访列表",@"开发记录",@"优惠记录"];
//        selectedContentArr = @[@"元旦",@"中秋",@"国庆节",@"端午",@"春节",@"基本信息",@"铺垫记录",@"顾客充值",@"回访列表",@"结算记录",@"优惠记录"];
        selectedContentArr = @[_selectedString];
        _btnsView.btnLayerCornerRadius = 25/2;
        _btnsView.selectedBtnsTitleArr = selectedContentArr;
        _btnsView.btnsTitleArr = wholeContentArr;
        _btnsView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        [weakSelf.view addSubview:_btnsView];
        
        _btnsView.selectedBtnBlock = ^(UIButton *button) {
            _selectedString = button.titleLabel.text;
        };
    };
    [self.view addSubview:btnsView];
}

#pragma mark -- AAButtonsViewDelegate
- (void)aa_ButtonsViewDidSelectedButtonWithTheButton:(UIButton *)selectedButton {
    NSLog(@"代理有没有再执行了");
}

@end
