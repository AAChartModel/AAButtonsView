//
//  ViewController.m
//  AAButtonsDemo
//
//  Created by An An on 2017/8/1.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ViewController.h"
#import "AAButtonsView.h"
@interface ViewController ()<AAButtonsViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AAButtonsView *btnsView = [[AAButtonsView alloc]init];
    btnsView.selectedBtnDelegate = self;
            NSArray *tarr = @[@"AAChartKit",@"AAChartKit-Swift",@"AAButtonsView",@"XcodeHelp-CHINESE",@"AACategory",@"AAMapKit",@"AAChartKit-Slim",@"AATextWatchdog",@"社交恐惧",@"家庭矛盾",@"失恋",@"局势很简单",@"Word",@"美女",@"美女与野兽",@"体育",@"生化危机"];
                NSArray *seletedArr = @[@"盗墓笔记",@"空空道人谈股市",@"叶文有话要说",@"相声",@"二货一箩筐",@"单田方",@"城市",@"美女",@"社交恐惧",@"家庭矛盾",@"失恋",@"局势很简单",@"Word",@"美女",@"美女与野兽",@"体育",@"生化危机"];
    btnsView.layoutType = AAButtonsViewLayoutTypeOrderly;
    btnsView.selectedBtnTitlesArr = seletedArr;
    btnsView.normalBtnTitlesArr = tarr;
    btnsView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    btnsView.selectedBtnBlock = ^(UIButton *button) {
         NSLog(@"当前点击的按钮的标题是 %@",button.titleLabel.text);
    };
    [self.view addSubview:btnsView];
    
 }

#pragma mark -- AAButtonsViewDelegate
- (void)aa_ButtonsViewDidSelectedButtonWithTheButton:(UIButton *)selectedButton {
    NSLog(@"代理有没有再执行了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
