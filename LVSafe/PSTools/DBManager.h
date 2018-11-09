//
//  DBManager.h
//  Legend
//
//  Created by cnelc on 15/9/30.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DBManager : NSObject

+ (DBManager *)sharedManager;
#pragma mark 增加数据
-(void)insertCarLocationDataWithNewsModelAry:(NSArray*)ary;

#pragma mark 读取数据
-(NSArray*)readCarLocationDataWithTypeId:(NSInteger)typeId;

#pragma mark 删除数据
-(void)deleteAllCarLocationData;

@end
