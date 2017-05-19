//
//  CYFlower.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/15.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYFlower.h"
#import "CYStem.h"
#import "CYPetal.h"
#import "CYSmile.h"

@implementation CYFlower

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_createFlower];
    }
    return self;
}

- (void)p_createFlower
{
    // 贴图的时候注意要由下而上，由内而外的贴。
    CGFloat fullwidth = self.bounds.size.width;
    CGFloat fullHeight = self.bounds.size.height;
    CGFloat halfWidth = self.bounds.size.width/2.f;
    CGFloat halfHeight = self.bounds.size.height/2.f;
    
    // 位置的计算是最麻烦
    CGRect smileRect = CGRectMake(halfWidth/2, halfHeight/4*.9,
                                  halfWidth, halfHeight);
    CGRect petalRect = CGRectMake(halfWidth-fullwidth/10, fullHeight/5,
                                  fullwidth/5, fullwidth/2);
    CGRect leafRect = CGRectMake(halfWidth-fullwidth/12, fullHeight*.84,
                                 fullwidth/5, fullwidth/2);
    CGRect stemRect = CGRectMake(halfWidth-fullwidth/8, halfHeight*1.3,
                                 fullwidth/4, halfHeight*.8);
    // 贴茎
    CYStem *stem = [[CYStem alloc]initWithFrame:stemRect];
    stem.outerColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
    stem.innerColor = [UIColor colorWithRed:.3 green:1 blue:.2 alpha:1];
    [self addSubview:stem];
    
    // 贴花瓣
    for (CGFloat i = M_PI / 10; i < M_PI * 2; i += M_PI / 7.5) {
        CYPetal *petal = [[CYPetal alloc]initWithFrame:petalRect];
        petal.outerColor = [UIColor  purpleColor];
        petal.innerColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
        [self addSubview:petal];
        petal.layer.anchorPoint = CGPointMake(.5, 1);
        petal.transform = CGAffineTransformMakeRotation(i);
    }
    
    // 贴叶子
    for (CGFloat i = -M_PI/5; i <= M_PI/5; i += M_PI * 2/5) {
        CYPetal *leaf = [[CYPetal alloc]initWithFrame:leafRect];
        leaf.outerColor = [UIColor colorWithRed:0 green:.5 blue:0 alpha:1 ];
        leaf.innerColor = [UIColor colorWithRed:.3 green:1 blue:.2 alpha:1];
        [self addSubview:leaf];
        leaf.layer.anchorPoint = CGPointMake(.5, 1);
        leaf.transform = CGAffineTransformMakeRotation(i);
    }
    
    // 贴笑脸
    CYSmile *smile = [[CYSmile alloc]initWithFrame:smileRect];
    smile.innerColor = [UIColor yellowColor];
    smile.outerColor = [UIColor colorWithRed:1 green:.4 blue:0 alpha:1];
    [self addSubview:smile];
    
}
@end























