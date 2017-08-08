//
//  AAGeneralTableViewCell.h
//  WYMCloudServerH
//
//  Created by An An on 2017/8/8.
//  Copyright © 2017年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AAGeneralTableViewCellStyle) {
    AAGeneralTableViewCellStyleInput = 0,//输入类型
    AAGeneralTableViewCellStylePick,//选择类型
    AAGeneralTableViewCellStyleOutput,//输出类型
};

@interface AAGeneralTableViewCell : UITableViewCell

@property (nonatomic, assign) AAGeneralTableViewCellStyle styleType;
@property (nonatomic, strong) UIImageView *photoImageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *inputContentTF;
@property (nonatomic, strong) UILabel *contentTextLabel;
@property (nonatomic, strong) UIImageView *arrowImageV;
@property (nonatomic, assign) BOOL haveArrowImage;//是否有向右箭头

@end
