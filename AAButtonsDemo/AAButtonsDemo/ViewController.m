//
//  ViewController.m
//  AAButtonsDemo
//
//  Created by An An on 2017/8/1.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ViewController.h"
#import "AAButtonsView.h"
#import "SecondViewController.h"
#import "AAButtonsViewSelectionTypeVC.h"
#define AAGrayColor [UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1.0]
@interface ViewController ()<AAButtonsViewDelegate,UITableViewDelegate,UITableViewDataSource> {
    UITableView *_tableView;
}
@property (nonatomic, strong) NSArray *cellTitleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"AAButtonsView";
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[self configureTheConstraintArrayWithItem:_tableView toItem:self.view]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = AAGrayColor;
    UILabel *sectionTitleLabel = [[UILabel alloc]init];
    NSArray *sectionTitleArr = @[@"对齐方式",@"单选多选"];
    sectionTitleLabel.text = sectionTitleArr[section];
    sectionTitleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    sectionTitleLabel.textAlignment = NSTextAlignmentCenter;
    sectionTitleLabel.textColor = [UIColor purpleColor];
    [view addSubview:sectionTitleLabel];
    
    sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [view addConstraints:[self configureTheConstraintArrayWithItem:sectionTitleLabel toItem:view]];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.cellTitleArr[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            SecondViewController *vc = [[SecondViewController alloc]init];
            vc.buttonsViewLayoutType = indexPath.row;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 1: {
            AAButtonsViewSelectionTypeVC *selectionTypeVC = [[AAButtonsViewSelectionTypeVC alloc]init];
            selectionTypeVC.buttonsViewSelectionType = indexPath.row;
            [self.navigationController pushViewController:selectionTypeVC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (NSArray *)configureTheConstraintArrayWithItem:(UIView *)view1 toItem:(UIView *)view2{
    return  @[[NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeLeft
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeLeft
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeRight
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeTop
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeTop
                                          multiplier:1.0
                                            constant:0],
              [NSLayoutConstraint constraintWithItem:view1
                                           attribute:NSLayoutAttributeBottom
                                           relatedBy:NSLayoutRelationEqual
                                              toItem:view2
                                           attribute:NSLayoutAttributeBottom
                                          multiplier:1.0
                                            constant:0],
              
              ];
}

- (NSArray *)cellTitleArr {
    if (!_cellTitleArr) {
        _cellTitleArr = @[
                          @[@"AAButtonsViewLayoutTypeOrderly",
                            @"AAButtonsViewLayoutTypeStaggerly"],
                          
                          @[@"AAButtonsViewSelectionSingle",
                            @"AAButtonsViewSelectionMultiple"],
                          ];
    }
    return _cellTitleArr;
}



@end

