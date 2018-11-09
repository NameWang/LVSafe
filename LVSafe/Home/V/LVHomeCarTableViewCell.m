//
//  LVHomeCarTableViewCell.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/22.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVHomeCarTableViewCell.h"

@implementation LVHomeCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    //绘制曲线路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.trailBth.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.trailBth.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.trailBth.layer.mask = maskLayer;
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)showDataWithModel:(LVHomeCarModel *)model trailBlock:(showTrailBolck)trailBlock lockCarBlock:(lockCarBlock)lockBlock{
    self.trailBlock = trailBlock;
    self.lockBlock = lockBlock;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.picPath] placeholderImage:[UIImage imageNamed:@"car"]];
    self.carNameLabel.text=model.brand;
    self.carNumLabel.text=model.licenseNum;
    if ([model.state isEqualToString:@"未锁"]) {
        [self.lockCarBtn setBackgroundImage:[UIImage imageNamed:@"lock"] forState:(UIControlStateNormal)];
    }else{
         [self.lockCarBtn setBackgroundImage:[UIImage imageNamed:@"locked"] forState:(UIControlStateNormal)];
    }
}
- (IBAction)lockCarClick:(UIButton *)sender {
    if (self.lockBlock) {
        self.lockBlock();
    }
}
- (IBAction)trailClick:(UIButton *)sender {
    if (self.trailBlock) {
        self.trailBlock();
    }
}
@end
