//
//  SVHttpViewController.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-12.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "SVHttpViewController.h"
#import "SVHTTPRequest.h"

@interface SVHttpViewController ()

@end

@implementation SVHttpViewController

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
    
    UIButton *getRequest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    getRequest.frame = CGRectMake(10, 10, 130, 35);
    [getRequest setTitle:@"getRequest" forState:UIControlStateNormal];
    [getRequest addTarget:self action:@selector(getRequestTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getRequest];
    
    
}

- (void)getRequestTaped
{
    
     [SVHTTPRequest GET:@"https://api.github.com/repos/samvermette/SVHTTPRequest"
            parameters:nil
            completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
                NSString* text = [NSString stringWithFormat:@"SVHTTPRequest has %@ watchers", [response valueForKey:@"watchers"]];
                NSLog(@"%@",text);
            }];
    
    
    
//    SVHTTPRequest *request = [[SVHTTPRequest alloc] initWithAddress:@"http://github.com/api/v2/json/repos/show/samvermette/SVHTTPRequest"
//                                                             method:SVHTTPRequestMethodGET
//                                                         parameters:nil
//                                                         completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
//                                                             NSLog(@"%@",response);
//                                                         }];
//    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
//    [request start];
    
    
  
    
//    [[SVHTTPClient sharedClient] setBasePath:@"http://api.twitter.com/1/"];
//    [[SVHTTPClient sharedClient] GET:@"users/show.json"
//                          parameters:[NSDictionary dictionaryWithObject:@"samvermette" forKey:@"screen_name"]
//                          completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
//                              NSLog(@"line(%d): %@",__LINE__,response);
//                          }];
    
    
    
    
    
//    [SVHTTPRequest GET:@"http://example.com/db.sqlite.zip"
//            parameters:nil
//            saveToPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"store.zip"]
//              progress:^(float progress) {
//                  //progressLabel.text = [NSString stringWithFormat:@"Downloading (%.0f%%)", progress*100];
//              }
//            completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
//                NSLog(@"line(%d): %@",__LINE__,response);
//            }];
    
    
    
    
//    completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//            // cpu-intensive code
//        });
//    }];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
