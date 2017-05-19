//
//  UIView+CYCompositedView.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/17.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "UIView+CYCompositedView.h"

@implementation UIView (CYCompositedView)
- (UIImage *)cy_compositedView
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *compositedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return compositedImage;
    
}
@end
