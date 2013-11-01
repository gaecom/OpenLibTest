//
//  PopoverViewTestVC.m
//  OpenLibTest
//
//  Created by cocoajin on 13-11-2.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "PopoverViewTestVC.h"
#import "PopoverView.h"

@interface PopoverViewTestVC ()

@end

@implementation PopoverViewTestVC

{
    PopoverView *popView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    /**
     相关配置
     
     1：支持ARC
     2: 使用 类方法或是 实例方法
     3：都是showAtPoint 某一点；
        都是inView 在哪个view中显示；
        text显示文本
        title显示带标题的
        viewArray 显示一组view
        stringArray 显示一组字符串 数组；
        imageArray 显示一组图片；
        delegate 支持代理回调
     4: 其他配置
        - (void)dismiss; 消失
        - (void)showActivityIndicatorWithMessage:(NSString *)msg; 显示一个带标题的指示器
        - (void)showImage:(UIImage *)image withMessage:(NSString *)msg; 显示一个图片 带标题
        - (void)showError; 成功
     
        - (void)showSuccess;失败
     
     5: 代理 
        - (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index;
     
        - (void)popoverViewDidDismiss:(PopoverView *)popoverView;
     
     */
    
    UIButton *showPop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showPop.frame = CGRectMake(20, 10, 100,30);
    [showPop setTitle:@"showPop" forState:UIControlStateNormal];
    [showPop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [showPop addTarget:self action:@selector(shopBtnTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showPop];
    
    UIView *aView = [[[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)] autorelease];
    aView.backgroundColor = [UIColor orangeColor];
    popView = [PopoverView showPopoverAtPoint:CGPointMake(100, 100) inView:self.view withTitle:@"Popoverview" withContentView:aView delegate:nil];

    //[popView showSuccess];
    
}

- (void)shopBtnTaped:(UIButton *)sender
{
    UIView *aView = [[[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)] autorelease];
    aView.backgroundColor = [UIColor orangeColor];
    [PopoverView showPopoverAtPoint:CGPointMake(50, 40) inView:self.view withContentView:aView delegate:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
