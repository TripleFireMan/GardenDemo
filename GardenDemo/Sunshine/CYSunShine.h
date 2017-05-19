//
//  CYSunShine.h
//  GardenDemo
//
//  Created by 成焱 on 2017/5/14.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYPetal.h"
#import "CYSmile.h"

@interface CYSunShine : UIView
@property (nonatomic, strong) CALayer *shineLayer;
@property (nonatomic, assign) CGFloat speed;


/**
   添加动画，主要是配合speed属性使用。
 */
- (void)addRotationAnimation;
@end
