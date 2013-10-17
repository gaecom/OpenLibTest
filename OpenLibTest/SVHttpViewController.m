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
    
    
    
    UIButton *postRequest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    postRequest.frame = CGRectMake(150, 10, 130, 35);
    [postRequest setTitle:@"postRequest" forState:UIControlStateNormal];
    [postRequest addTarget:self action:@selector(postRequestTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:postRequest];
    
    UIButton *postBees = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    postBees.frame = CGRectMake(10, 55, 130, 35);
    [postBees setTitle:@"postBees" forState:UIControlStateNormal];
    [postBees addTarget:self action:@selector(postBeesTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:postBees];
    
    
}


- (void)postBeesTaped
{
    //公司服务器测试用例
    NSString *aURL = @"http://192.168.1.111:3000/bees";
    UIImage *headImage = [UIImage imageNamed:@"googleLL.png"];
    NSData *imageData = UIImagePNGRepresentation(headImage);
    NSMutableDictionary *aDic = [NSMutableDictionary dictionary];
    [aDic setObject:@"image2" forKey:@"name"];
    [aDic setObject:@"cc" forKey:@"gender"];
    [aDic setObject:@"412723198001038699" forKey:@"sn"];
    [aDic setObject:@"13938026688" forKey:@"phone"];
    [aDic setObject:@"email@4s44.com" forKey:@"email"];
    [aDic setObject:@"kk123" forKey:@"password"];
    [aDic setObject:imageData forKey:@"avatar"];
    
    
    
    [SVHTTPRequest POST:aURL parameters:aDic completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSLog(@"line:(%d) class %s",__LINE__,__func__);
        NSLog(@"line(%d): %@,%@,%@",__LINE__,response,urlResponse,error);
        NSString *astr = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
        NSLog(@"line(%d): %@",__LINE__,astr);
        NSLog(@"line(%d): %@ ",__LINE__,[NSString stringWithFormat:@"%d",[urlResponse statusCode]]);
        NSLog(@"line(%d): %@",__LINE__,[urlResponse allHeaderFields]);
        
    }];
}




- (void)postRequestTaped
{
    NSString *aURL = @"http://192.168.1.136:8080/dishesorder/dishes/addsaleorder";
    NSDictionary *aDic = [NSDictionary dictionary];
    [SVHTTPRequest POST:aURL parameters:aDic completion:^(id response, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSLog(@"line(%d): %@",__LINE__,response);
    }];
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
