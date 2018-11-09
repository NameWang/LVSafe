//
//  LVHomeNoLoginTableViewCell.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/22.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVHomeNoLoginTableViewCell.h"

@implementation LVHomeNoLoginTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)tapLoginWithBlock:(loginBlock)block{
    
}
- (IBAction)loginClick:(UIButton *)sender {
    if (self.block) {
        self.block();
    }
}
@end
