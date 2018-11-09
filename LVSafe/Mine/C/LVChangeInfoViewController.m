//
//  LVChangeInfoViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVChangeInfoViewController.h"

@interface LVChangeInfoViewController ()
{
    UILabel *typeLable;
    UITextView *textView;
    UIButton *okBtn;
}
@end

@implementation LVChangeInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"修改信息";
    self.view.backgroundColor=kBGWhiteColor;
    [self addLeftItemWithImageName:@"leftbackicon_white_titlebar_24x24_@2x"];
    typeLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 120, 30)];
    typeLable.text=self.type;
    typeLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:typeLable];
    textView=[[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(typeLable.frame), kScreenWidth-20, 150)];
    [self.view addSubview:textView];
    okBtn=[[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(textView.frame)+30, kScreenWidth-20, 30)];
    okBtn.backgroundColor=kBlueGreenColor;
    //绘制曲线路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:okBtn.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = okBtn.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    okBtn.layer.mask = maskLayer;
    [okBtn setTitle:@"修改" forState:(UIControlStateNormal)];
    [okBtn addTarget:self action:@selector(okClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:okBtn];
    
}
-(void)okClick{
    
    
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
