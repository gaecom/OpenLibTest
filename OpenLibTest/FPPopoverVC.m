//
//  FPPopoverVC.m
//  OpenLibTest
//
//  Created by cocoajin on 13-11-1.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "FPPopoverVC.h"
#import "FPPopoverController.h"

@interface FPPopoverVC ()

@end

@implementation FPPopoverVC
{
    FPPopoverController *fpPopVC;
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
    
    UIViewController *aVC = [[UIViewController alloc]init];
    aVC.view.backgroundColor = [UIColor orangeColor];
    aVC.title = @"FPPopover";
    fpPopVC  = [[FPPopoverController alloc]initWithViewController:aVC];
    fpPopVC.tint = FPPopoverRedTint;
    fpPopVC.contentSize = CGSizeMake(300, 300);
    
    
    
    
    /**
     相关配置
     1：支持ARC;
     2: 使用只引入 FPPopoverController
     3：设置边框颜色 fpPopVC.tint = FPPopoverRedTint;
     4: 设置箭头方向  .arrowDirection = FPPopoverArrowDirectionUp
     5: 设置没有箭头 .arrowDirection = FPPopoverNoArrow;
     6: 设置无标题 .controller.title = nil;
     7: 设置无边框 .border = NO;
     8: 设置透明 ..alpha = 0.8;
     9: 代理方法：
        - (void)popoverControllerDidDismissPopover:(FPPopoverController *)popoverController;
        - (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController
        shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController;
     10：出现和消失方法
     
        -(void)presentPopoverFromView:(UIView*)fromView;
     
        -(void)presentPopoverFromPoint:(CGPoint)fromPoint;
    
        -(void)dismissPopoverAnimated:(BOOL)animated;
    
        typedef void (^FPPopoverCompletion)();
        -(void)dismissPopoverAnimated:(BOOL)animated completion:(FPPopoverCompletion)completionBlock;

     
     */
    
    
    
    
    UIButton *showPop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showPop.frame = CGRectMake(20, 10, 100,30);
    [showPop setTitle:@"showPop" forState:UIControlStateNormal];
    [showPop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [showPop addTarget:self action:@selector(shopBtnTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showPop];
    
    
    
}

- (void)shopBtnTaped:(UIButton *)sender
{
    [fpPopVC presentPopoverFromView:sender];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
