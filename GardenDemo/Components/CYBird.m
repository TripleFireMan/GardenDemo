//
//  CYBird.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/19.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYBird.h"

#define LOWWING 0.2
#define HEIGING 0.5
#define STEP 0.05
#define COUNT (HEIGING - LOWWING)/STEP * 2
@implementation CYBird

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)didMoveToSuperview
{
    if (!self.animationImages) {
        self.animationImages = [self arrayofImages];
    }
}

- (NSArray *)arrayofImages
{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:COUNT];
    for (CGFloat i = LOWWING; i < HEIGING; i+=STEP) {
        [arr addObject:[self animationFrame:i]];
    }
    
    for (CGFloat i = HEIGING; i > LOWWING; i -= STEP) {
        [arr addObject:[self animationFrame:i]];
    }
    
    return arr;
}


- (UIImage *)animationFrame:(CGFloat)frame
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, frame)];
    [path addQuadCurveToPoint:CGPointMake(.5, 0.6 - frame / 3) controlPoint:CGPointMake(.25, .25)];
    [path addQuadCurveToPoint:CGPointMake(1, frame) controlPoint:CGPointMake(.75, .25)];
    
    [path applyTransform:CGAffineTransformMakeScale(width, height)];
    path.lineWidth = height / 30;
    [path stroke];

    UIImage *imge = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imge;
}

@end
