//
//  LVTabbarViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/22.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVTabbarViewController.h"
#import "LVMineViewController.h"
#import "LVHomeViewController.h"
#import "LVFindCarViewController.h"
@interface LVTabbarViewController ()

@end

@implementation LVTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LVMineViewController *mine=[[LVMineViewController alloc] init];
    mine.tabBarItem.title=@"我的";
    CGSize size = CGSizeMake(30, 30);
    
    NSString *imageName = @"mine";
 
    mine.tabBarItem.image = [self getImageWithName:imageName size:size];
    
    NSString *selectedImageName = @"mine-s";
  
    mine.tabBarItem.selectedImage = [[self getImageWithName:selectedImageName size:size] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mine.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    LVFindCarViewController *find=[[LVFindCarViewController alloc] init];
    find.tabBarItem.title=@"寻车";
    CGSize size2 = CGSizeMake(30, 30);
    
    NSString *imageName2 = @"find";
    
    find.tabBarItem.image = [self getImageWithName:imageName2 size:size2];
    
    NSString *selectedImageName2 = @"find-s";
    
    find.tabBarItem.selectedImage = [[self getImageWithName:selectedImageName2 size:size2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LVHomeViewController *home=[[LVHomeViewController alloc] init];
    home.tabBarItem.title=@"首页";
   
    NSString *imageName1 = @"home";
    home.tabBarItem.image = [self getImageWithName:imageName1 size:size];
    
    NSString *selectedImageName1 = @"home-s";
    home.tabBarItem.selectedImage = [[self getImageWithName:selectedImageName1 size:size] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    home.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    UINavigationController *homeNav=[[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController *findNav=[[UINavigationController alloc] initWithRootViewController:find];
    UINavigationController *mineNav=[[UINavigationController alloc] initWithRootViewController:mine];
    
    
    self.viewControllers=@[homeNav,findNav,mineNav];
    self.selectedIndex=0;
    
}
- (UIImage *)getImageWithName:(NSString *)imageName size:(CGSize)size
{
    // 切图大小不匹配，自己根据尺寸需求重绘图片。临时解决方式
    UIImage *image = [UIImage imageNamed:imageName];
    
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage* newImage =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // 用原图，否则系统会进行渲染
    newImage = [newImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return newImage;
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
