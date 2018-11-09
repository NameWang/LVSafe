//
//  LVMineBaseViewController.m
//  PeopleSafity
//
//  Created by 何心晓 on 2018/10/23.
//  Copyright © 2018年 Runkuyun. All rights reserved.
//

#import "LVMineBaseViewController.h"

@interface LVMineBaseViewController ()
@property(nonatomic,strong)UISwipeGestureRecognizer *swipe;
@end

@implementation LVMineBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"sky"] forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:17],   NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.swipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftItemAction)];
    [self.view addGestureRecognizer:self.swipe];
    self.navigationController.navigationBar.hidden=NO;
   
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillDisappear:animated];
}


- (void)stopPopGestureRecognizer {
    [self.view removeGestureRecognizer:self.swipe];
}
-(void)leftItemAction{
    //[super leftItemAction];
    self.callBackBlock();
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)createItemWithImageName: (NSString *)imageName Selector:(SEL)selector{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageView.frame = CGRectMake(0, 0, 21, 21);
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    [imageView addGestureRecognizer:tap];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    return item;
}

- (UIBarButtonItem *)createItemWithText: (NSString *)text Selector:(SEL)selector{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStylePlain target:self action:selector];
    return item;
}

- (void)addLeftItemWithImageName:(NSString *)imageName {
    self.navigationItem.leftBarButtonItem = [self createItemWithImageName:imageName Selector:@selector(leftItemAction)];
}

- (void)addRightItemWithImageName:(NSString *)imageName {
    self.navigationItem.rightBarButtonItem = [self createItemWithImageName:imageName Selector:@selector(rightItemAction)];
}

- (void)addLeftItemWithText:(NSString *)text {
    self.navigationItem.leftBarButtonItem = [self createItemWithText:text Selector:@selector(leftItemAction)];
}

- (void)addRightItemWithText:(NSString *)text {
    self.navigationItem.rightBarButtonItem = [self createItemWithText:text Selector:@selector(rightItemAction)];
}


- (void)rightItemAction {
    
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
