//
//  CYSmile.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/7.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYSmile.h"

@implementation CYSmile


- (void)drawRect:(CGRect)rect {
    
    // 基础点
    CGFloat fullWidth = self.bounds.size.width;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat halfWidth = fullWidth / 2.f;
    CGFloat halfHeight = fullHeight / 2.f;
    CGFloat radius = MIN(halfWidth, halfHeight);
    CGPoint center = CGPointMake(halfWidth, halfHeight);
    
    // bezierPath 切圆
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [bezier addClip];
    
    // 填充梯度，从中心发散
    CGGradientRef gradient = [self gradientWithColor:self.innerColor toColor:self.outerColor count:2];
    CGContextRef graphics = UIGraphicsGetCurrentContext();
    CGContextDrawRadialGradient(graphics, gradient, center, 0, center, radius, 0);
    
    // 划线
    bezier.lineWidth = self.lineThickness * 1.7;
    [self.strokeColor setStroke];
    [bezier stroke];
    
    // 准备画嘴巴
    [bezier removeAllPoints];
    bezier.lineWidth = self.lineThickness;
    [bezier moveToPoint:CGPointMake(halfWidth * 0.5, halfHeight * 1.3)];
    [bezier addQuadCurveToPoint:CGPointMake(halfWidth * 1.5, halfHeight * 1.3)
                   controlPoint:CGPointMake(halfWidth, fullHeight * 0.91)];
    [bezier stroke];
    
    // 准备画左眼
    bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(fullWidth / 3 - halfWidth * .1,
                                                               fullHeight  / 3.f,
                                                               halfWidth * .2,
                                                               halfHeight * .3)];
    bezier.lineWidth = self.lineThickness;
    [bezier fill];
    [bezier stroke];
    
    // 画右眼
    bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(fullWidth / 3 * 2 - halfWidth * .1,
                                                               fullHeight / 3.f,
                                                               halfWidth * .2,
                                                               halfHeight * .3)];
    bezier.lineWidth = self.lineThickness;
    [bezier fill];
    [bezier stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}


@end
