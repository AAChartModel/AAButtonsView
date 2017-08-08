//
//  AAGeneralTableViewCell.m
//  WYMCloudServerH
//
//  Created by An An on 2017/8/8.
//  Copyright © 2017年 LH. All rights reserved.
//

#import "AAGeneralTableViewCell.h"

@implementation AAGeneralTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
            self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        //小图片 ImageView
        _photoImageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_photoImageV];
        [_photoImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(@15);
        }];
        
        //标题 Label
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:AppBaseFont+1];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@50);
            make.centerY.equalTo(self.contentView);
        }];
        

    }
    return self;
}

#pragma mark -- setter method
- (void)setStyleType:(AAGeneralTableViewCellStyle)styleType {
    _styleType = styleType;
    switch (styleType) {
        case AAGeneralTableViewCellStyleInput: {
            //输入框 TextField
            _inputContentTF = [[UITextField alloc] init];
            _inputContentTF.font = [UIFont systemFontOfSize:AppBaseFont-1];
            _inputContentTF.textAlignment = NSTextAlignmentRight;
            [self.contentView addSubview:_inputContentTF];
            [_inputContentTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.top.equalTo(@10);
                make.bottom.equalTo(@-10);
                make.left.equalTo(self.contentView.mas_centerX).offset(-10);
                make.right.equalTo(_arrowImageV.mas_left).offset(-5);
            }];
        }
            break;
            
        case AAGeneralTableViewCellStylePick: {
            self.haveArrowImage = YES;//选择样式必然有向右箭头
            //单元格详情内容 Label
            _contentTextLabel = [[UILabel alloc]init];
            _contentTextLabel.font = [UIFont systemFontOfSize:14.0f];
            _contentTextLabel.textAlignment = NSTextAlignmentLeft;
            [self.contentView addSubview:_contentTextLabel];
            [_contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.top.equalTo(@10);
                make.bottom.equalTo(@-10);
                make.left.equalTo(self.contentView.mas_centerX).offset(-10);
                make.right.equalTo(_arrowImageV.mas_left).offset(-5);
            }];
            
        }
            
            break;
        case AAGeneralTableViewCellStyleOutput: {
            //单元格详情内容 Label
            _contentTextLabel = [[UILabel alloc]init];
            _contentTextLabel.font = [UIFont systemFontOfSize:14.0f];
            _contentTextLabel.textAlignment = NSTextAlignmentRight;
            [self.contentView addSubview:_contentTextLabel];
            [_contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.top.equalTo(@10);
                make.bottom.equalTo(@-10);
                make.left.equalTo(self.contentView.mas_centerX).offset(-10);
                make.right.equalTo(_arrowImageV.mas_left).offset(-5);
            }];
        }
            
            break;
            
        default:
            break;
    }
}

- (void)setHaveArrowImage:(BOOL)haveArrowImage {
    _haveArrowImage = haveArrowImage;
    if (haveArrowImage) {
        //向右箭头
        _arrowImageV = [[UIImageView alloc] init];
        _arrowImageV.image = [UIImage imageNamed:@"pen"];
        [self.contentView addSubview:_arrowImageV];
        [_arrowImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.bottom.equalTo(@-10);
            make.right.equalTo(@-5);
            make.width.equalTo(_arrowImageV.mas_height);
        }];
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
