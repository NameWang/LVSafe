//
//  DHHleper.m
//  DHMarket
//
//  Created by cnelc on 2017/6/9.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "DHHleper.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@implementation DHHleper
//获取设备当前网络IP地址
#pragma mark - 获取设备当前网络IP地址
+ (NSString *)getNetworkIPAddress {
    //方式一：淘宝api
    NSURL *ipURL = [NSURL URLWithString:@"http://ip.taobao.com/service/getIpInfo.php?ip=myip"];
    NSData *data = [NSData dataWithContentsOfURL:ipURL];
    NSDictionary *ipDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSString *ipStr = nil;
    if (ipDic && [ipDic[@"code"] integerValue] == 0) {
        //获取成功
        ipStr = ipDic[@"data"][@"ip"];
    }
    return (ipStr ? ipStr : @"0.0.0.0");
}
////获取所有相关IP信息
//+(NSDictionary *)getIPAddresses
//{
//    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
//
//    // retrieve the current interfaces - returns 0 on success
//    struct ifaddrs *interfaces;
//    if(!getifaddrs(&interfaces)) {
//        // Loop through linked list of interfaces
//        struct ifaddrs *interface;
//        for(interface=interfaces; interface; interface=interface->ifa_next) {
//            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
//                continue; // deeply nested code harder to read
//            }
//            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
//            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
//            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
//                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
//                NSString *type;
//                if(addr->sin_family == AF_INET) {
//                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
//                        type = IP_ADDR_IPv4;
//                    }
//                } else {
//                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
//                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
//                        type = IP_ADDR_IPv6;
//                    }
//                }
//                if(type) {
//                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
//                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
//                }
//            }
//        }
//        // Free memory
//        freeifaddrs(interfaces);
//    }
//    return [addresses count] ? addresses : nil;
//}
+(NSString *)getLocalDate{
    NSDate *date=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    formatter.dateFormat=@"yyyy-MM-dd";
    
    NSString *timeStr=[formatter stringFromDate:date];
    
    
    return timeStr;
}
+(NSString *)transDateToString:(NSDate *)date{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    formatter.dateFormat=@"yyyy-MM-dd";
    
    NSString *timeStr=[formatter stringFromDate:date];
    
    
    return timeStr;
}
+(NSString *)getInternetDate

{
    NSDate *date=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    formatter.dateFormat=@"yyyyMMddHH";
    
    NSString *timeStr=[formatter stringFromDate:date];
    
    
    return timeStr;
}

+ (NSString *)getMD5Key{
   NSString *keyStr=[self md5String:@"edian2018"];
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < 6; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return [keyStr stringByAppendingString:string];
}
+(NSString *)getUserTokenWithName:(NSString *)userName andTime:(NSString *)time{
    NSString *date =[self getInternetDate];
    NSString *dateStr=[date stringByAppendingString:time];
    NSString*dstr=[userName stringByAppendingString:dateStr];
    NSLog(@"时间%@，组合%@",dateStr,dstr);
    return [self md5String:dstr];
}

+(NSString *)md5String:(NSString*)string
{
    const char *cStr = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
  
//    const char *cStr = [string UTF8String];
//    unsigned char digest[CC_MD5_DIGEST_LENGTH];
//    CC_MD5( cStr, strlen(cStr),digest );
//    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
//        [result appendFormat:@"%02x", digest[i]];
//    }
//
//    NSString  *string16;
//    for (int i=0; i<24; i++) {
//        string16=[result substringWithRange:NSMakeRange(8, 16)];
//    }
//    return string16;
}
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr {
    NSString *mStr=[timerStr substringWithRange:NSMakeRange(6, 13)];
    //转化为Double
    
    double t = [mStr doubleValue];
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t/1000];
    //转化为 时间格式化字符串
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
    df.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    //转化为 时间字符串
    return [df stringFromDate:date];
}
+ (NSString *)dateStringFromTimeStr:(NSString *)timerStr {
    NSString *mStr=[timerStr substringWithRange:NSMakeRange(6, 13)];
    //转化为Double
    
    double t = [mStr doubleValue];
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t/1000];
    //转化为 时间格式化字符串
    NSString *timesss=[NSString string];
    NSDate *now=[NSDate date];
    NSTimeInterval intVal=[now timeIntervalSinceDate:date];
    if (intVal<=0) {
        timesss=@"1秒前";
    }
    if (intVal>0&&intVal<60) {
        timesss=[NSString stringWithFormat:@"%.0lf秒前",intVal];
    }
    if (intVal>=60&&intVal<3600) {
        timesss=[NSString stringWithFormat:@"%.0lf分钟前",intVal/60];
    }
    if (intVal>=3600&&intVal<86400) {
        timesss=[NSString stringWithFormat:@"%.0lf小时前",intVal/3600];
    }
    if (intVal>=86400&&intVal<2592000) {
        timesss=[NSString stringWithFormat:@"%.0lf天前",intVal/86400];
    }
    if (intVal>=2592000&&intVal<5184000) {
        timesss=@"1个月前";
    }
    if (intVal>=5184000&&intVal<7776000) {
        timesss=@"2个月前";
    }
    if (intVal>=7776000) {
        timesss=@"3个月前以前";
    }
    //    NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
    //    df.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    //   [df stringFromDate:date]
    //转化为 时间字符串
    return timesss;
}
//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
   
        /*
         第一个参数: 预设空间 宽度固定  高度预设 一个最大值
         第二个参数: 行间距
         第三个参数: 属性字典 可以设置字体大小
         */
        //xxxxxxxxxxxxxxxxxx
        //ghjdgkfgsfgskdgfjk
        //sdhgfsdjkhgfjd
        NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
        CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
        //返回计算出的行高
        return rect.size.height;
        
   
}

+(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
+(NSString*)getJsonData:(NSArray *)ary{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:ary options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}
+(UIImage*)resizeImage:(UIImage*)image withSize:(CGSize)size
{
   
        UIImage * resultImage = image;
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        UIGraphicsEndImageContext();
        return resultImage;
    
}
@end
