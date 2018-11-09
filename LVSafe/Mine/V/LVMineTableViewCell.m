//
//  LVMineTableViewCell.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/22.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVMineTableViewCell.h"

@implementation LVMineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    self.backgroundColor=kBGWhiteColor;
    self.iconLabel.font=[UIFont fontWithName:@"iconfont" size:20];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
