//
//  LVCarLocationInfoModel.h
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/25.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//`id` bigint(12)  '行驶记录id',
//`recordTime` datetime  '记录时间',
//`facNum` varchar(11)  '车辆设备号',
//`id` bigint(12)  '安装点id',
//`province` varchar(10)  '省',
//`city` varchar(20)  '市',
//`prefecture` varchar(20)  '县',
//`town` varchar(20) '镇',
//`add` varchar(200)  '具体地址',
//`longitude` varchar(20)  '经度',
//`latitude` varchar(20)  '纬度',
//`managerId` int(10)  '管理员id',
//`SDNum` varchar(10)  '读卡器编号',
//`areaCode` varchar(10)  '区域码',
//`hardWareId` varchar(10) '硬件id',
//`localIP` varchar(20)  '本地ip地址',
//`localPortNo` varchar(20)  '本地端口号',
//`longIP` varchar(20)  '远程ip地址',
//`longPortNo` varchar(20)  '远程端口号',
//`macIP` varchar(20)  'mac地址',
//`antennaPower` varchar(20)  '天线功率',
//`workPattern` varchar(20)  '工作模式',
//`skyNetAdd1` varchar(20)  '天网地址1',
//`skyNetAdd2` varchar(20)  '天网地址2',
//`SDState` varchar(20)  '读卡器状态',
//`installDate` date  '安装时间',
//`installState` varchar(6)  '安装状态',
//`border` int(2)  '边界为1非边界为0',
@interface LVCarLocationInfoModel : NSObject
@property(nonatomic,copy)NSDate *recordTime;
@property(nonatomic,copy)NSDate *installDate;

@property(nonatomic,assign)int id;
@property(nonatomic,assign)int border;
@property(nonatomic,assign)int installId;
@property(nonatomic,assign)int managerId;

@property(nonatomic,copy)NSString *facNum;
@property(nonatomic,copy)NSString *province;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *prefecture;
@property(nonatomic,copy)NSString *town;
@property(nonatomic,copy)NSString *add;
@property(nonatomic,copy)NSString *longitude;
@property(nonatomic,copy)NSString *latitude;
@property(nonatomic,copy)NSString *SDNum;
@property(nonatomic,copy)NSString *areaCode;
@property(nonatomic,copy)NSString *hardWareId;
@property(nonatomic,copy)NSString *SDState;
@property(nonatomic,copy)NSString *installState;
@property(nonatomic,copy)NSString *workPattern;
@property(nonatomic,copy)NSString *skyNetAdd1;
@property(nonatomic,copy)NSString *skyNetAdd2;
@end

NS_ASSUME_NONNULL_END
