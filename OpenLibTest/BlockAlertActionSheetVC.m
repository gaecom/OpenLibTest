//
//  BlockAlertActionSheetVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-10.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "BlockAlertActionSheetVC.h"

#import "BlockAlertView.h"
#import "BlockActionSheet.h"
#import "BlockTextPromptAlertView.h"
#import "BlockTableAlertView.h"

@interface BlockAlertActionSheetVC ()

@end

@implementation BlockAlertActionSheetVC

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
    
    UIButton *blockAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    blockAlert.frame = CGRectMake(10, 10, 130, 35);
    [blockAlert setTitle:@"blockAlert" forState:UIControlStateNormal];
    [blockAlert addTarget:self action:@selector(blockAlertTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockAlert];
    
    UIButton *blockAlert2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    blockAlert2.frame = CGRectMake(160, 10, 130, 35);
    [blockAlert2 setTitle:@"blockAlert2" forState:UIControlStateNormal];
    [blockAlert2 addTarget:self action:@selector(blockAlert2Taped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockAlert2];
    
    UIButton *blockActionSheet = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    blockActionSheet.frame = CGRectMake(10, 60, 130, 35);
    [blockActionSheet setTitle:@"blockSheet" forState:UIControlStateNormal];
    [blockActionSheet addTarget:self action:@selector(blockActionSheetTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockActionSheet];
    
    UIButton *blockTextP = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    blockTextP.frame = CGRectMake(10, 115, 130, 35);
    [blockTextP setTitle:@"blockTextField" forState:UIControlStateNormal];
    [blockTextP addTarget:self action:@selector(blockTextPTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockTextP];
    
    UIButton *blockTableV = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    blockTableV.frame = CGRectMake(10, 160, 130, 35);
    [blockTableV setTitle:@"blockTableV" forState:UIControlStateNormal];
    [blockTableV addTarget:self action:@selector(blockTableVTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockTableV];
    
}

#pragma mark ------------  tableView  --------------------------

- (void)blockTableVTaped
{
   //BlockTableAlertView *tableView = [BlockTableAlertView tableAlertWithTitle:@"你好" message:@"您好中国啊"];
    
}


#pragma mark ------------  还输入框的  --------------------------



- (void)blockTextPTaped
{
    BlockTextPromptAlertView *blockText = [BlockTextPromptAlertView promptWithTitle:@"titil" message:@"message" defaultText:@"defaults"];
    
//    blockText = [BlockTextPromptAlertView promptWithTitle:@"title" message:@"message" defaultText:@"default" block:^BOOL(BlockTextPromptAlertView *bbb) {
//        return NULL;
//    }];
    
    
    
    [blockText show];
}


#pragma mark ------------  block Action Sheet --------------------------


- (void)blockActionSheetTaped
{
    BlockActionSheet *sheet = [BlockActionSheet sheetWithTitle:@"blockSheet"];
    [sheet addButtonWithTitle:@"btn1" block:^{
        NSLog(@"btn 1");
    }];
    
    [sheet addButtonWithTitle:@"btn2" block:^{
        NSLog(@"btn 2");
    }];
    
    [sheet setCancelButtonWithTitle:@"取消" block:^{
        NSLog(@"取消");
    }];
    
    [sheet setDestructiveButtonWithTitle:@"Destruct" block:^{
        NSLog(@"Destruct");
    }];
    
    [sheet addButtonWithTitle:@"btn 3" atIndex:3 block:^{
        NSLog(@"3333");
    }];
    
    NSLog(@"%@",sheet.view.subviews);
    
    [sheet showInView:self.view];
}


#pragma mark ------------  block alertView  --------------------------

- (void)blockAlert2Taped
{
    //[BlockAlertView showInfoAlertWithTitle:@"show info" message:@"您好中国！"];
    [BlockAlertView showErrorAlert:[NSError errorWithDomain:@"Error domain" code:1 userInfo:[NSDictionary dictionaryWithObject:@"object" forKey:@"key"]]];
}

- (void)blockAlertTaped
{
        
    BlockAlertView *blockAlert = [BlockAlertView alertWithTitle:@"类方法测试" message:@"你好中国。。。"];
    //blockAlert.vignetteBackground = YES;
    
    [blockAlert setDestructiveButtonWithTitle:@"destru" block:^{
        NSLog(@"destruct ");
    }];
    
    [blockAlert setCancelButtonWithTitle:@"cancel" block:^{
        NSLog(@"cancel");
    }];
    
    [blockAlert addButtonWithTitle:@"add btn" block:^{
        NSLog(@"add btn");
    }];
    
    [blockAlert addButtonWithTitle:@"add btn image" imageIdentifier:@"green" block:^{
        NSLog(@"imageBtn");
    }];
    
    //设置message的fram
    //[blockAlert addComponents:CGRectMake(100, 100, 100, 100)];
    //blockAlert.backgroundImage = [UIImage imageNamed:@"alertBack.png"];

    //NSLog(@"%@",blockAlert.view.subviews);
    
    [blockAlert show];
    
    blockAlert  =nil;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChage:) name:UITextFieldTextDidChangeNotification object:nil];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
