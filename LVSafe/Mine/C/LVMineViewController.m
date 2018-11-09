//
//  LVMineViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/22.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVMineViewController.h"
#import "LVMineTableViewCell.h"
#import "LVLoginViewController.h"
#import "LVAboutUsViewController.h"
#import "LVSetupViewController.h"
#import "LVMessageViewController.h"
#import "LVUserInfoViewController.h"

@interface LVMineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
   
    UITableView *mineTableView;
    NSMutableArray *dataSource;
    NSMutableArray *titleAry;
    BOOL isLogin;
    AvtionImageView *topImgView;
    AvtionImageView *iconImgView;
    UIButton *loginAndNameBtn;
    UILabel *contentLabel;
    NSDictionary *userInfo;
}

@end

@implementation LVMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"我的";
     self.navigationController.navigationBar.hidden=YES;
    self.view.backgroundColor=kBGWhiteColor;
     isLogin=[[[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"] boolValue];
    //
    isLogin=NO;
    dataSource=[NSMutableArray arrayWithObjects:@"\U0000e635",@"\U0000e60d",@"\U0000e602",@"\U0000e612",@"\U0000e603", nil];
    titleAry=[NSMutableArray arrayWithObjects:@"消息管理",@"系统设置",@"关于我们",@"产品介绍",@"安装点", nil];
    [self initTopView];
    
}
-(void)initTopView{
    topImgView=[[AvtionImageView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, 0.5*kScreenWidth)];
    [topImgView addTarget:self action:@selector(toLoginClick)];
    topImgView.image=[UIImage imageNamed:@"sky-h"];
    [self.view addSubview:topImgView];
    iconImgView=[[AvtionImageView alloc] initWithFrame:CGRectMake(10, 0.4*topImgView.frame.size.height, 80, 80)];
    //绘制曲线路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:iconImgView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(40, 40)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = iconImgView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    iconImgView.layer.mask = maskLayer;
   // [iconImgView addTarget:self action:@selector(toLoginClick)];
    
    iconImgView.image=[UIImage imageNamed:@"car"];
    
    [topImgView addSubview:iconImgView];
    loginAndNameBtn=[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconImgView.frame)+10, iconImgView.frame.origin.y+10, kScreenWidth-100, 25)];
    loginAndNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(iconImgView.frame)+10, CGRectGetMaxY(loginAndNameBtn.frame), kScreenWidth-100, 25)];
    contentLabel.textColor=[UIColor whiteColor];
    contentLabel.font=[UIFont systemFontOfSize:13];
    contentLabel.text=@"登录后可以绑定车辆信息";
    
    if (isLogin) {
      
    }else{
          [loginAndNameBtn setTitle:@"立即登录" forState:(UIControlStateNormal)];
        [loginAndNameBtn setTintColor:[UIColor whiteColor]];
     
        [topImgView addSubview:contentLabel];
    }
       [loginAndNameBtn addTarget:self action:@selector(toLoginClick) forControlEvents:(UIControlEventTouchUpInside)];
      [topImgView addSubview:loginAndNameBtn];
    [self initTableView] ;
}
//跳往登录事件
-(void)toLoginClick{
    if (isLogin) {
          self.hidesBottomBarWhenPushed=YES;
        LVUserInfoViewController *info=[[LVUserInfoViewController alloc] init];
        [self.navigationController pushViewController:info animated:YES];
          self.hidesBottomBarWhenPushed=NO;
    }else{
        self.hidesBottomBarWhenPushed=YES;
        LVLoginViewController *login=[[LVLoginViewController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
    
}
-(void)initTableView{
    mineTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topImgView.frame)+2, kScreenWidth, kScreenHeight-kiPhoneX_Bottom_Height-24-topImgView.frame.size.height) style:(UITableViewStylePlain)];
    [mineTableView registerNib:[UINib nibWithNibName:@"LVMineTableViewCell" bundle:nil] forCellReuseIdentifier:@"LVMineTableViewCell"];
  
    
    mineTableView.delegate=self;
    mineTableView.dataSource=self;
    mineTableView.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:mineTableView];
}
#pragma mark tableView delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    
        LVMineTableViewCell *nocell=[tableView dequeueReusableCellWithIdentifier:@"LVMineTableViewCell" forIndexPath:indexPath];
    nocell.iconLabel.text=dataSource[indexPath.row];
    nocell.bodyLabel.text=titleAry[indexPath.row];
        cell=nocell;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            {
                self.hidesBottomBarWhenPushed=YES;
                LVMessageViewController *us=[[LVMessageViewController alloc] init];
              
                us.callBackBlock = ^{
                
                };
                [self.navigationController pushViewController:us animated:YES];
                self.hidesBottomBarWhenPushed=NO;
            }
            break;
        case 1:{
            self.hidesBottomBarWhenPushed=YES;
            LVSetupViewController *us=[[LVSetupViewController alloc] init];
            us.isLogin=isLogin;
            us.callBackBlock = ^{
             
            };
            [self.navigationController pushViewController:us animated:YES];
            self.hidesBottomBarWhenPushed=NO;
        }break;
        case 2:{
             self.hidesBottomBarWhenPushed=YES;
            LVAboutUsViewController *us=[[LVAboutUsViewController alloc] init];
            us.callBackBlock = ^{
              //  self.navigationController.navigationBar.hidden=YES;
            };
            [self.navigationController pushViewController:us animated:YES];
             self.hidesBottomBarWhenPushed=NO;
        }break;
        default:
            break;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataSource.count;
   
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
