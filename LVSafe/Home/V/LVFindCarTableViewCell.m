//
//  LVFindCarTableViewCell.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/24.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVFindCarTableViewCell.h"

@implementation LVFindCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
       self.selectionStyle=UITableViewCellSelectionStyleNone;
}
-(void)showDataWithModel:(LVFindCarModel *)model{
    [self.carImgView sd_setImageWithURL:[NSURL URLWithString:model.picPath] placeholderImage:[UIImage imageNamed:@"car"]];
    self.carNumLabel.text=model.brand;
    
    self.locationLabel.text=model.IDAdd;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
