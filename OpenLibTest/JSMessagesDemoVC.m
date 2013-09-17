//
//  JSMessagesDemoVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-17.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "JSMessagesDemoVC.h"

@interface JSMessagesDemoVC ()

@end

@implementation JSMessagesDemoVC


//此为默认提供的 发送按钮，可以这里自定义
- (UIButton *)sendButton
{
    // Override to use a custom send button
    // The button's frame is set automatically for you
    return [UIButton defaultSendButton];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置代理

    self.delegate = self;
    self.dataSource = self;
    
    self.title = @"消息";
    
    //初始的发送消息
    self.messages = [[NSMutableArray alloc] initWithObjects:
                     @"hi 大家好，我是Steve jobs",
                     @"什么时候发布iPhone 6啊",
                     @"再等个几年吧，下边日子不好过，都不用iphone了！",
                     @"我去，这样啊",
                     @"恩，你也来吧，下来看看，等过完年，我再重新定义一下手机！",
                     nil];
    
    self.timestamps = [[NSMutableArray alloc] initWithObjects:
                       [NSDate distantPast],
                       [NSDate distantPast],
                       [NSDate distantPast],
                       [NSDate date],
                       nil];
    
   
    // gitHUB https://github.com/jessesquires/MessagesTableViewController
    
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

#pragma mark - Messages view delegate
- (void)sendPressed:(UIButton *)sender withText:(NSString *)text
{
    [self.messages addObject:text];
    
    [self.timestamps addObject:[NSDate date]];
    
    if((self.messages.count - 1) % 2)
        //播放声音
        [JSMessageSoundEffect playMessageSentSound];
    else
        [JSMessageSoundEffect playMessageReceivedSound];
    
    [self finishSend];
}

/**
 *  发送信息对象，，，发送者，收信者
 *
 *  @param indexPath 行
 *
 *  @return 类型
 */
- (JSBubbleMessageType)messageTypeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row % 2) ? JSBubbleMessageTypeIncoming : JSBubbleMessageTypeOutgoing;
}

/**
 *  信息样式
 *
 *  @param indexPath 行
 *
 *  @return 样式
 */
- (JSBubbleMessageStyle)messageStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return JSBubbleMessageStyleDefault;
}

/**
 *  发送时间设置
 *
 *  @return 类型
 */
- (JSMessagesViewTimestampPolicy)timestampPolicy
{
    return JSMessagesViewTimestampPolicyEveryThree;
}

/**
 *  是否显示头像
 *
 *  @return 类型
 */
- (JSMessagesViewAvatarPolicy)avatarPolicy
{
    return JSMessagesViewAvatarPolicyBoth;
}

/**
 *  头像类型
 *
 *  @return 类型
 */
- (JSAvatarStyle)avatarStyle
{
    return JSAvatarStyleCircle;
}

//  Optional delegate method
//  Required if using `JSMessagesViewTimestampPolicyCustom`
//
//  - (BOOL)hasTimestampForRowAtIndexPath:(NSIndexPath *)indexPath
//

#pragma mark - Messages view data source
- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.messages objectAtIndex:indexPath.row];
}

- (NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.timestamps objectAtIndex:indexPath.row];
}

//设置头像
- (UIImage *)avatarImageForIncomingMessage
{
    return [UIImage imageNamed:@"demo-avatar-woz"];
}

- (UIImage *)avatarImageForOutgoingMessage
{
    return [UIImage imageNamed:@"demo-avatar-jobs"];
}

@end