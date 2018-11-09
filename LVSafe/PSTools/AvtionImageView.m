//
//  AvtionImageView.m
//  DHMarket
//
//  Created by cnelc on 2017/6/6.
//  Copyright © 2017年 wang. All rights reserved.
//

#import "AvtionImageView.h"
@interface AvtionImageView()
@property(nonatomic,weak) id target;
@property(nonatomic,assign) SEL action;
@end
@implementation AvtionImageView
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Warc-performSelector-leaks"

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.target respondsToSelector:self.action]) {
        [self.target performSelector:self.action withObject:self];
    }else{
        NSLog(@"Image Avt Error!");
    }
}
#pragma clang  diagnostic pop

-(void)addTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled=YES;
    self.target=target;
    self.action=action;
    
}


@end
