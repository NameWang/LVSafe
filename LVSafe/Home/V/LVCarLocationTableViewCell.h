//
//  LVCarLocationTableViewCell.h
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/25.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVCarLocationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

NS_ASSUME_NONNULL_END
