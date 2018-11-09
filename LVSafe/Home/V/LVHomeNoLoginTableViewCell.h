//
//  LVHomeNoLoginTableViewCell.h
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/22.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^loginBlock) (void);
@interface LVHomeNoLoginTableViewCell : UITableViewCell
@property(copy,nonatomic)loginBlock block;
-(void)tapLoginWithBlock:(loginBlock)block;
- (IBAction)loginClick:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
