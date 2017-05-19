//
//  CYCloud.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/18.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYCloud.h"

@implementation CYCloud

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    CGFloat height = self.bounds.size.height;
    
    UIBezierPath *path = [self createCloudPathWithHeight:height];
    [path addClip];
    
    CGGradientRef gradientRef = [self gradientWithColor:self.innerColor toColor:self.outerColor count:2];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(0, height);
    CGContextDrawLinearGradient(context, gradientRef, startPoint, endPoint, 0);
    
    path.lineWidth = self.lineThickness;
    [self.strokeColor setStroke];
    [path stroke];
    
    UIBezierPath *shadowPath = [self createCloudPathWithHeight:height / 2];
    self.layer.shadowPath = shadowPath.CGPath;
    if (!self.distance) {
        self.distance = height * 1.8;
    }
    self.layer.shadowOffset = CGSizeMake(0, self.distance);
    
    self.layer.shadowOpacity = 0.4f;
    
    self.alpha = 0.9f;
    
}

- (UIBezierPath *)createCloudPathWithHeight:(CGFloat)height
{
    CGFloat width = self.bounds.size.width;
    
    CGFloat points[] = {
        0.4,0.2,
        0.5,0.1,0.6,0.2,
        0.8,0.2,0.8,0.4,
        0.9,0.5,0.8,0.6,
        0.8,0.8,0.6,0.8,
        0.5,0.9,0.4,0.8,
        0.2,0.8,0.2,0.6,
        0.1,0.5,0.2,0.4,
        0.2,0.2,0.4,0.2,
    };
    
    CGPoint cPoint;
    CGPoint point;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(points[0] * width, points[1] * height)];
    
    for (int i = 2; i < sizeof(points) / sizeof(CGFloat); i += 4) {
        cPoint = CGPointMake(points[i] * width, points[i + 1] * height);
        point  = CGPointMake(points[i + 2] * width, points[i + 3] * height);
        [path addQuadCurveToPoint:point controlPoint:cPoint];
    }
    
    [path closePath];
    
    return path;
}

@end
























