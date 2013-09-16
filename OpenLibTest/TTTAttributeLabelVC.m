//
//  TTTAttributeLabelVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-10.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "TTTAttributeLabelVC.h"
#import "TTTAttributedLabel.h"


@interface TTTAttributeLabelVC ()

@end

@implementation TTTAttributeLabelVC

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
    
    TTTAttributedLabel *label1 = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
    label1.text = @"你好中国";
    label1.frame = CGRectMake(10, 10, 100, 30);
    NSRange range = {0,[label1.text length]};
    
    //label1 addLinkToURL:[NSURL URLWithString:@"www.baidu.com"] withRange:range];
    [label1 addLinkToPhoneNumber:@"10086" withRange:range];
    
    
    [self.view addSubview:label1];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
