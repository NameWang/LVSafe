//
//  BMKWalkNaviViewController.m
//  WalkCycleComponetTest
//
//  Created by Xin,Qi on 29/01/2018.
//  Copyright © 2018 Baidu. All rights reserved.
//

#import "BMKWalkNaviViewController.h"

#import <BaiduMapAPI_WalkNavi/BMKWalkNaviComponent.h>
@interface BMKWalkNaviViewController ()
@end

@implementation BMKWalkNaviViewController

- (void)loadView {
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"BMKWalkNaviViewController dealloc was called");
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
    if (self.navigationType == 0) {
        [[BMKWalkNavigationManager sharedManager] resume];
        [[BMKWalkNavigationManager sharedManager] startWalkNavi:BMK_WALK_NAVIGATION_MODE_WALK_NORMAL];
    } else if (self.navigationType == 1) {
        [[BMKWalkNavigationManager sharedManager] resume];
        [[BMKWalkNavigationManager sharedManager] startWalkNavi:BMK_WALK_NAVIGATION_MODE_WALK_AR];
    }
    else {
        [[BMKCycleNavigationManager sharedManager] resume];
        [[BMKCycleNavigationManager sharedManager] startCycleNavi];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    if (self.navigationType == 0) {
        [BMKWalkNavigationManager destroy];
    } else {
        [BMKCycleNavigationManager destroy];
    }
}
@end

