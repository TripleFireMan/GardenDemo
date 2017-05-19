//
//  CYGradientView.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/7.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYGradientView.h"
@implementation CYGradientView


- (void)drawRect:(CGRect)rect {
    rect = self.bounds;
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(self.bounds.size.width, self.bounds.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    [path addClip];

    CGGradientRef gradient = [self gradientWithColor:self.innerColor toColor:self.outerColor count:2];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

    [self.strokeColor setStroke];
    [path stroke];
}

@end
