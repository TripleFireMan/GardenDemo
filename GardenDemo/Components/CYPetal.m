//
//  CYPetal.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/7.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYPetal.h"

/*---------------------------------------------------------------------------*/
//              -----------------------------------------
//              |                . -> start poin       .|corner
//   . left ctl |                                       |           . right ctl
//              |                                       |
//              |                                       |
//              |                                       |
//              |                                       |
//              |             mind point                |
//              |                .                      |
//              |                                       |
//              |                . -> end pint          |
//              -----------------------------------------
/*----------------------------------------------------------------------------*/

@implementation CYPetal


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {    
    CGFloat fullWidth = self.bounds.size.width;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat halfWidth = fullWidth / 2.f;
    CGFloat halfHeight = fullHeight / 2.f;
    CGPoint startPoint = CGPointMake(halfWidth, 3.f);
    CGPoint midPoint = CGPointMake(halfWidth, halfHeight * 1.6f);
    CGPoint endPoint = CGPointMake(halfWidth, fullHeight);
    CGPoint leftCtl = CGPointMake(-halfWidth, halfHeight / 3.f);
    CGPoint rightCtl = CGPointMake(fullWidth * 1.5f, halfHeight / 3.f);
    CGPoint corner = CGPointMake(fullWidth, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:leftCtl controlPoint2:midPoint];
    [path addCurveToPoint:startPoint controlPoint1:midPoint controlPoint2:rightCtl];
    [path addClip];
    
    CGGradientRef gradient = [self gradientWithColor:self.innerColor toColor:self.outerColor count:3];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawLinearGradient(context, gradient, CGPointZero, corner, 0);
    path.lineWidth = self.lineThickness;
    [self.strokeColor setStroke];
    [path stroke];
}

@end
