//
//  LVRegistOrForgetViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/25.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVRegistOrForgetViewController.h"
#import <SafariServices/SafariServices.h>
#import "LVChangePWDViewController.h"

@interface LVRegistOrForgetViewController ()<SFSafariViewControllerDelegate>
{
    NSString *messTitle;
 
    UITextField *numField,*checkField;
    UIButton *loginBtn,*forgetBtn,*timerBtn,*privateBtn;
    AFHTTPSessionManager *manager;
    NSTimer *_timer;
    int timeDown;
    UIActivityIndicatorView *active;
}

@end

@implementation LVRegistOrForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=self.type;
    self.view.backgroundColor=kBGWhiteColor;
    [self addLeftItemWithImageName:@"leftbackicon_white_titlebar_24x24_@2x"];
    manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    timeDown=0;
   //
    
    numField=[[UITextField alloc] initWithFrame:CGRectMake(0, 10+kiPhoneX_Top_Height, kScreenWidth, 40)];
    numField.placeholder=@"请输入您的手机号码";
    numField.font=[UIFont systemFontOfSize:15];
    numField.clearButtonMode=UITextFieldViewModeWhileEditing;
    UIView *leftView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    leftView.backgroundColor=[UIColor whiteColor];
    numField.leftView=leftView;
    numField.leftViewMode=UITextFieldViewModeAlways;
    
    numField.backgroundColor=[UIColor whiteColor];
    numField.keyboardType = UIKeyboardTypeDefault;
    numField.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [numField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:numField];
    //
  
    checkField=[[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(numField.frame), kScreenWidth*0.7, 40)];
    checkField.placeholder=@"请输入验证码";
    checkField.font=[UIFont systemFontOfSize:15];
    checkField.clearButtonMode=UITextFieldViewModeWhileEditing;
    UIView *lView1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    lView1.backgroundColor=[UIColor whiteColor];
    checkField.leftView=lView1;
    checkField.leftViewMode=UITextFieldViewModeAlways;
   
    checkField.keyboardType = UIKeyboardTypeNumberPad;
    checkField.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [checkField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    checkField.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:checkField];
    //
    timerBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    timerBtn.layer.masksToBounds=YES;
    timerBtn.layer.cornerRadius=5;
    timerBtn.frame=CGRectMake(kScreenWidth*0.7,  CGRectGetMaxY(numField.frame), kScreenWidth*0.3, 40);
    timerBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [timerBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [timerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [timerBtn addTarget:self action:@selector(takePassWord:) forControlEvents:UIControlEventTouchUpInside];
    timerBtn.userInteractionEnabled=NO;
    timerBtn.backgroundColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
    [self.view addSubview:timerBtn];
    
    
    //
    loginBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(timerBtn.frame)+30, kScreenWidth-20, 40)];
    loginBtn.backgroundColor=[UIColor grayColor];
    
    loginBtn.layer.masksToBounds=YES;
    loginBtn.layer.cornerRadius=5;
    loginBtn.userInteractionEnabled=NO;
    if ([self.type isEqualToString:@"忘记密码？"]) {
          [loginBtn setTitle:@"重置密码" forState:UIControlStateNormal];
    }else{
          [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        //隐私政策
        privateBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(loginBtn.frame)+10, kScreenWidth, 25)];
        [privateBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
        [privateBtn setTitle:@"阅读“隐私政策”" forState:(UIControlStateNormal)];
        privateBtn.titleLabel.font=[UIFont systemFontOfSize:11];
        [privateBtn addTarget:self action:@selector(privateURLClick) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:privateBtn];
    }
  
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    [loginBtn addTarget:self  action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [numField resignFirstResponder];
  
    [checkField resignFirstResponder];
}
-(void)takePassWord:(UIButton*)btn{
    //待请求数据判断号码是否重复
//    if (numField.text.length>0) {
//
//            timerBtn.userInteractionEnabled=NO;
//            //参数：apiID;apiKey;code;uType;data
//            //说明:uType [=asms 发送验证码][=areg 注册] code默认传8888
//            NSString *kkk=[DHHleper getUserTokenWithName:[NSString stringWithFormat:@"%@",numField.text]];
//            NSDictionary *newDic=@{@"userId":@"0",@"uName":numField.text,@"uPwd":[DHHleper getPassWordWithstring:passField.text],@"loginNum":@"1",@"dtCreate":@"",@"isLock":@"false",@"isLogistics":@"false",@"logo":@"",@"key":kkk,@"groupId":@"0"};
//
//            NSString *jsonStr=[DHHleper convertToJsonData:newDic];
//            NSString *utype;
//
//            NSDictionary *info1=@{@"apiID":apiID,@"apiKey":apiKey,@"code":@"8888",@"uType":utype,@"data":jsonStr};
//            [manager GET:kRegistURL parameters:info1 progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                if (responseObject) {
//                    NSLog(@"验证码测试");
//                    NSDictionary *resInfo=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//                    if ([resInfo[@"status"]intValue ]==17800) {
//                        //定时器启动
//                        timeDown=59;
//                        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
//
//                    }else if ([resInfo[@"status"]intValue ]==17801) {//用户已存在
//                        NSString *mess=resInfo[@"info"];
//                        timerBtn.userInteractionEnabled=YES;
//                        [MBProgressHUD showError:mess toView:nil];
//                    }else{
//                        timerBtn.userInteractionEnabled=YES;
//                        NSString *mess=resInfo[@"info"];
//                         [MBProgressHUD showError:mess toView:nil];
//                    }
//
//                }
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                timerBtn.userInteractionEnabled=YES;
//                NSString *mess=@"请求失败,请检查您的网络是否正常";
//
//               [MBProgressHUD showError:mess toView:nil];
//
//            }];
//
//    }else{
//          [MBProgressHUD showError:@"输入不能为空哦" toView:nil];
//
//    }
//
}
-(void)timerRun{
    if(timeDown>0)
    {
        [timerBtn setUserInteractionEnabled:NO];
        timerBtn.backgroundColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
        int sec = ((timeDown%(24*3600))%3600)%60;
        [timerBtn setTitle:[NSString stringWithFormat:@"已发送(%d)s",sec] forState:UIControlStateNormal];
        
    }
    else
    {
        [timerBtn setUserInteractionEnabled:YES];
        timerBtn.backgroundColor=kBlueGreenColor;
        [timerBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        
        [_timer invalidate];
        
    }
    timeDown -=1;
}
-(void)loginClick{//注册
    
//    if (numField.text.length>0) {
//        active=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(kScreenWidth/2-25, (kScreenHeight-100)/2, 50, 50)];
//        active.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
//        active.color = [UIColor blackColor];
//        active.hidesWhenStopped = YES;
//
//        [self.view addSubview:active];
//        [active startAnimating];
//
//        //参数：apiID;apiKey;code;uType;data
//        //说明:uType [=asms 发送验证码][=areg 注册] code默认传8888
//        NSDictionary *newDic=@{@"userId":@"0",@"uName":numField.text,@"uPwd":[DHHleper getPassWordWithstring:passField.text],@"loginNum":@"1",@"dtCreate":@"",@"isLock":@"false",@"isLogistics":@"false",@"logo":@"",@"key":[DHHleper getUserTokenWithName:[NSString stringWithFormat:@"%@",numField.text]],@"groupId":@"0"};
//        NSString *utype;
//        if (self.inType.intValue==1) {
//            utype=@"areg";
//        }else{
//            utype=@"epwd";
//        }
//        NSString *jsonStr=[DHHleper convertToJsonData:newDic];
//        NSDictionary *info1=@{@"apiID":apiID,@"apiKey":apiKey,@"code":checkField.text,@"uType":utype,@"data":jsonStr};
//        [manager GET:getCodeAndResUrl parameters:info1 progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            if (responseObject) {
//                [active stopAnimating];
//                NSLog(@"注册测试");
//                NSDictionary *resInfo=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//                if ([resInfo[@"status"]intValue ]==17800) {//注册成功
//                    NSString *mess;
//                    if (self.inType.intValue==1) {
//                        mess=@"注册成功";
//                    }else{
//                        BOOL isLogin=[[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
//                        if (isLogin) {
//
//                            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"isLogin"];
//
//                            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userName"];
//
//                            [[NSNotificationCenter defaultCenter] postNotificationName:@"Login" object:nil userInfo:nil];}
//                        mess=@"修改成功";
//                    }
//                    UIAlertController *actionAlert=[UIAlertController alertControllerWithTitle:messTitle message:mess preferredStyle:(UIAlertControllerStyleAlert)];
//
//                    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//                        self.callBackBlock();
//                        [self dismissViewControllerAnimated:YES completion:nil];
//                    }];
//
//                    [actionAlert addAction:ok];
//                    [self presentViewController:actionAlert animated:YES completion:nil];
//                }else {//用户已存在
//                    NSString *info=resInfo[@"info"];
//                    UIAlertController *actionAlert=[UIAlertController alertControllerWithTitle:messTitle message:info preferredStyle:(UIAlertControllerStyleAlert)];
//
//                    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
//
//                    [actionAlert addAction:ok];
//                    [self presentViewController:actionAlert animated:YES completion:nil];
//                }
//
//            }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSString *mess=@"请求失败,请检查您的网络是否正常";
//            //
//                        [MBProgressHUD showError:mess toView:nil];
//
//        }];
//
//
//    }else{
//       [MBProgressHUD showError:@"输入不能为空哦" toView:nil];
//    }
}

- (void)textFieldDidChange:(UITextField *)textField{
    //    if (numField.text.length<numberOfPhone) {
    //        timerBtn.userInteractionEnabled=NO;
    //        timerBtn.backgroundColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
    //    }
    //
    if (numField.text.length>=11) {
        if (timeDown==0) {
            timerBtn.userInteractionEnabled=YES;
            timerBtn.backgroundColor=kBlueGreenColor;
        }
        
    }else{
        timerBtn.userInteractionEnabled=NO;
        timerBtn.backgroundColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
    }
        if (numField.text.length > 11) {
            numField.text = [numField.text substringToIndex:11];
        }
    if (checkField.text.length>=6&&numField.text.length==11) {
        loginBtn.userInteractionEnabled=YES;
        loginBtn.backgroundColor=kBlueGreenColor;
        
    }else{
        loginBtn.userInteractionEnabled=NO;
        loginBtn.backgroundColor=[UIColor grayColor];
    }
    if (checkField.text.length>6) {
        checkField.text=[checkField.text substringToIndex:6];
    }
    
}
#pragma mark 隐私政策相关
-(void)privateURLClick{
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
    safariVC.delegate = self;
    
    // 建议
    [self presentViewController:safariVC animated:YES completion:nil];
}


- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
