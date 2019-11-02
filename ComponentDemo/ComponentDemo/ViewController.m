//
//  ViewController.m
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/10.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

#import "LoginView.h"

#import <Masonry.h>

#import "YHRegisterVC.h"


#import "YHForgetPwdVC.h"

#define APPKEY @"wx5c0c95d168165c6d"


@interface ViewController ()
@property (nonatomic,assign) NSInteger loginType;

// 手机号码登录时图
@property (nonatomic,weak) LoginView *loginView;


// 快速登录按钮
@property (nonatomic,weak) UIButton *fastLoginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    self.view.backgroundColor = [UIColor whiteColor];
//
//    int c = sum(3, 2);
//    NSLog(@"c = %d",c);
//
//
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
//
//    lable.textAlignment = NSTextAlignmentCenter;
//
//    lable.center = self.view.center;
//
//
//    lable.text = [NSString stringWithFormat:@"c = %d",c];
//    lable.font = [UIFont systemFontOfSize:24];
//    lable.textColor = [UIColor blackColor];
//
//    [self.view addSubview:lable];
    
    


    //0. 设置导航来
    [self setNav];
    _loginType = LOGINTYPE_ACCOUNT_PWD;

    //1. 手机号码登录封装
    [self initLoginView];

    //2.账号密码登录

    //3. 微信登录
    [self weixinLogin];
    
}

int sum(int a,int b){
    return a+b;
}

-(void)weixinLogin{
    
}

-(void)setNav{
    
    // 左边关闭按钮
    UIImage *guanBiImage = [UIImage imageNamed:@"guanbi"];
    UIBarButtonItem *guanbi = [[UIBarButtonItem alloc] initWithImage:[guanBiImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(guanBiEvent)];
    self.navigationItem.leftBarButtonItem =guanbi;
    
    
    // 右边手机号快捷登录
    UIButton *fastLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fastLoginBtn setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
    fastLoginBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
    [fastLoginBtn setTitleColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0] forState:UIControlStateNormal];
    fastLoginBtn.contentMode = UIViewContentModeCenter;
   
    [fastLoginBtn addTarget:self action:@selector(phoneNumberFastLogin) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *phNumFastLogin = [[UIBarButtonItem alloc] initWithCustomView:fastLoginBtn];
    self.navigationItem.rightBarButtonItem = phNumFastLogin;
    [fastLoginBtn sizeToFit];
    _fastLoginBtn = fastLoginBtn;
    
}

/**
    关闭点击事件
 */
-(void)guanBiEvent{
    NSLog(@"%s",__func__);
    
    int screenWidth =[UIScreen mainScreen].bounds.size.width;
    
    int screenHeight =[UIScreen mainScreen].bounds.size.height;
    
    NSLog(@"screenWidth = %d    , screenHeight = %d ",screenWidth,screenHeight);
}

/**
    手机号码快捷登录
 */
-(void)phoneNumberFastLogin
{
//    NSLog(@"%s",__func__);
    if (self.loginType == LOGINTYPE_PHONENUM) {
        self.loginType = LOGINTYPE_ACCOUNT_PWD;

        [_fastLoginBtn setTitle:@"手机号快捷登" forState:UIControlStateNormal];
        [_loginView setLoginType:LOGINTYPE_ACCOUNT_PWD];

    }else if (self.loginType == LOGINTYPE_ACCOUNT_PWD) {
        self.loginType = LOGINTYPE_PHONENUM;

        [_fastLoginBtn setTitle:@"账号密码登录" forState:UIControlStateNormal];
          [_loginView setLoginType:LOGINTYPE_PHONENUM];

    }
    


}


-(void)initLoginView{
    LoginView *loginView= [[LoginView alloc] initWithLoginType:LOGINTYPE_PHONENUM];
    
    [self.view addSubview:loginView];
    _loginView = loginView;
    int screenWith  = [UIScreen mainScreen].bounds.size.width;
    int screenHeight  = [UIScreen mainScreen].bounds.size.height;
    int top = screenHeight *0.2564;
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(top);
        make.left.equalTo(self.view).with.offset(38);
        make.right.equalTo(self.view).with.offset(-38);
        make.bottom.equalTo(self.view).with.offset(-1*screenWith*0.06);
    }];
    
   
    [loginView.fastRegisterBtn  addTarget:self action:@selector(fastRegisterEvent) forControlEvents:UIControlEventTouchUpInside];
    
    
    [loginView.forgetPwd addTarget:self action:@selector(forgetPwdEvent) forControlEvents:UIControlEventTouchUpInside];

//    self.loginView.fastRegisterBlock(self.navigationController);

    
    
}

/**
 快速注册
 */
-(void)fastRegisterEvent
{
    NSLog(@"---%s",__func__);
    
    YHRegisterVC *rvc = [[YHRegisterVC alloc] init];
    
    [self.navigationController pushViewController:rvc animated:YES];
    
}



/**
    忘记密码
 */
-(void)forgetPwdEvent
{
    YHForgetPwdVC *forgetPwdVC = [[YHForgetPwdVC alloc] init];
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
}


@end
