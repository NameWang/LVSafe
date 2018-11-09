//
//  LVChangePWDViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/25.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVChangePWDViewController.h"

@interface LVChangePWDViewController ()<UITextFieldDelegate>
{
    NSString *messTitle;

    UITextField *numField;
    UITextField *passField,*confirmField;
    UIButton *loginBtn;
    AFHTTPSessionManager *manager;

    UIActivityIndicatorView *active;
}

@end

@implementation LVChangePWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"设置密码";
    self.view.backgroundColor=kBGWhiteColor;
    [self addLeftItemWithImageName:@"leftbackicon_white_titlebar_24x24_@2x"];
    manager=[AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
   
     numField=[[UITextField alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, 40)];
    numField.placeholder=@"请输入您的原密码";
    
    numField.font=[UIFont systemFontOfSize:15];
    numField.clearButtonMode=UITextFieldViewModeWhileEditing;
    UIView *leftView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    leftView.backgroundColor=[UIColor whiteColor];
    numField.leftView=leftView;
    numField.leftViewMode=UITextFieldViewModeAlways;
    numField.delegate=self;
    numField.backgroundColor=[UIColor whiteColor];
    numField.keyboardType = UIKeyboardTypeDefault;
    numField.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [numField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:numField];
    //
    passField=[[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(numField.frame), kScreenWidth, 40)];
    passField.placeholder=@"请输入6-15位数字或字母密码";
    passField.secureTextEntry=YES;
    passField.font=[UIFont systemFontOfSize:15];
    passField.clearButtonMode=UITextFieldViewModeWhileEditing;
    UIView *lView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    lView.backgroundColor=[UIColor whiteColor];
    passField.leftView=lView;
    passField.leftViewMode=UITextFieldViewModeAlways;
    passField.delegate=self;
    passField.keyboardType = UIKeyboardTypeDefault;
    passField.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [passField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    passField.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:passField];
    //
    confirmField=[[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(passField.frame), kScreenWidth, 40)];
    confirmField.placeholder=@"确认您的新密码";
    confirmField.secureTextEntry=YES;
    confirmField.font=[UIFont systemFontOfSize:15];
    confirmField.clearButtonMode=UITextFieldViewModeWhileEditing;
    UIView *lView2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    lView2.backgroundColor=[UIColor whiteColor];
    confirmField.leftView=lView2;
    confirmField.leftViewMode=UITextFieldViewModeAlways;
    confirmField.delegate=self;
    confirmField.keyboardType = UIKeyboardTypeDefault;
    confirmField.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [confirmField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    confirmField.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:confirmField];
    //
   
    //
    loginBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(confirmField.frame)+30, kScreenWidth-20, 40)];
    loginBtn.backgroundColor=[UIColor grayColor];
    
    loginBtn.layer.masksToBounds=YES;
    loginBtn.layer.cornerRadius=5;
    loginBtn.userInteractionEnabled=NO;
    
    [loginBtn setTitle:@"确认" forState:UIControlStateNormal];
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
    [passField resignFirstResponder];
    [confirmField resignFirstResponder];

}

-(void)loginClick{//注册
//
//    if (numField.text.length>0&&passField.text.length>0&&confirmField.text.length>0&&[passField.text isEqualToString:confirmField.text]) {
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
//            NSString *mess;
//            if (self.inType.intValue==1) {
//                mess=@"注册失败,请检查您的网络是否正常";
//            }else{
//                mess=@"修改失败,请检查您的网络是否正常";
//            }
//            UIAlertController *actionAlert=[UIAlertController alertControllerWithTitle:messTitle message:mess preferredStyle:(UIAlertControllerStyleAlert)];
//
//            UIAlertAction *ok=[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
//
//            [actionAlert addAction:ok];
//            [self presentViewController:actionAlert animated:YES completion:nil];
//
//
//        }];
//
//
//    }else{
//        UIAlertController *actionAlert=[UIAlertController alertControllerWithTitle:messTitle message:@"输入不能为空哦" preferredStyle:(UIAlertControllerStyleAlert)];
//
//        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
//
//        [actionAlert addAction:ok];
//        [self presentViewController:actionAlert animated:YES completion:nil];
//
//    }
}

- (void)textFieldDidChange:(UITextField *)textField{
    //    if (numField.text.length<numberOfPhone) {
    //        timerBtn.userInteractionEnabled=NO;
    //        timerBtn.backgroundColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];
    //    }
    //
    if (confirmField.text.length > 15) {
        confirmField.text = [confirmField.text substringToIndex:15];
    }
        if (passField.text.length > 15) {
            passField.text = [passField.text substringToIndex:15];
        }
    if (passField.text.length>5&&passField.text.length<16&&numField.text.length>0&&confirmField.text.length>5&&confirmField.text.length<16&&[passField.text isEqualToString:confirmField.text]) {
        loginBtn.userInteractionEnabled=YES;
        loginBtn.backgroundColor=kBlueGreenColor;
        
    }else{
        loginBtn.userInteractionEnabled=NO;
        loginBtn.backgroundColor=[UIColor grayColor];
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
