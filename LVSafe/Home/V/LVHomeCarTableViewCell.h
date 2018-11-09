//
//  LVHomeCarTableViewCell.h
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/22.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LVHomeCarModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^showTrailBolck) (void);
typedef void (^lockCarBlock) (void);
@interface LVHomeCarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UIButton *lockCarBtn;
- (IBAction)lockCarClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *carNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *trailBth;
- (IBAction)trailClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *carNameLabel;
@property (copy,nonatomic)showTrailBolck trailBlock;
@property (copy,nonatomic)lockCarBlock lockBlock;
-(void)showDataWithModel:(LVHomeCarModel*)model trailBlock:(showTrailBolck)trailBlock lockCarBlock:(lockCarBlock)lockBlock;

@end

NS_ASSUME_NONNULL_END
