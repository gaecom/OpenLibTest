//
//  EGOPullToRefreshVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-18.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "EGOPullToRefreshVC.h"

@interface EGOPullToRefreshVC ()

@end

@implementation EGOPullToRefreshVC

{
    NSMutableArray *dataArray;
    EGORefreshTableHeaderView *headView;
    BOOL isLoading;
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
    for (int i = 0; i < 7; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    isLoading = NO;
    
//    EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
//    view.delegate = self;
//    [self.tableView addSubview:view];
//    _refreshHeaderView = view;
//    [view release];
    
    headView = [[EGORefreshTableHeaderView alloc]initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
    headView.delegate = self;
    [self.tableView addSubview:headView];
    
    
    [headView refreshLastUpdatedDate];
    /**
     *  中文本地化处理，修改 EGORefreshTableHeaderView.m
     *
     *
     */
    
}

/**
 *  数据加载
 */
- (void)loadingData
{
    static int i = 0;
    i--;
    [dataArray insertObject:[NSString stringWithFormat:@"%d",i] atIndex:0];
    isLoading = YES;
}

/**
 *  数据加载完成
 */
- (void)loadingFinish
{
    isLoading = NO;
    [headView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    [self.tableView reloadData];
}



#pragma mark EGORefreshTableHeaderDelegate Methods

/**
 *  触发下拉刷新的代理方法
 *
 *  @param view headview
 */

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
    [self loadingData];
	[self performSelector:@selector(loadingFinish) withObject:nil afterDelay:2.0];
	
}

/**
 *  是否加载数据完成
 *
 */
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
	return NO; // should return if data source model is reloading
	
}

/**
 *  返回更新时间
 *
 *
 */
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


#pragma mark UIScrollViewDelegate Methods

/**
 *  Ego pull to refresh 在UISCrollview代理
 *
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[headView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[headView egoRefreshScrollViewDidEndDragging:scrollView];
	
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
