//
//  CYSunShine.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/14.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//
/*
 ----------------------------------------------------------------------
 |                                                                     |
 |                                                                     |
 |                                                                     |
 |                -------------------------------                      |
 |                |         -------             |                      |
 |                |         |     |             |                      |
 |                |         |  花 |             |                      |
 |                |         |  瓣 |             |                      |
 |                |         |  区 |             |                      |
 |                |         |     |             |                      |
 |                |         |     |             |                      |
 |                |         -------             |                      |
 |                |                             |                      |
 |                |         太阳区              |                      |
 |                |                             |                      |
 |                -------------------------------                      |
 |                                                                     |
 |                                                                     |
 |                                                                     |
 |                                                                     |
 ------------------------------------------------------------------------
 */
#import "CYSunShine.h"

@implementation CYSunShine


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _speed = 1.f;
        [self createSunshine];
    }
    return self;
}

- (void)createSunshine
{
    // 设置大小
    
    CGFloat fullWidth = self.bounds.size.width;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat halfWidth = fullWidth / 2.f;
    CGFloat halfHeigt = fullHeight / 2.f;
    
    // 设置太阳和光芒的位置
    CGRect sunRect = CGRectMake(halfWidth - fullWidth / 4, halfHeigt - fullHeight / 4, halfWidth, halfHeigt);
    CGRect sunshineRect = CGRectMake(halfWidth - fullWidth / 40, halfHeigt - fullHeight / 8, fullWidth / 20, fullHeight / 4);
    
    // 创建光芒所在的view，并将本类的shineLayer指向它的layer，方便后面添加动画
    UIView *shineView = [[UIView alloc]initWithFrame:self.bounds];
    self.shineLayer = shineView.layer;
    [self addSubview:shineView];
    
    // 将光芒都添加到光芒view上，并进行相应的transform转换和锚点设置
    for (CGFloat i = M_PI / 10; i < M_PI * 2; i += M_PI / 7.5) {
        CYPetal *petal = [[CYPetal alloc]initWithFrame:sunshineRect];
        petal.innerColor = [UIColor yellowColor];
        petal.outerColor = [UIColor colorWithRed:1 green:0.8 blue:.2 alpha:1];
        petal.lineThickness = 40.f;
        petal.strokeColor = [UIColor whiteColor];
        [shineView addSubview:petal];
        
        petal.layer.anchorPoint = CGPointMake(.5, 2);
        petal.transform = CGAffineTransformMakeRotation(i);
    }
    
    // 添加动画，让光芒动起来
    [self addRotationAnimation];
    
    // 添加太阳
    CYSmile *smile = [[CYSmile alloc]initWithFrame:sunRect];
    smile.innerColor = [UIColor yellowColor];
    smile.outerColor = [UIColor colorWithRed:1 green:.8 blue:.2 alpha:1];
    [self addSubview:smile];
    
}



- (void)addRotationAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    // 设置旋转动画
    basicAnimation.duration = 10;
    basicAnimation.fromValue = @0;
    basicAnimation.speed = self.speed;
    basicAnimation.toValue = @(M_PI * 2);
    basicAnimation.repeatCount = CGFLOAT_MAX;
    [self.shineLayer addAnimation:basicAnimation forKey:@"rotation"];
    
    // 设置透明度动画
    basicAnimation.keyPath = @"opacity";
    basicAnimation.duration = .5f;
    basicAnimation.autoreverses = YES;
    basicAnimation.fromValue = @0.7;
    basicAnimation.toValue = @1.0;
    [self.shineLayer addAnimation:basicAnimation forKey:@"fade"];
    
    // 设置大小动画
    basicAnimation.keyPath = @"transform.scale";
    basicAnimation.fromValue = @0.9;
    basicAnimation.toValue = @1.1;
    [self.shineLayer addAnimation:basicAnimation forKey:@"scale"];
    
}


- (void)setSpeed:(CGFloat)speed
{
    _speed = speed;
    [self.shineLayer removeAllAnimations];
    [self addRotationAnimation];
}



@end
