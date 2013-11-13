//
//  REMenuVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-11-13.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "REMenuVC.h"
#import "REMenu.h"

@interface REMenuVC ()

@end

@implementation REMenuVC

{
    REMenu *menu;
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
    
    //create Menu;
    
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"Home"
                                                    subtitle:@"Return to Home Screen"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                      }];
    
    REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"Explore"
                                                       subtitle:@"Explore 47 additional options"
                                                          image:[UIImage imageNamed:@"Icon_Explore"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                         }];
    
    REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"Activity"
                                                        subtitle:@"Perform 3 additional activities"
                                                           image:[UIImage imageNamed:@"Icon_Activity"]
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              NSLog(@"Item: %@", item);
                                                          }];
    
    REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"Profile"
                                                          image:[UIImage imageNamed:@"Icon_Profile"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                         }];
    
    menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem]];

    
    //Show
    /**
     - (id)initWithItems:(NSArray *)items;
     - (void)showFromRect:(CGRect)rect inView:(UIView *)view;
     - (void)showInView:(UIView *)view;
     - (void)showFromNavigationController:(UINavigationController *)navigationController;
     - (void)setNeedsLayout;
     - (void)closeWithCompletion:(void (^)(void))completion;
     - (void)close;
    */
    
    UIButton *showMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showMenu.frame = CGRectMake(10, 10, 130, 35);
    [showMenu setTitle:@"showMenu" forState:UIControlStateNormal];
    [showMenu addTarget:self action:@selector(showMenuTaped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showMenu];
    
}

- (void)showMenuTaped
{
    [menu showFromNavigationController:self.navigationController];
}

/**
    //其他可配置的属性
@property (assign, readwrite, nonatomic) CGFloat cornerRadius;
@property (strong, readwrite, nonatomic) UIColor *shadowColor;
@property (assign, readwrite, nonatomic) CGSize shadowOffset;
@property (assign, readwrite, nonatomic) CGFloat shadowOpacity;
@property (assign, readwrite, nonatomic) CGFloat shadowRadius;
@property (assign, readwrite, nonatomic) CGFloat itemHeight;
@property (strong, readwrite, nonatomic) UIColor *backgroundColor;
@property (strong, readwrite, nonatomic) UIColor *separatorColor;
@property (assign, readwrite, nonatomic) CGFloat separatorHeight;
@property (strong, readwrite, nonatomic) UIFont *font;
@property (strong, readwrite, nonatomic) UIColor *textColor;
@property (strong, readwrite, nonatomic) UIColor *textShadowColor;
@property (assign, readwrite, nonatomic) CGSize imageOffset;
@property (assign, readwrite, nonatomic) CGSize textOffset;
@property (assign, readwrite, nonatomic) CGSize textShadowOffset;
@property (strong, readwrite, nonatomic) UIColor *highlightedBackgroundColor;
@property (strong, readwrite, nonatomic) UIColor *highlightedSeparatorColor;
@property (strong, readwrite, nonatomic) UIColor *highlightedTextColor;
@property (strong, readwrite, nonatomic) UIColor *highlightedTextShadowColor;
@property (assign, readwrite, nonatomic) CGSize highlightedTextShadowOffset;
@property (assign, readwrite, nonatomic) CGFloat borderWidth;
@property (strong, readwrite, nonatomic) UIColor *borderColor;
@property (assign, readwrite, nonatomic) NSTextAlignment textAlignment;
@property (strong, readwrite, nonatomic) UIFont *subtitleFont;
@property (strong, readwrite, nonatomic) UIColor *subtitleTextColor;
@property (strong, readwrite, nonatomic) UIColor *subtitleTextShadowColor;
@property (assign, readwrite, nonatomic) CGSize subtitleTextOffset;
@property (assign, readwrite, nonatomic) CGSize subtitleTextShadowOffset;
@property (strong, readwrite, nonatomic) UIColor *subtitleHighlightedTextColor;
@property (strong, readwrite, nonatomic) UIColor *subtitleHighlightedTextShadowColor;
@property (assign, readwrite, nonatomic) CGSize subtitleHighlightedTextShadowOffset;
@property (assign, readwrite, nonatomic) NSTextAlignment subtitleTextAlignment;
@property (assign, readwrite, nonatomic) NSTimeInterval animationDuration;
@property (assign, readwrite, nonatomic) NSTimeInterval bounceAnimationDuration;
@property (assign, readwrite, nonatomic) REMenuImageAlignment imageAlignment;
@property (assign, readwrite, nonatomic) BOOL appearsBehindNavigationBar;
@property (assign, readwrite, nonatomic) BOOL bounce;
@property (assign, readwrite, nonatomic) BOOL liveBlur; // Available only in iOS 7
@property (strong, readwrite, nonatomic) UIColor *liveBlurTintColor; // Available only in iOS 7
@property (assign, readwrite, nonatomic) REMenuLiveBackgroundStyle liveBlurBackgroundStyle; // Available only in iOS 7
@property (copy, readwrite, nonatomic) void (^badgeLabelConfigurationBlock)(UILabel *badgeLabel, REMenuItem *item);

*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
