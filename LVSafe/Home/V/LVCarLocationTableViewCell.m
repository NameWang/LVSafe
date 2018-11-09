//
//  LVCarLocationTableViewCell.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/25.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVCarLocationTableViewCell.h"

@implementation LVCarLocationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
      self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
