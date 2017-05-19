//
//  CYShapedView.h
//  GardenDemo
//
//  Created by 成焱 on 2017/5/7.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYShapedView : UIView

@property (nonatomic, strong) UIColor *innerColor;
@property (nonatomic, strong) UIColor *outerColor;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat lineThickness;

- (CGGradientRef)gradientWithColor:(UIColor *)c1
                           toColor:(UIColor *)c2
                             count:(CGFloat)colorNumb;
@end
