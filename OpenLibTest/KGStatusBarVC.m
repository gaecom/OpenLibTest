//
//  KGStatusBarVC.m
//  OpenLibTest
//
//  Created by cocoajin on 13-12-6.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "KGStatusBarVC.h"
#import "KGStatusBar.h"

@interface KGStatusBarVC ()

@end

@implementation KGStatusBarVC

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
    
    //可配置的方法
    /**
     + (void)showWithStatus:(NSString*)status;
     + (void)showErrorWithStatus:(NSString*)status;
     + (void)showSuccessWithStatus:(NSString*)status;
     + (void)dismiss;
     
     */
    

    
}

- (void)viewWillAppear:(BOOL)animated
{
    //[KGStatusBar showWithStatus:@"hello KGStatusBar"];
    
    //[KGStatusBar showSuccessWithStatus:@"hello success"];
    
    [KGStatusBar showErrorWithStatus:@"hello error"];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [KGStatusBar dismiss];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
