//
//  JSMessagesDemoVC.h
//  OpenLibTest
//
//  Created by cocoa on 13-9-17.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "JSMessagesViewController.h"

@interface JSMessagesDemoVC : JSMessagesViewController<JSMessagesViewDataSource,JSMessagesViewDelegate>

@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) NSMutableArray *timestamps;

@end
