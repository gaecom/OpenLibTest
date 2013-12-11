//
//  MTStatusBarVC.m
//  OpenLibTest
//
//  Created by cocoajin on 13-12-11.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "MTStatusBarVC.h"
#import "MTStatusBarOverlay.h"

@interface MTStatusBarVC ()<MTStatusBarOverlayDelegate>

@end

@implementation MTStatusBarVC

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
    
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    
//    MTStatusBarOverlay *overlay = [MTStatusBarOverlay sharedInstance];
//    overlay.animation = MTStatusBarOverlayAnimationFallDown;  
//    overlay.detailViewMode = MTDetailViewModeHistory;
//    overlay.delegate = self;
//    overlay.progress = 0.0;
//    [overlay postMessage:@"Following @myell0w on Twitter…"];
//    overlay.progress = 0.1;
//    // ...
//    [overlay postMessage:@"Following myell0w on Github…" animated:YES];
//    overlay.progress = 0.5;
//    // ...
//    [overlay postImmediateFinishMessage:@"Following was a good idea!" duration:2.0 animated:YES];
//    overlay.progress = 1.0;
    
    
    MTStatusBarOverlay *status = [MTStatusBarOverlay sharedInstance];
    status.progress = 0.0f;
    status.animation = MTStatusBarOverlayAnimationShrink;
    status.detailViewMode = MTDetailViewModeDetailText;
    status.detailText = @"jkk"; //只有在 animation为 MTStatusBarOverlayAnimationFallDown 时，才会显示此处的detailText;
    [status postMessage:@"正在下载数据..." animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(DownloadData) userInfo:nil repeats:YES];
}

- (void)DownloadData
{
 
    [MTStatusBarOverlay sharedInstance].progress += 0.2;
    if ([MTStatusBarOverlay sharedInstance].progress >= 1.0) {
        [[MTStatusBarOverlay sharedInstance] postFinishMessage:@"下载成功！" duration:2.0f animated:YES];
        double delayInSeconds = 0.5f;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [MTStatusBarOverlay sharedInstance].progress = 0.0f;
            [[MTStatusBarOverlay sharedInstance] postMessage:@"正在下载数据..." animated:YES];
        });
    }
}

- (void)statusBarOverlayDidRecognizeGesture:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"line<%d> %s",__LINE__,__func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
