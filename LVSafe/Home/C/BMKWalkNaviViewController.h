//
//  BMKWalkNaviViewController.h
//  WalkCycleComponetTest
//
//  Created by Xin,Qi on 29/01/2018.
//  Copyright © 2018 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map_For_WalkNavi/BMKMapComponent.h>
#import <BaiduMapAPI_WalkNavi/BMKWalkNaviComponent.h>

typedef void(^BMKWalkTestOpenNPCGuiders)(NSArray <BMKWalkNavigationNPCGuider *> *guiders);

@interface BMKWalkNaviViewController : UIViewController

@property (nonatomic, assign) NSInteger navigationType; ///默认0：步行导航，1：步行AR导航 2：普通骑行，3：电动车骑行

@property (nonatomic, copy) BMKWalkTestOpenNPCGuiders openGuidersBlock;

@end
