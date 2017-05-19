//
//  CYGradientView.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/17.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYGradientedView.h"

@implementation CYGradientedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (void)didMoveToSuperview
{
    self.backgroundColor = [UIColor blackColor];
    CGColorRef blackcolor = [[UIColor blackColor]CGColor];
    UIColor *color1 = [UIColor colorWithRed:0.01 green:0.2 blue:0.8 alpha:1];
    UIColor *color2 = [UIColor colorWithRed:1 green:0.5 blue:0 alpha:1];
    UIColor *color3 = [UIColor colorWithRed:.35 green:.74 blue:.11 alpha:1];
    NSArray *colors = [NSArray arrayWithObjects:(id)[color1 CGColor],
                       [color2 CGColor],
                       [color3 CGColor],
                       nil];
    NSNumber *location1 = [NSNumber numberWithFloat:.0];
    NSNumber *location2 = [NSNumber numberWithFloat:.4];
    NSNumber *location3 = [NSNumber numberWithFloat:.9];
    
    CAGradientLayer *layer = (CAGradientLayer *)[self layer];
    layer.colors = colors;
    layer.locations = @[location1,location2,location3];
    layer.startPoint = CGPointMake(.5, 0);
    layer.endPoint = CGPointMake(.5, 1);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"startPoint"];
    animation.duration = 6.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(.5, 1)];
    
    [layer addAnimation:animation forKey:@"start"];
    
    animation.keyPath = @"colors";
    animation.duration = 6.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fromValue = [NSArray arrayWithObjects:(__bridge id)blackcolor, blackcolor, blackcolor, nil];
    
    [layer addAnimation:animation forKey:@"color"];
}
@end


















