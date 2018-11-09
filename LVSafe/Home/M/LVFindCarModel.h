//
//  LVFindCarModel.h
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/24.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//`id` int(10)  '报警id',
//`carId` int(10)  '车辆id',
//`loseTime` datetime  '丢失时间',
//`loseAdd` varchar(200)  '丢失地点',
//`remark` varchar(255)  '备注信息',
//`callPoliceState` varchar(10)  '报警状态',
//`callPoliceTime` datetime  '报警时间',
//`callPoliceNo` varchar(255)  '报警编号',
//`closeTime` datetime '结案时间',
@interface LVFindCarModel : NSObject
@property(nonatomic,copy)NSDate *getFacDate;
@property(nonatomic,copy)NSDate *buyDate;
@property(nonatomic,copy)NSDate *installDate;

@property(nonatomic,assign)int id;
@property(nonatomic,assign)double buyPrice;
@property(nonatomic,assign)int sysManagerId;
@property(nonatomic,assign)int classify;

@property(nonatomic,copy)NSString *machineNo;
@property(nonatomic,copy)NSString *VIN;
@property(nonatomic,copy)NSString *buyAdd;
@property(nonatomic,copy)NSString *picPath;
@property(nonatomic,copy)NSString *remark;
@property(nonatomic,copy)NSString *uname;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *IDCardNo;
@property(nonatomic,copy)NSString *licenseNum;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *colour;
@property(nonatomic,copy)NSString *brand;
@property(nonatomic,copy)NSString *homeTele;
@property(nonatomic,copy)NSString *IDAdd;
@property(nonatomic,copy)NSString *homeAdd;
@property(nonatomic,copy)NSString *facNum;
@property(nonatomic,copy)NSString *areaCode;
@property(nonatomic,copy)NSString *facType;
@property(nonatomic,copy)NSString *facPower;
@property(nonatomic,copy)NSString *state;
@end

NS_ASSUME_NONNULL_END
