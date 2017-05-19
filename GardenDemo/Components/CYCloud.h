//
//  CYCloud.h
//  GardenDemo
//
//  Created by 成焱 on 2017/5/18.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYShapedView.h"

@interface CYCloud : CYShapedView

@property (nonatomic, assign) CGFloat distance;

- (UIBezierPath *)createCloudPathWithHeight:(CGFloat)height;

@end
