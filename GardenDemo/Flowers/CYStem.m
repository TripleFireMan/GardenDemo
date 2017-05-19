//
//  CYStem.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/14.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYStem.h"

@implementation CYStem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 ------------------------------------------------------------------------
 |                                   . start point               corner .|
 |                                  .  .                                 |
 |                                 .  .                                  |
 |                                .  .                                   |
 |                               .   .                                   |
 |                               .   .                                   |
 |                               .  .                                    |
 |                               .   .                                   |
 |. left ctrl                    .   ..mid point                         |
 |                                .   .                                  |
 |                                .   .                                  |
 |                                 .  .                                  |
 |                                 .  .                                  |
 |                                  .  .                                 |
 |                                  .  .                                 |
 |                                   .  .                                |
 |                                    . .                                |
 |                                   . end point            right ctrl . |
 ------------------------------------------------------------------------
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat fullWidth = self.bounds.size.width;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat halfWidth = fullWidth / 2;
    CGFloat halfHeight = fullHeight / 2;
    
    CGPoint startPoint = CGPointMake(halfWidth * .9, 0);
    CGPoint midPoint = CGPointMake(halfWidth, halfHeight);
    CGPoint endPoint = CGPointMake(halfWidth * .9, fullHeight);
    CGPoint corner = CGPointMake(fullWidth, 0);
    CGPoint leftCtl = CGPointMake(0, halfHeight);
    CGPoint rightCtl = CGPointMake(fullWidth, fullHeight);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:leftCtl controlPoint2:rightCtl];
    [path addCurveToPoint:startPoint controlPoint1:rightCtl controlPoint2:midPoint];
    [path closePath];
    [path addClip];
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGGradientRef gradient = [self gradientWithColor:self.innerColor toColor:self.outerColor count:3];
    CGContextDrawLinearGradient(ref, gradient, CGPointZero, corner, 0);
    path.lineWidth = self.lineThickness;
    
    [self.strokeColor setStroke];
    [path stroke];
    
    
}

@end
