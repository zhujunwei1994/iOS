//
//  LoginView.m
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/10.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "LoginView.h"
//#import ""
#import <Masonry.h>

#import "YHButton.h"

#import "ViewController.h"
#import "YHRegisterVC.h"

@implementation LoginView


/**
  登录
 **/

-(instancetype)initWithLoginType:(NSInteger) loginType
{
    self = [super init];

    
    if (self!=nil) {
       
        // 登录类型 手机号与验证码 或 账号与密码
        self.loginType = loginType;

        // 请输入 手机号码/账号
        UITextField *phoneNum = [[UITextField alloc] init];
        [self addSubview:phoneNum];
        _phoneNum = phoneNum;
        phoneNum.keyboardType = UIKeyboardTypeNumberPad;
        [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.equalTo(@33);

            //            make.height.equalTo(hegint);
            make.top.equalTo(self).with.offset(0);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
            //             make.bottom.equalTo(self).with.offset(21+22);
        }];
        
        // 手机号码下划线
        UIView *phoneNumLine = [[UIView alloc] init];
        phoneNumLine.alpha = 1.0;
        phoneNumLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:phoneNumLine];
        _phoneNumLine = phoneNumLine;
        [phoneNumLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.equalTo(@1);
            make.top.equalTo(phoneNum).with.offset(27);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
        
        // 请输入密码 / 手机号验证码
        UITextField *pwd = [[UITextField alloc] init];
        pwd.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:pwd];
        _pwd = pwd;
       
        // 请输入密码下划线
        UIView *pwdLine = [[UIView alloc] init];
        pwdLine.alpha = 1.0;
        pwdLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:pwdLine];
        _pwdLine = pwdLine;
        
        UIButton *sendChenkNum = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:sendChenkNum];
        _sendChenkNum = sendChenkNum;
        sendChenkNum.titleLabel.font =  [UIFont fontWithName:@"PingFang SC" size: 12];
        sendChenkNum.alpha = 1.0;
        sendChenkNum.layer.backgroundColor = [UIColor orangeColor].CGColor;
        sendChenkNum.layer.cornerRadius = 5;
        
        [sendChenkNum setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        sendChenkNum.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        
        if (loginType == LOGINTYPE_ACCOUNT_PWD) {  // 账号与密码登录
           
            [self loginWithAccountAndPwd];
        }else if(loginType == LOGINTYPE_PHONENUM){  // 手机号码快捷登录
            // 发送验证码
            [self loginWithpHoneNum];
        }
        
        // 登录
        
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        loginBtn.alpha = 1.0;
        loginBtn.backgroundColor = [UIColor orangeColor];
        loginBtn.layer.cornerRadius = 4;
        [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        
        loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //        [loginBtn setFont:[UIFont fontWithName:@"PingFang SC" size: 24]];
        loginBtn.titleLabel.font =[UIFont fontWithName:@"PingFang SC" size: 24];
        //        [loginBtn setTitleColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        loginBtn.titleLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:loginBtn];
        _loginBtn = loginBtn;
        [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@36);
            make.centerX.equalTo(self);
            make.top.equalTo(self).with.offset(102);
            make.left.equalTo(pwdLine).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
        
        
        // 忘记密码
        UIButton *forgetPwd = [UIButton buttonWithType:UIButtonTypeCustom];
        forgetPwd.alpha = 1.0;
        [forgetPwd setTitle:@"忘记密码" forState:UIControlStateNormal];
        forgetPwd.titleLabel.textAlignment = NSTextAlignmentCenter;
        forgetPwd.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        [forgetPwd setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self addSubview:forgetPwd];
        _forgetPwd = forgetPwd;
        
        [forgetPwd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@17);
            make.width.equalTo(@48);
            make.top.equalTo(self).with.offset(120+22);
            make.left.equalTo(pwdLine).with.offset(0);
        }];
        
        // 快速注册
        UIButton *fastRegister = [UIButton buttonWithType:UIButtonTypeCustom];
        fastRegister.alpha = 1.0;
        [fastRegister setTitle:@"快速注册" forState:UIControlStateNormal];
        fastRegister.titleLabel.textAlignment = NSTextAlignmentCenter;
        fastRegister.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        [fastRegister setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//        [fastRegister addTarget:self action:@selector(fastRegisterEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:fastRegister];
        _fastRegisterBtn  = fastRegister;
        
        //        int fastRegisterMarignX = [UIScreen mainScreen].bounds.size.width -
        [fastRegister mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@17);
            make.width.equalTo(@48);
            make.top.equalTo(self).with.offset(120+22);
            make.right.equalTo(self).with.offset(0);
            
        }];
        
        // 微信登录按钮
        YHButton *weixinLogin = [[YHButton alloc] init];
        
        UIImage *weixinImage  = [[UIImage  imageNamed:@"weixin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [weixinLogin setImage:weixinImage forState:UIControlStateNormal];
        [weixinLogin setTitle:@"微信登录" forState:UIControlStateNormal];
        weixinLogin.titleLabel.font = [UIFont fontWithName:@"Microsoft YaHei" size: 16];
        [weixinLogin setTitleColor:[UIColor colorWithRed:121/255.0 green:245/255.0 blue:129/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self addSubview:weixinLogin];
        weixinLogin.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        
        int weixinLoginMarignTop = [UIScreen mainScreen].bounds.size.height*0.5532;
        [weixinLogin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@80);
            make.width.equalTo(@64);
            make.center.equalTo(self);
            make.top.equalTo(self).with.offset(weixinLoginMarignTop);
            make.right.equalTo(self).with.offset(0);
        }];
        
        [weixinLogin setTitleEdgeInsets:UIEdgeInsetsMake(44, 0, 0, 0)];
    
    }
    return self;
}

// 手机号码快捷登录
-(void)loginWithpHoneNum{
    
    [self.sendChenkNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.width.equalTo(@84);
        make.top.equalTo(self).with.offset(50);
        make.right.equalTo(self).with.offset(0);
    }];
    
    [_pwdLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.equalTo(@1);
        
        make.top.equalTo(self.phoneNum).with.offset(22+48);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-95);
    }];
    
    [_pwd mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        //             make.height.equalTo(@22);
        make.top.equalTo(self.phoneNum).with.offset(42);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(-95);
        //            make.bottom.equalTo(self).with.offset(0);
    }];
    _phoneNum.placeholder = @"请输入手机号码";
    _pwd.placeholder = @"请输入验证码";
    [_sendChenkNum setTitle:@"发送验证码" forState:UIControlStateNormal];
    _sendChenkNum.hidden = NO;
}


// 账号和密码登录
-(void)loginWithAccountAndPwd{
    _phoneNum.placeholder = @"请输入账号";
    _pwd.placeholder = @"请输入密码";
    
    
    
    [_pwd mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.phoneNum).with.offset(42);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
    }];
    [_pwdLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.equalTo(@1);
        make.top.equalTo(self.phoneNum).with.offset(22+48);
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
    }];
    _sendChenkNum.hidden = YES;
}



-(void)setLoginType:(NSInteger)loginType
{
    _loginType = loginType;
    if (loginType == LOGINTYPE_ACCOUNT_PWD) {  // 账号与密码登录
        [self loginWithAccountAndPwd];
    }else if(loginType == LOGINTYPE_PHONENUM){  // 手机s号码快捷登录
        [self loginWithpHoneNum];
    }
}






/*************************   登录  *********************************/




@end
