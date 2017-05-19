//
//  ViewController.m
//  GardenDemo
//
//  Created by 成焱 on 2017/5/7.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "ViewController.h"
#import "CYPetal.h"
#import "CYGradientView.h"
#import "CYSmile.h"
#import "CYSunShine.h"
#import "CYFlower.h"
#import "CYFlowerViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) CYSunShine *sunShine;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"more" style:UIBarButtonItemStylePlain target:self action:@selector(handleButtonAction:)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    self.navigationItem.title = @"DEMO";
    
    
    [self addButton];
    
    [self addLeaf];
    [self addSmile];
    [self addSunShine];
    [self addFlower];
//    [self addGradient];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.sunShine.speed = 1;

}

- (void)addLeaf
{
    CYPetal *petal = [[CYPetal alloc]initWithFrame:CGRectMake(100, 100, 100, 150)];
    petal.innerColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    petal.outerColor = [UIColor colorWithRed:0 green:.7 blue:0 alpha:1];
    [self.view addSubview:petal];
    

}

- (void)addSmile
{
    CYSmile *smile = [[CYSmile alloc]initWithFrame:CGRectMake(100, 300, 140, 140)];
    smile.innerColor = [UIColor colorWithRed:1 green:.9 blue:0 alpha:1];
    smile.outerColor = [UIColor colorWithRed:1 green:.7 blue:0 alpha:1];
    [self.view addSubview:smile];
}

- (void)addGradient
{
    CYGradientView *gradientView = [[CYGradientView alloc]initWithFrame:CGRectMake(100, 500, 200, 200)];
    [self.view addSubview:gradientView];
}

- (void)addSunShine
{
    CGFloat width = self.view.bounds.size.width / 4;
    CGFloat height = 640.f / 4;
    CYSunShine *sunShine = [[CYSunShine alloc]initWithFrame:CGRectMake(100, 500, width, height)];
    [self.view addSubview:sunShine];
    
    self.sunShine = sunShine;
}

- (void)addFlower
{
    CGFloat width = self.view.bounds.size.height * 0.7 / 6;
    CGFloat height = self.view.bounds.size.height / 6;
    CYFlower *flower = [[CYFlower alloc]initWithFrame:CGRectMake(100 + width*2, 300, width, height)];
    [self.view addSubview:flower];
}

- (void)addButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - 120, 20 + 44, 100, 44);
    [btn setTitle:@"花生长" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)handleButtonAction:(id)sender
{
    CYFlowerViewController *flowerVC = [[CYFlowerViewController alloc]init];
    [self.navigationController pushViewController:flowerVC animated:YES];
}



@end

















