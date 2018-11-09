//
//  LVAboutUsViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVAboutUsViewController.h"

@interface LVAboutUsViewController ()

@end

@implementation LVAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"关于我们";
    self.view.backgroundColor=kBGWhiteColor;
    [self addLeftItemWithImageName:@"leftbackicon_white_titlebar_24x24_@2x"];
    UIImageView *logoImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, 70)];
    logoImgView.image=[UIImage imageNamed:@"logo"];
    [self.view addSubview:logoImgView];
    UILabel *versionLabel=[[UILabel alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(logoImgView.frame)+50, kScreenWidth-100, 20)];
    versionLabel.textColor=[UIColor grayColor];
    versionLabel.textAlignment=NSTextAlignmentCenter;
    versionLabel.font=[UIFont systemFontOfSize:11];
    versionLabel.text=@"版本号：V1.0.0";
    [self.view addSubview:versionLabel];
    AvtionImageView *contactView=[[AvtionImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(versionLabel.frame)+40, kScreenWidth, 30)];
    contactView.backgroundColor=[UIColor whiteColor];
    [contactView addTarget:self action:@selector(contactUS)];
    [self.view addSubview:contactView];
    UILabel *titLabel=[[UILabel alloc] initWithFrame:CGRectMake(15, 2, 80, 26)];
    titLabel.text=@"联系客服";
    titLabel.userInteractionEnabled=YES;
    [contactView addSubview:titLabel];
    UILabel *numLabel=[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-135, 2, 120, 26)];
    numLabel.text=@"0371-666666";
    numLabel.textAlignment=NSTextAlignmentRight;
    numLabel.textColor=[UIColor grayColor];
    numLabel.font=[UIFont systemFontOfSize:13];
    numLabel.userInteractionEnabled=YES;
    [contactView addSubview:numLabel];
    UILabel *copyRight=[[UILabel alloc] initWithFrame:CGRectMake(0, kScreenHeight-30-kiPhoneX_Bottom_Height-64, kScreenWidth, 20)];
    copyRight.textAlignment=NSTextAlignmentCenter;
    copyRight.font=[UIFont systemFontOfSize:12];
    copyRight.text=@"乐沃实业©www.lovai.com";
    [self.view addSubview:copyRight];
}
-(void)contactUS{
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"0371-666666"];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str]]) {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
  
    
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
