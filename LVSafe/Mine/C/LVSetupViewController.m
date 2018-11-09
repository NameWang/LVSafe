//
//  LVSetupViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVSetupViewController.h"

@interface LVSetupViewController ()
{
    UISwitch *soundSwitch,*shakeSwitch;
    UILabel *statusLabel,*noLabel,*soundLabel,*shakeLabel,*configLabel1,*configLabel2,*kaiqiLabel;
    UIButton *openBtn,*quitBtn;
    BOOL openNoti;
}
@end

@implementation LVSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"设置";
    self.view.backgroundColor=kBGWhiteColor;
    [self addLeftItemWithImageName:@"leftbackicon_white_titlebar_24x24_@2x"];
    UIView *topBgView=[[UIView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 25)];
    topBgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:topBgView];
    UILabel *conLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, 25)];
    conLabel.text=@"清除应用缓存：";
    [topBgView addSubview:conLabel];
    UIButton *clearCacheBtn=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-80, 0, 50, 25)];
    [clearCacheBtn setTitle:@"清除" forState:(UIControlStateNormal)];
    [clearCacheBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [clearCacheBtn addTarget:self  action:@selector(clearCacheClick) forControlEvents:(UIControlEventTouchUpInside)];
    [topBgView addSubview:clearCacheBtn];
    configLabel1=[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(topBgView.frame), kScreenWidth-20, 20)];
    configLabel1.backgroundColor=kBGWhiteColor;
    configLabel1.textColor=[UIColor grayColor];
    configLabel1.text=@"将应用还原到刚安装状态。";
    configLabel1.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:configLabel1];
    openNoti=[self isUserNotificationEnable];
    UIView *bgView2=[[UIView alloc] init];
    bgView2.backgroundColor=[UIColor whiteColor];
     configLabel2=[[UILabel alloc] init];
    if (openNoti) {
          bgView2.frame=CGRectMake(0, CGRectGetMaxY(configLabel1.frame), kScreenWidth, 90);
        statusLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 120, 30)];
        statusLabel.text=@"接收消息通知";
        [bgView2 addSubview:statusLabel];
        kaiqiLabel=[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-80, 0, 50, 30)];
        kaiqiLabel.textColor=[UIColor grayColor];
        kaiqiLabel.text=@"已开启";
        [bgView2 addSubview:kaiqiLabel];
        soundLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 30, 120, 30)];
        soundLabel.text=@"声音";
        [bgView2 addSubview:soundLabel];
        shakeLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 60, 120, 30)];
        shakeLabel.text=@"震动";
        [bgView2 addSubview:shakeLabel];
        soundSwitch=[[UISwitch alloc] initWithFrame:CGRectMake(kScreenWidth-80, 30, 50, 30)];
        soundSwitch.on=YES;
        [soundSwitch addTarget:self action:@selector(soundChange:) forControlEvents:(UIControlEventValueChanged)];
        [bgView2 addSubview:soundSwitch];
        shakeSwitch=[[UISwitch alloc] initWithFrame:CGRectMake(kScreenWidth-80, 60, 50, 30)];
        shakeSwitch.on=YES;
        [shakeSwitch addTarget:self action:@selector(shakeChange:) forControlEvents:(UIControlEventValueChanged)];
        [bgView2 addSubview:shakeSwitch];
        
         configLabel2.text=@"此应用在运行时，设置是否需要声音或震动";
        configLabel2.frame=CGRectMake(10, CGRectGetMaxY(bgView2.frame), kScreenWidth-20, 30);
    }else{
        bgView2.frame=CGRectMake(0, CGRectGetMaxY(configLabel1.frame), kScreenWidth, 60);
        noLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 5, kScreenWidth-90, 50)];
        noLabel.numberOfLines=2;
        noLabel.text=@"为避免您错过重要预警信息，请开启系统通知";
        [bgView2 addSubview:noLabel];
        openBtn=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-80, 15, 50, 30)];
        openBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        [openBtn setTitleColor:kBlueColor forState:(UIControlStateNormal)];
        [openBtn setTitle:@"去开启" forState:(UIControlStateNormal)];
        [openBtn addTarget:self action:@selector(goToAppSystemSetting) forControlEvents:(UIControlEventTouchUpInside)];
        [bgView2 addSubview:openBtn];
        configLabel2.text=@"如果你需要关闭或开启消息通知，请在iPhone的“设置”-“通知”功能中找到应用更改";
        configLabel2.frame=CGRectMake(10, CGRectGetMaxY(bgView2.frame), kScreenWidth-20, 30);
    }
    [self.view addSubview:bgView2];
   
    configLabel2.backgroundColor=kBGWhiteColor;
    configLabel2.textColor=[UIColor grayColor];
    configLabel2.numberOfLines=2;
    configLabel2.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:configLabel2];
    //
    if (self.isLogin) {
        quitBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(configLabel2.frame)+30, kScreenWidth, 30)];
        [quitBtn setTitle:@"退出登录" forState:(UIControlStateNormal)];
       // [quitBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        quitBtn.backgroundColor=kBlueColor;
        [quitBtn addTarget:self action:@selector(quitClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:quitBtn];
    }else{
        
    }
    
}
#pragma mark 退出登录
-(void)quitClick{
    
}
#pragma mark 通知方式更改
-(void)soundChange:(UISwitch*)soswitch{
    
}
-(void)shakeChange:(UISwitch*)shswitch{
    
}
#pragma mark 判断用户是否允许接收通知
-(BOOL)isUserNotificationEnable { //
    BOOL isEnable = NO;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f) { // iOS版本 >=8.0 处理逻辑
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
    } else { // iOS版本 <8.0 处理逻辑
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        isEnable = (UIRemoteNotificationTypeNone == type) ? NO : YES;
    }
    return isEnable;
}

// 如果用户关闭了接收通知功能，该方法可以跳转到APP设置页面进行修改  iOS版本 >=8.0 处理逻辑
-(void)goToAppSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([application canOpenURL:url]) {
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:url options:@{} completionHandler:nil];
        } else {
            [application openURL:url];
        }
    }
}

//清除缓存
-(void)clearCacheClick{
    double cachesize=[self getCachesSize];
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"此操作会将应用中所有数据(%.2fM)清空，请谨慎使用！",cachesize] preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:cancel];
    UIAlertAction *deletes=[UIAlertAction actionWithTitle:@"清除" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        //1.删除sd
        [[SDImageCache sharedImageCache] clearMemory];//清除内存缓存
        //2.清除 磁盘缓存
        [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
        
        //清除自己的缓存
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] ;
        NSString *myCachesPath = [caches stringByAppendingPathComponent:@"MyCaches"];
        //删除
        [[NSFileManager defaultManager] removeItemAtPath:myCachesPath error:nil];
        [MBProgressHUD showSuccess:@"缓存已清除！"];
    }];
    [alert addAction:deletes];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark 获取缓存
- (double)getCachesSize {
    //1.自定义的缓存 2.sd 的缓存
    NSUInteger sdFileSize = [[SDImageCache sharedImageCache] getSize];
    
    //先获取 系统 Library/Caches 路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *myCachesPath = [caches stringByAppendingPathComponent:@"MyCaches"];
    //遍历 自定义缓存文件夹
    //目录枚举器 ，里面存放着  文件夹中的所有文件名
    NSDirectoryEnumerator *enumrator = [[NSFileManager defaultManager] enumeratorAtPath:myCachesPath];
    
    NSUInteger mySize = 0;
    //遍历枚举器
    for (NSString *fileName in enumrator) {
        //文件路径
        NSString *filePath = [myCachesPath stringByAppendingPathComponent:fileName];
        NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        //获取大小
        mySize += fileDict.fileSize;//字节大小
    }
    //1M == 1024KB == 1024*1024bytes
    return (mySize+sdFileSize)/1024.0/1024.0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
