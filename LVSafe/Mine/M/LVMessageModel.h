//
//  LVMessageModel.h
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVMessageModel : NSObject
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *picPath;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,copy)NSString *userId;

@end

NS_ASSUME_NONNULL_END
