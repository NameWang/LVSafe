//
//  LVUserInfoViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVUserInfoViewController.h"
#import "LVUserInfoTableViewCell.h"
#import "YSPhotoPicker.h"
#import "LVChangeInfoViewController.h"
#import "LVChangePWDViewController.h"

@interface LVUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource,YSPhotoPickerDelegate>
{
    
    UITableView *userInfoTableView;
    NSMutableArray *dataSource;
    NSMutableArray *titleAry;
    BOOL isLogin;
    AvtionImageView *topImgView;
    AvtionImageView *iconImgView;
    UIButton *loginAndNameBtn,*backBtn;
    YSPhotoPicker *photoPicker;
    NSDictionary *userInfo;
}


@end

@implementation LVUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=kBGWhiteColor;
    isLogin=[[[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"] boolValue];
    //
    //isLogin=YES;
    dataSource=[NSMutableArray arrayWithObjects:@"手机号",@"身份证",@"姓名",@"签名",@"家庭住址",@"家庭电话",@"修改密码", nil];
    //titleAry=[NSMutableArray arrayWithObjects:@"消息管理",@"系统设置",@"关于我们", nil];
    
    [self initTopView];
    
}
-(void)initTopView{
    topImgView=[[AvtionImageView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, 0.5*kScreenWidth)];
    topImgView.userInteractionEnabled=YES;
    topImgView.image=[UIImage imageNamed:@"sky-h"];
    [self.view addSubview:topImgView];
    backBtn=[[UIButton alloc] initWithFrame:CGRectMake(20, 55, 25, 25)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"leftbackicon_white_titlebar_24x24_@2x"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:(UIControlEventTouchUpInside)];
    [topImgView addSubview:backBtn];
    iconImgView=[[AvtionImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-40, 0.4*topImgView.frame.size.height, 80, 80)];
    //绘制曲线路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:iconImgView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(40, 40)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = iconImgView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    iconImgView.layer.mask = maskLayer;
    [iconImgView addTarget:self action:@selector(changeIconClick)];
    
    iconImgView.image=[UIImage imageNamed:@"car"];
    
    [topImgView addSubview:iconImgView];
    loginAndNameBtn=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/2-50, CGRectGetMaxY(iconImgView.frame)+10, 100, 25)];
    loginAndNameBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [loginAndNameBtn setTitle:@"点击更换头像" forState:(UIControlStateNormal)];
    [loginAndNameBtn setTintColor:[UIColor whiteColor]];
    [loginAndNameBtn addTarget:self action:@selector(changeIconClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [topImgView addSubview:loginAndNameBtn];
    [self initTableView] ;
}
//更换头像事件
-(void)changeIconClick{
    photoPicker = [[YSPhotoPicker alloc] initWithViewController:self];
  photoPicker.delegate = self;
    
    [photoPicker showPickerChoice];
}
-(void)backClick{
   
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initTableView{
    userInfoTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topImgView.frame)+2, kScreenWidth, kScreenHeight-topImgView.frame.size.height+20) style:(UITableViewStylePlain)];
    [userInfoTableView registerNib:[UINib nibWithNibName:@"LVUserInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"LVUserInfoTableViewCell"];
    
    
    userInfoTableView.delegate=self;
    userInfoTableView.dataSource=self;
    userInfoTableView.tableFooterView=[[UIView alloc] init];
    [self.view addSubview:userInfoTableView];
}
#pragma mark tableView delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    
    LVUserInfoTableViewCell *nocell=[tableView dequeueReusableCellWithIdentifier:@"LVUserInfoTableViewCell" forIndexPath:indexPath];
    nocell.titLabel.text=dataSource[indexPath.row];
    switch (indexPath.row) {
        case 0:case 1:case 2:
            {
                   nocell.accessoryType=UITableViewCellAccessoryNone;
            }
            break;
            
        default:
            break;
    }
    cell=nocell;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LVChangeInfoViewController *change=[[LVChangeInfoViewController alloc] init];
      self.hidesBottomBarWhenPushed=YES;
    change.callBackBlock = ^{
       
    };
    switch (indexPath.row) {
        case 3:
        {
            change.type=@"签名";
            
            [self.navigationController pushViewController:change animated:YES];
        }
            break;
        case 4:{
            change.type=@"家庭住址";
            
            [self.navigationController pushViewController:change animated:YES];
        }break;
        case 5:{
           change.type=@"家庭电话";
            
            [self.navigationController pushViewController:change animated:YES];
        }break;
        case 6:{
            LVChangePWDViewController *pwd=[[LVChangePWDViewController alloc] init];
            pwd.callBackBlock = ^{
               
            };
              [self.navigationController pushViewController:pwd animated:YES];
        }break;
        default:
            break;
    }
  
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataSource.count;
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didSelectImage:(UIImage *)image
{
    
    
    if (image)
    {
      //  [self.userDataHandler uploadHeadImage:image];
        __weak AvtionImageView *imgv=iconImgView;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSDictionary *dict = @{@"uid" : @""};
            
            AFHTTPSessionManager *s_manager = [AFHTTPSessionManager manager];
            s_manager.responseSerializer=[AFHTTPResponseSerializer serializer];
            NSString *url =@"";
            
            NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
            [s_manager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                 [formData appendPartWithFileData:imageData name:@"picFile" fileName:@"picFile.jpg" mimeType:@"image/png"];
            } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (responseObject) {
                      [MBProgressHUD showSuccess:@"头像修改成功!"];
                    dispatch_async(dispatch_get_main_queue(), ^{
                          imgv.image=image;
                    });
                }
              
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DLog(@"%@",error.domain);
            }];
         
        });
        iconImgView.image=image;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
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
