//
//  CYFlowerViewController.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/17.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYFlowerViewController.h"
#import "CYFlower.h"
#import "UIView+CYCompositedView.h"
#import "CYGradientedView.h"
#import "CYCloud.h"
#import "CYSunShine.h"
#import "CYBird.h"

@interface CYFlowerViewController ()

@end

@implementation CYFlowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
//    self.navigationItem.leftBarButtonItem = back;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"FLOWER DEMO";
    
    CYGradientedView *gradientView=  [[CYGradientedView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:gradientView];
    
    [self addFlowers];
    [self addSunShine];
    [self addCloud];
    [self addBird];
    
    // Do any additional setup after loading the view.
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)addFlowers
{
    CGFloat height = self.view.bounds.size.height;
    CGFloat width = self.view.bounds.size.width;
    
    // 花的高度
    CGFloat flowerHeight = height / 6;
    
    // 花的起始位置
    CGFloat flowerY = height * 0.3;

    // 创建花
    CYFlower *flower = [[CYFlower alloc]initWithFrame:CGRectMake(0, 0, flowerHeight * .7, flowerHeight)];
    
    // 生成花图片
    UIImage *floweimg = [flower cy_compositedView];
    
    // 贴花
    for (int i = 0; i < 60; i ++) {
        int size = height / 12.f;
        CGFloat flowersize =( arc4random() % (int) size) + size;
        
        UIImageView *flowerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(arc4random()%(int)width * 0.9, arc4random() % (int)flowerY + 2 * flowerY, flowersize * .7, flowersize)];
        flowerImgView.image = floweimg;
        
        // z position设置，这样会有层次感
        flowerImgView.layer.zPosition = flowerImgView.frame.origin.y + flowersize;
        [self.view addSubview:flowerImgView];
        // 花生长
        [self growFlowers:flowerImgView duration:arc4random() % 100 / 25 + 4];
    }
    
}

- (void)growFlowers:(UIImageView *)flowers duration:(CGFloat)duration
{
    // 花锚点设置
    flowers.layer.anchorPoint = CGPointMake(.5, 1);
    
    // 添加动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = duration;
    animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    [flowers.layer addAnimation:animation forKey:@"grow"];
}

- (void)addCloud
{
    CGFloat cloudWidth = self.view.bounds.size.width / 2;
    CGFloat cloudHeight = cloudWidth / 2;
    CGFloat cloudY     = self.view.bounds.size.height / 7;
    
    CGRect cloudFrame = CGRectMake(-cloudWidth, cloudY, cloudWidth, cloudHeight);
    CYCloud *cloud = [[CYCloud alloc]initWithFrame:cloudFrame];
    cloud.outerColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    cloud.innerColor = [UIColor colorWithRed:1 green:1 blue:.5 alpha:1];
    [self.view addSubview:cloud];
    
    CGFloat width = self.view.bounds.size.width;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(width + cloudWidth / 2, cloudY + cloudHeight / 2)];
    animation.duration = 20.f;
    animation.repeatCount = CGFLOAT_MAX;
    [cloud.layer addAnimation:animation forKey:@"position"];
}

- (void)addSunShine
{
    CGFloat w = self.view.bounds.size.width;
    CGFloat h = self.view.bounds.size.height;
    CYSunShine *sunShine = [[CYSunShine alloc]initWithFrame:CGRectMake(w * 0.7, 44 + 20, w / 4, h / 6)];
    [self.view addSubview:sunShine];
}

- (void) addBird {
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    CGRect rect = CGRectMake(-width/5, width/8, width/8, height/8);
    CYBird *bird = [[CYBird alloc] initWithFrame:rect];
    [self.view addSubview:bird];;
    bird.animationDuration = 1.0;
    [bird startAnimating];
    
    CABasicAnimation *birdAnim = [CABasicAnimation animation];
    birdAnim.keyPath = @"position";
    CGPoint birdPos = CGPointMake(width, bird.center.y*2);
    birdAnim.toValue = [NSValue valueWithCGPoint:birdPos];
    birdAnim.duration = 10;
    birdAnim.repeatCount = MAXFLOAT;
    [bird.layer addAnimation:birdAnim forKey:@"pos"];
    
}

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
