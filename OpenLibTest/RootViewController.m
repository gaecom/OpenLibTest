//
//  RootViewController.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-7.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworkVC.h"
#import "BlockAlertActionSheetVC.h"
#import "TTTAttributeLabelVC.h"
#import "SVHttpViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    NSMutableArray *listArray;
    NSMutableArray *classArray;
}
- (void)dealloc
{
    [listArray release];
    [classArray release];
    classArray = nil;
    listArray = nil;
    
    [super dealloc];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    style = UITableViewStyleGrouped;
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Open Libary Test";
    self.clearsSelectionOnViewWillAppear = NO;
    listArray = [[NSMutableArray alloc]initWithCapacity:10];
    classArray = [[NSMutableArray alloc]initWithCapacity:10];
    
    //list items
    [listArray addObject:@"SVWebViewController"];
    [listArray addObject:@"SVHTTPRequest"];
    [listArray addObject:@"TTTAttributeLabel"];
    [listArray addObject:@"BlockAlertActionSheet"];
    [listArray addObject:@"AFNetworking"];

    
    //class items
    [classArray addObject:@"SVWebViewVC"];
    [classArray addObject:@"SVHttpViewController"];
    [classArray addObject:@"TTTAttributeLabelVC"];
    [classArray addObject:@"BlockAlertActionSheetVC"];
    [classArray addObject:@"AFNetworkVC"];
    
   
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [listArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textAlignment =  NSTextAlignmentCenter;
    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self pushController:indexPath];
    
}


- (void)pushController:(NSIndexPath *)indexP
{
    UIViewController *theVC = [[NSClassFromString([classArray objectAtIndex:indexP.row]) alloc]init];
    theVC.title = [listArray objectAtIndex:indexP.row];
    [self.navigationController pushViewController:theVC animated:YES];
    [theVC release];
}

-(Class)classFromArray:(NSIndexPath *)indexPath
{
    return NSClassFromString([classArray objectAtIndex:indexPath.row]);
}


@end