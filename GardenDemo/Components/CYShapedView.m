//
//  CYShapedView.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/7.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYShapedView.h"

@implementation CYShapedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.innerColor = [UIColor redColor];
//        self.outerColor = [UIColor yellowColor];
        self.innerColor = [UIColor yellowColor];
        self.outerColor = [UIColor redColor];
        self.strokeColor = [UIColor blackColor];
        self.lineThickness = 3.f;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setLineThickness:(CGFloat)lineThickness
{
    CGFloat totalWidth = self.bounds.size.width;
    CGFloat totalHeight = self.bounds.size.height;
    CGFloat halfWidth = totalWidth / 2.f;
    CGFloat halfHeight = totalHeight / 2.f;
    CGFloat smallest = MIN(halfWidth, halfHeight);
    CGFloat factor = smallest / 100.f;
    factor = (factor > 1) ? 1 : factor;
    _lineThickness = factor * lineThickness;
}

- (CGGradientRef)gradientWithColor:(UIColor *)c1 toColor:(UIColor *)c2 count:(CGFloat)colorNumb
{
    // 获取颜色组成
    const CGFloat *colorComponents1 = CGColorGetComponents(c1.CGColor);
    CGFloat r1 = colorComponents1[0];
    CGFloat g1 = colorComponents1[1];
    CGFloat b1 = colorComponents1[2];
    
    const CGFloat *colorComponents2 = CGColorGetComponents(c2.CGColor);
    CGFloat r2 = colorComponents2[0];
    CGFloat g2 = colorComponents2[1];
    CGFloat b2 = colorComponents2[2];
    
    CGFloat gradientColorComponents[] = {
        r1,g1,b1,1,
        r2,g2,b2,1,
        r1,g1,b1,1,
    };
    
    // 使用RGB色生成颜色空间
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    // 根据RGB色和梯度色数组，以及梯度色个数，创建梯度引用
    CGGradientRef    gradientRef =  CGGradientCreateWithColorComponents(rgb, gradientColorComponents, NULL, colorNumb);
    CGColorSpaceRelease(rgb);
    
    return gradientRef;
}
@end
