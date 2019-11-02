//
//  ViewController.m
//  WeixinLogin
//
//  Created by 夷海科技 on 2019/9/29.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

//#import  <>
//#import "YJ"


#import "YJKJViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 微信登录
    [self initWeixinLogin];
    
    [YJKJViewController sayHello];
}


-(void)initWeixinLogin{
    UIButton *weixinLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [weixinLogin setTitle:@"微信登录" forState:UIControlStateNormal];
    weixinLogin.frame = CGRectMake(0, 0, 100, 100);
    
//    weixinLogin.backgroundColor  = [UIColor lightGrayColor];
    
    [weixinLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    weixinLogin.center = self.view.center;
    [weixinLogin addTarget:self action:@selector(weixinLoginEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weixinLogin];
}
-(void)weixinLoginEvent{
    NSLog(@"微信登录");
}


@end
