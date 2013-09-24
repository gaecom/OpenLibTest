//
//  TMCacheVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-24.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "TMCacheVC.h"
#import "TMCache.h"

@interface TMCacheVC ()

@end

@implementation TMCacheVC

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
    
    TMCache *aCache = [TMCache sharedCache];
    [aCache setObject:@"hello" forKey:@"hi"];
    NSLog(@"line(%d): %@",__LINE__,[aCache objectForKey:@"hi"]);
    NSLog(@"line(%d): %@",__LINE__,NSHomeDirectory());
    
    
    
    
}

- (void)tmcache
{
    /*
     *   TMCache 提供 disk or  memory 缓存
     *   可各自对应配置
     *
     **/
    
    TMCache *theCache = [TMCache sharedCache];
    //theCache = [[TMCache alloc]initWithName:@"aCache"];
    
    [theCache setObject:@"hello" forKey:@"hi"];
    NSLog(@"line(%d): %@",__LINE__,[theCache objectForKey:@"hi"]);
    
    [theCache objectForKey:@"hi"];
    [theCache objectForKey:@"hi" block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"line(%d): %@",__LINE__,object);
    }];
    
    [theCache setObject:@"222" forKey:@"name"];
    [theCache setObject:@"333" forKey:@"name3" block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"line:(%d) class %s",__LINE__,__func__);
    }];
    
    /*
     *   数据的清除
     *   数据的清除----
     
     - (void)removeAllObjects:(TMCacheBlock)block;
     
     //指定日期，删除数据！删除缓存的数据；
     - (void)trimToDate:(NSDate *)date;


     *
     **/
    
    [theCache removeObjectForKey:@"hi"];
    [theCache removeObjectForKey:@"hi" block:^(TMCache *cache, NSString *key, id object) {
        NSLog(@"line:(%d) class %s",__LINE__,__func__);
    }];
    
    
    
    /*
     *   TMDiskCache    TMMemoryCache
     *   对硬盘缓存管理   内存管理提供了更详细的配置 具体操作API
     *
     **/
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
