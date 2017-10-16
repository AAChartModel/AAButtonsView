//
//  AAButtonsViewSelectionTypeVC.m
//  AAButtonsDemo
//
//  Created by An An on 2017/10/16.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAButtonsViewSelectionTypeVC.h"

@interface AAButtonsViewSelectionTypeVC ()

@end

@implementation AAButtonsViewSelectionTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpTheBasicView];
    
    self.title = self.buttonsViewSelectionType == AAButtonsViewSelectionSingle?@"Single Selection":@"Multiple Selection";
}

- (void)setUpTheBasicView {
    AAButtonsView *btnsView = [[AAButtonsView alloc]init];
    //    btnsView.backgroundColor = [UIColor whiteColor];
    btnsView.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-300);
    btnsView.layoutType = AAButtonsViewLayoutTypeStaggerly;
    btnsView.selectionType = self.buttonsViewSelectionType;
    NSArray *wholeContentArr;
    NSArray *selectedContentArr;
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
    
    btnsView.btnsTitleArr = wholeContentArr;
    btnsView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:btnsView];
    
    
    btnsView.selectedBtnBlock = ^(UIButton *button) {
        NSLog(@"当前点击的按钮的标题是 %@",button.titleLabel.text);
        
    };
}

@end

