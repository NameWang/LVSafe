//
//  DHHleper.h
//  DHMarket
//
//  Created by cnelc on 2017/6/9.
//  Copyright © 2017年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DHHleper : NSObject
+(NSString *)getInternetDate;
+(NSString *)getMD5Key;
+(NSString *)getLocalDate;
+(NSString *)transDateToString:(NSDate*)date;
+(NSString*)getUserTokenWithName:(NSString*)userName andTime:(NSString *)time;
+ (NSString *)dateStringFromTimeStr:(NSString *)timerStr;


+(NSString*)md5String:(NSString*)string;
//把一个秒字符串 转化为真正的本地时间
//@"1419055200" -> 转化 日期字符串
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr;
//根据字符串内容的多少  在固定宽度 下计算出实际的行高
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size;
+(NSString *)convertToJsonData:(NSDictionary *)dict;
+(NSString*)getJsonData:(NSArray *)ary;
+(NSString*)getNetworkIPAddress;
+(UIImage*)resizeImage:(UIImage*)image withSize:(CGSize)size;
@end
