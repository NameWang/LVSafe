//
//  LVMessageTableViewCell.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVMessageTableViewCell.h"

@implementation LVMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
      self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor=kBGWhiteColor;
}
-(void)showDataWithModel:(LVMessageModel *)model{
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.picPath] placeholderImage:[UIImage imageNamed:@"car"]];
    self.bodyLabel.text=model.message;
    self.bodyLabel.numberOfLines=0;
    CGFloat height=[DHHleper textHeightFromTextString:model.message width:kScreenWidth-65 fontSize:17];
    CGRect frame0=self.bodyLabel.frame;
    frame0.size.height=height;
    self.bodyLabel.frame=frame0;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
