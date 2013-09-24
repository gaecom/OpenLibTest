//
//  SVProgressVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-23.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "SVProgressVC.h"
#import "SVProgressHUD.h"

@interface SVProgressVC ()

@end

@implementation SVProgressVC

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
    
    
    
    UIButton *show = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    show.frame = CGRectMake(10, 10, 130, 35);
    [show setTitle:@"show" forState:UIControlStateNormal];
    [show addTarget:self action:@selector(showTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:show];
    
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    close.frame = CGRectMake(10, 60, 130, 35);
    [close setTitle:@"close" forState:UIControlStateNormal];
    [close addTarget:self action:@selector(closeTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:close];
    
}


- (void)showTaped
{
    /**
     *  显示不配置
     */
    
    //[SVProgressHUD show];
    
    /**
     *  显示配置模式，是否允许用户操作及背景；
     */
    
    //[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    
    /**
     *  显示 + 文本 及配置；
     */
    
    //[SVProgressHUD showWithStatus:@"加载中..."];
    //[SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeNone];
    
    
    /**
     *  显示加载进程，文本，模式
     */
    //[SVProgressHUD showProgress:0.8];
    //[SVProgressHUD showProgress:0.8 status:@"加载中..."];
    //[SVProgressHUD showProgress:0.8 status:@"加载中..." maskType:SVProgressHUDMaskTypeNone];
    
    
    
    /**
     *  加载成功，失败，提示
     */
    [SVProgressHUD showSuccessWithStatus:@"加载成功！"];
    //[SVProgressHUD showErrorWithStatus:@"加载失败！"];
    
    
    /**
     *  其他配置
     
     + (void)setStatus:(NSString*)string; // change the HUD loading status while it's showing
     + (void)showImage:(UIImage*)image status:(NSString*)status; // use 28x28 white pngs
     
     enum {
     SVProgressHUDMaskTypeNone = 1, // allow user interactions while HUD is displayed
     SVProgressHUDMaskTypeClear, // don't allow
     SVProgressHUDMaskTypeBlack, // don't allow and dim the UI in the back of the HUD
     SVProgressHUDMaskTypeGradient // don't allow and dim the UI with a a-la-alert-view bg gradient
     };

     
     */
    [SVProgressHUD isVisible];
    
    
}

- (void)closeTaped
{
    [SVProgressHUD dismiss];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
