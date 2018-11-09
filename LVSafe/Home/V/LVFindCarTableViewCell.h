//
//  LVFindCarTableViewCell.h
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/24.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LVFindCarModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LVFindCarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *carImgView;
@property (weak, nonatomic) IBOutlet UILabel *carNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *lostTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
-(void)showDataWithModel:(LVFindCarModel*)model;
@end

NS_ASSUME_NONNULL_END
