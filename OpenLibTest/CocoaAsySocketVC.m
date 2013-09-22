//
//  CocoaAsySocketVC.m
//  OpenLibTest
//
//  Created by cocoa on 13-9-22.
//  Copyright (c) 2013年 cocoajin. All rights reserved.
//

#import "CocoaAsySocketVC.h"
#import "GCDAsyncSocket.h"

@interface CocoaAsySocketVC ()

@end

@implementation CocoaAsySocketVC

{
    GCDAsyncSocket *aGcdAsySocket;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // GCD 版本的
    
    /**
     *  使用引导  
        代理queue必须指定；
        SocketQueue 可以不指定，若指定不能是 concurrent queue.
     
     - (id)init;
     - (id)initWithSocketQueue:(dispatch_queue_t)sq;
     - (id)initWithDelegate:(id)aDelegate delegateQueue:(dispatch_queue_t)dq;
     - (id)initWithDelegate:(id)aDelegate delegateQueue:(dispatch_queue_t)dq socketQueue:(dispatch_queue_t)sq;
     */
    
    aGcdAsySocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    
    
    /**
     *  ip协议，默认4 6都可用；
     */
    [aGcdAsySocket setIPv4Enabled:YES];
    [aGcdAsySocket setIPv6Enabled:YES];
    
    
    /**
     *  设置用户数据，用户数据可以任意类型 
     *   - (void)setUserData:(id)arbitraryUserData;
     */
    NSData *userData = [[NSData alloc]init];
    //NSString *data = @"hello";
    [aGcdAsySocket setUserData:userData];
    
    
    /**
     *  GCD会尝试所有的网络去监听指定的端口,也可配置interface
     *  socket:didAcceptNewSocket  执行代理
     */
    uint16_t port = 80;
    [aGcdAsySocket acceptOnPort:port error:nil];
    
    
    
    /**
     *  建立socket连接； 给定网址，和端口；可配置 interface,timeout 
     *  执行代理 connectToHost:onPort:viaInterface:withTimeout:error
     */

    [aGcdAsySocket connectToHost:@"wwww.baidu.com" onPort:port error:nil];
    
    
    /**
     *  取消socket连接，并释放socket   
     *      [asyncSocket setDelegate:nil];
     *      [asyncSocket disconnect];
     *      [asyncSocket release];

     */
    //[aGcdAsySocket disconnect];
    
    
    
    
    /**
     *  一个socket连接，可以通过 连接，取消，等操作，循环利用连接；
     - (NSString *)connectedHost;
     - (uint16_t)connectedPort;
     
     - (NSString *)localHost;
     - (uint16_t)localPort;
     */
    BOOL isConnect = [aGcdAsySocket isConnected];
    NSLog(@"line(%d): %d",__LINE__,isConnect);
    
    
    
    
    
    
    /**
     *  可以使用 SSL建立 安全的socket连接；
     */
    [aGcdAsySocket isSecure];
    
    
    
    
    
    /**
     *  读写数据； 并执行相应的代理方法；
     */
    //[aGcdAsySocket readDataWithTimeout:1.0 tag:1000];
    //[aGcdAsySocket writeData:[[NSData alloc]init] withTimeout:2.0 tag:10002];
    
    
    
    
    
    /**
     *  一些 security设置 和 一些高级配置；详见 api
     */
    [aGcdAsySocket autoDisconnectOnClosedReadStream];
    
    
    
    
    
    
    /**
     *  一些代理方法 全部可选
     
     //指定new quene建立连接
     - (dispatch_queue_t)newSocketQueueForConnectionFromAddress:(NSData *)address onSocket:(GCDAsyncSocket *)sock;
     
     * For example, your implementation might look something like this:
     * dispatch_retain(myExistingQueue);
     * return myExistingQueue;
     
     
     */
    
    
    
    
}

#pragma mark ------------  代理方法  --------------------------

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
    NSLog(@"line(%d): %@",__LINE__,host);
    NSLog(@"line(%d): %@",__LINE__,[NSString stringWithFormat:@"%d",port]);
}
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}
- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}
- (void)socket:(GCDAsyncSocket *)sock didWritePartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}
- (void)socketDidCloseReadStream:(GCDAsyncSocket *)sock
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}
- (void)socketDidSecure:(GCDAsyncSocket *)sock
{
    NSLog(@"line:(%d) class %s",__LINE__,__func__);
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
