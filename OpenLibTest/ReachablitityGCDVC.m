//
//  ReachablitityGCDVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-17.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "ReachablitityGCDVC.h"
#import "Reachability.h"

@interface ReachablitityGCDVC ()

@end

@implementation ReachablitityGCDVC

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
	// Do any additional setup after loading the view.
    
    /**
     *  网络连接状态的通知；
     */
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];

    
    Reachability *reachObj = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    
    //Reachability *reachObj = [Reachability reachabilityForInternetConnection];
    
    //Reachability *reachObj = [Reachability reachabilityForLocalWiFi];

    reachObj.reachableBlock = ^(Reachability *reach)
    {
        /**
         *  回主线刷新UI
         *
         */
//        dispatch_async(dispatch_get_main_queue(), ^{
//            blockLabel.text = @"Block Says Reachable";
//        });
        
        NSLog(@"line(%d): %@",__LINE__,@"连接成功。。。");
        NSLog(@"当前连接状态：%@",[reach currentReachabilityString]);
        NSLog(@"当前连接状态：%@",[reach currentReachabilityFlags]);
        NSLog(@"isConnectionRequired %d",[reach isConnectionRequired]);

    };
    
    reachObj.unreachableBlock = ^(Reachability *reach)
    {
      NSLog(@"line(%d): %@",__LINE__,@"连接失败");
    };
    
    [reachObj startNotifier];
    
    
}

-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        NSLog(@"line:(%d) class %s",__LINE__,__func__);
        NSLog(@"line(%d): %@",__LINE__,@"连接成功。。。");
    }
    else
    {
        NSLog(@"line:(%d) class %s",__LINE__,__func__);
        NSLog(@"连接失败。。。");
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
