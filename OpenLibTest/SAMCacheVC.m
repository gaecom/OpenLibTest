//
//  SAMCacheVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-24.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "SAMCacheVC.h"
#import "SAMCache.h"

@interface SAMCacheVC ()

@end

@implementation SAMCacheVC

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
    
    
    SAMCache *aCache = [SAMCache sharedCache];
    aCache[@"hi"] = @"hello";
    NSLog(@"line(%d): %@",__LINE__,[aCache objectForKeyedSubscript:@"hi"]);
       
    NSLog(@"line(%d): %@",__LINE__,[aCache pathForKey:@"hi"]);
    
}

- (void)test
{
    /*
     *   创建 SAMCache
     *   可以使用单例，也可以创建多个cache注意使用标识符对不同的cache
     *
     **/
    
    //SAMCache *aCache = [[SAMCache alloc]initWithName:@"aCache"];
    
    SAMCache *theCache = [SAMCache sharedCache];
    
    
    
    /*
     *   缓存读取，添加，删除；
     *   缓存管理
     *
     **/
    
    [theCache setObject:@"您好" forKey:@"hello"];
    
    [theCache objectExistsForKey:@"hello"];
    
//    [theCache objectForKey:@"hello" usingBlock:^(id<NSCopying> object) {
//        NSLog(@"line(%d): %@",__LINE__,object);
//    }];
    
    [theCache objectForKey:@"hello"];
    
    //[theCache removeObjectForKey:@"hello"];
    //[theCache removeAllObjects];
    
    
    
    /*
     *   使用下标
     *   标注
     *
     **/
    
    //theCache[@"编号"]= @01;
    [theCache setObject:@"您好" forKey:@"编号"];
    NSLog(@"line(%d): %@",__LINE__,[theCache objectForKeyedSubscript:@"编号"]);
    
    /*
     *   默认cache都会在内存和disk上缓存一份
     *   通过key来找到缓存文件；
     *
     **/
    NSLog(@"line(%d): %@",__LINE__,[theCache pathForKey:@"编号"]);
    
    
    
    /*
     *   SAMCache 的UIImage 分类
     *   新增的UIImage分类
     - (UIImage *)imageForKey:(NSString *)key;
     - (void)imageForKey:(NSString *)key usingBlock:(void (^)(UIImage *image))block;
     - (void)setImage:(UIImage *)image forKey:(NSString *)key;

     *
     **/
    
    UIImage *aImage = [[UIImage alloc]init];
    [theCache setImage:aImage forKey:@"headerIMG"];
    
 
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
