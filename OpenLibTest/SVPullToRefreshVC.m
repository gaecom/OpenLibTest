//
//  SVPullToRefreshVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-18.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "SVPullToRefreshVC.h"
#import "SVPullToRefresh.h"

@interface SVPullToRefreshVC ()

@end

@implementation SVPullToRefreshVC

{
    NSMutableArray *dataArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    dataArray = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    /**
     *  在ARC 下需要弱引用设置
     */
    
    //__weak SVPullToRefreshVC *theView = self;
    
    /**
     *  下拉刷新 增加一个；
     */
    [self.tableView addPullToRefreshWithActionHandler:^{
        [self addRows];
    }];
    
    
    /**
     *  拉到最后 加载更多，增加一个；
     */
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [self addMoreRow];
    }];
    
    
    /**
     *  下拉刷新   拉到底加载更多 的配置；
     */
    
    //[self.tableView triggerPullToRefresh];
    //self.tableView.showsPullToRefresh = NO;
    [self.tableView.pullToRefreshView setArrowColor:[UIColor blueColor]];
    [self.tableView.pullToRefreshView setTextColor:[UIColor orangeColor]];
    [self.tableView.pullToRefreshView setTitle:@"下拉即可刷新" forState:SVPullToRefreshStateStopped];
    [self.tableView.pullToRefreshView setTitle:@"刷新中..." forState:SVPullToRefreshStateLoading];
    [self.tableView.pullToRefreshView setTitle:@"松开即可刷新" forState:SVPullToRefreshStateTriggered];
    [self.tableView.pullToRefreshView setTitle:@"刷新完成。。。" forState:SVPullToRefreshStateStopped];
    
    //[self.tableView.pullToRefreshView setSubtitle:@"2013-09-18" forState:SVPullToRefreshStateStopped];

    /**
     *  下面方面已不建议使用
     */

    [self.tableView.pullToRefreshView setTitle:@"下拉即可刷新" forState:SVPullToRefreshStateStopped];
    [self.tableView.pullToRefreshView setLastUpdatedDate:[NSDate date]];
//    NSDateFormatter *dateFormat =[[NSDateFormatter alloc]init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
//    [self.tableView.pullToRefreshView setDateFormatter:dateFormat];

    
    /**
     *  iOS run time 机制
     *
     *  http://cocoaheadsmtl.s3.amazonaws.com/demistifying-runtime.pdf
     */
    
    
    
    
    

}


- (void)addRows
{
    static int i = 0;
    i--;
    [dataArray insertObject:[NSString stringWithFormat:@"%d",i] atIndex:0];
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.tableView.pullToRefreshView stopAnimating];
        [self.tableView reloadData];

    });
    
}

- (void)addMoreRow
{
    static int i = 10;
    [dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    i++;
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.tableView.infiniteScrollingView stopAnimating];
        [self.tableView reloadData];

    });
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
