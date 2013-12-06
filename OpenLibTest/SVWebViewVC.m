//
//  SVWebViewVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-12.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "SVWebViewVC.h"
#import "SVWebViewController.h"
#import "SVModalWebViewController.h"

@interface SVWebViewVC ()

@end

@implementation SVWebViewVC

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
    
    UIButton *push = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    push.frame = CGRectMake(10, 10, 130, 35);
    [push setTitle:@"push show" forState:UIControlStateNormal];
    [push addTarget:self action:@selector(pushWebViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
    
    UIButton *present = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    present.frame = CGRectMake(10, 65, 130, 35);
    [present setTitle:@"present show" forState:UIControlStateNormal];
    [present addTarget:self action:@selector(presentWebViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:present];
    
}
/**

 Use the availableActions integer bit mask property to set which actions should be available for display:
 
 enum {
 SVWebViewControllerAvailableActionsNone             = 0,
 SVWebViewControllerAvailableActionsOpenInSafari     = 1 << 0,
 SVWebViewControllerAvailableActionsMailLink         = 1 << 1,
 SVWebViewControllerAvailableActionsCopyLink         = 1 << 2,
 SVWebViewControllerAvailableActionsOpenInChrome     = 1 << 3
 };
 
 Default is 

  SVWebViewControllerAvailableActionsOpenInSafari | SVWebViewControllerAvailableActionsOpenInChrome | SVWebViewControllerAvailableActionsMailLink.
 

 */

- (void)pushWebViewController {
    NSURL *URL = [NSURL URLWithString:@"http://3g.tech.qq.com"];
	SVWebViewController *webViewController = [[SVWebViewController alloc] initWithURL:URL];
	[self.navigationController pushViewController:webViewController animated:YES];
}


- (void)presentWebViewController {
	NSURL *URL = [NSURL URLWithString:@"http://3g.tech.qq.com"];
	SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithURL:URL];
	webViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    webViewController.availableActions = SVWebViewControllerAvailableActionsOpenInSafari|SVWebViewControllerAvailableActionsCopyLink|SVWebViewControllerAvailableActionsMailLink;
	[self presentModalViewController:webViewController animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
