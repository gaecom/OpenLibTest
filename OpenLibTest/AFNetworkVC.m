//
//  AFNetworkVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-7.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "AFNetworkVC.h"
#import "AFNetworking.h"

@interface AFNetworkVC ()

@end

@implementation AFNetworkVC

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
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;

    
    UIButton *httpRequest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    httpRequest.frame = CGRectMake(10, 10, 130, 35);
    [httpRequest setTitle:@"jsonRequest" forState:UIControlStateNormal];
    [httpRequest addTarget:self action:@selector(httpRequestTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:httpRequest];
    
    UIButton *xmlRequest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    xmlRequest.frame = CGRectMake(160, 10, 130, 35);
    [xmlRequest setTitle:@"xmlRequest" forState:UIControlStateNormal];
    [xmlRequest addTarget:self action:@selector(xmlRequestTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:xmlRequest];
    
    UIButton *imageRequest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    imageRequest.frame = CGRectMake(10, 55, 130, 35);
    [imageRequest setTitle:@"imageRequest" forState:UIControlStateNormal];
    [imageRequest addTarget:self action:@selector(imageRequestTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:imageRequest];
    
    //downLoadIMG;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 280, 152)];
    [imageView setImageWithURL:[NSURL URLWithString:@"http://news.baidu.com/z/resource/r/image/2013-09-07/b25fa577c5d1738fe7965c44a2d8c2de.jpg"]];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton *plistRequest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    plistRequest.frame = CGRectMake(160, 55, 130, 35);
    [plistRequest setTitle:@"plistRequest" forState:UIControlStateNormal];
    [plistRequest addTarget:self action:@selector(plistRequestTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plistRequest];
    
    /*
    // AFAppDotNetAPIClient is a subclass of AFHTTPClient, which defines the base URL and default HTTP headers for NSURLRequests it creates
    [[AFAppDotNetAPIClient sharedClient] getPath:@"stream/0/posts/stream/global" parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSLog(@"App.net Global Stream: %@", JSON);
    } failure:nil];
     
     */

}
#pragma mark ------------  plist  --------------------------

- (void)plistRequestTaped
{
    NSString *pilstURL = @"http://www.raywenderlich.com/downloads/weather_sample/weather.php?format=plist";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:pilstURL]];
    AFPropertyListRequestOperation *operation = [AFPropertyListRequestOperation propertyListRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id propertyList) {
        NSLog(@"%@",propertyList);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id propertyList) {
        NSLog(@"%@",error);
    }];
    [operation start];
}


#pragma mark ------------  image  --------------------------

- (void)imageRequestTaped
{
    NSURL *url = [NSURL URLWithString:@"http://news.baidu.com/z/resource/r/image/2013-09-07/b25fa577c5d1738fe7965c44a2d8c2de.jpg"];
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:[NSURLRequest requestWithURL:url] success:^(UIImage *image) {
        NSLog(@"imageSize--> %@",NSStringFromCGSize(image.size));
    }];
    [operation start];
    
                                           
}


#pragma mark ------------  xml  --------------------------

- (void)xmlRequestTaped
{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.groups.browse&api_key=b6300e17ad3c506e706cb0072175d047&cat_id=34427469792%40N01&format=rest"]];
    AFXMLRequestOperation *operation = [AFXMLRequestOperation XMLParserRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSXMLParser *XMLParser) {
        XMLParser.delegate = self;
        [XMLParser parse];

    } failure:nil];
    [operation start];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"%@",parser);
}

#pragma mark ------------  json  --------------------------

- (void)httpRequestTaped
{
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"App.net Global Stream: %@", JSON);
    } failure:nil];
    [operation start];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
