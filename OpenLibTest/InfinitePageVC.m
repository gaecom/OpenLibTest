//
//  InfinitePageVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-10-23.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "InfinitePageVC.h"
#import "InfinitePagingView.h"

@interface InfinitePageVC ()<InfinitePagingViewDelegate>

@end

@implementation InfinitePageVC

{
    InfinitePagingView *infiPV;
    InfinitePagingView *imageInfi;
    UIPageControl *pageControl;
}
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
    
    //上面View滚动测试
    infiPV = [[InfinitePagingView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    
    infiPV.delegate = self;
    infiPV.scrollDirection = InfinitePagingViewHorizonScrollDirection;
    
    [self.view addSubview:infiPV];
    
    [infiPV addPageView:[self viewWithColor:[UIColor orangeColor]]];
    [infiPV addPageView:[self viewWithColor:[UIColor blueColor]]];
    [infiPV addPageView:[self viewWithColor:[UIColor yellowColor]]];
    [infiPV addPageView:[self viewWithColor:[UIColor greenColor]]];
    
    [NSTimer scheduledTimerWithTimeInterval:3.5f target:self selector:@selector(doScrollInfi) userInfo:nil repeats:YES];
    
    [infiPV release];
    
    
    
    //图片滚动测试；
    
    imageInfi = [[InfinitePagingView alloc] initWithFrame:CGRectMake(50, infiPV.frame.size.height + 6,220,300)];
    imageInfi.delegate = self;
    imageInfi.scrollDirection = InfinitePagingViewHorizonScrollDirection;
    [self.view addSubview:imageInfi];
    
    for (int i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"s%d.png",i+1]];
        UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        imageV.frame = imageInfi.frame;

        [imageInfi addPageView:imageV];
        
        [imageV release];
        
    }
    
    
    
    pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(self.view.center.x,400);
    pageControl.numberOfPages = 4;
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    [self.view addSubview:pageControl];
    
    [NSTimer scheduledTimerWithTimeInterval:3.5f target:self selector:@selector(doScrollImage) userInfo:nil repeats:YES];

    
    
    [imageInfi release];
    
    
}

#pragma mark - InfinitePagingViewDelegate

- (void)doScrollImage
{
    [imageInfi scrollToNextPage];

}

- (void)pagingView:(InfinitePagingView *)pagingView didEndDecelerating:(UIScrollView *)scrollView atPageIndex:(NSInteger)pageIndex
{
    if (pagingView==imageInfi) {
        pageControl.currentPage = pageIndex;
    }
}



- (void)doScrollInfi
{
    [infiPV scrollToNextPage];
    
}

- (UIView *)viewWithColor:(UIColor *)theColor

{
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    aView.backgroundColor = theColor;
    return [aView autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
