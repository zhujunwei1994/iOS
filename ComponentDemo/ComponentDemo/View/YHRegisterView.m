//
//  YHRegisterView.m
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/11.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "YHRegisterView.h"
#import <Masonry.h>

#define FONTSIZE 16

@implementation YHRegisterView


-(instancetype)init
{
    self = [super init];
    
    if (self!=nil) {
        
        // 请输入 手机号码/账号
        UITextField *phoneNum = [[UITextField alloc] init];
        phoneNum.placeholder = @"请输入您的手机号码";
        phoneNum.font = [UIFont fontWithName:@"PingFang SC" size: 18];
        [self addSubview:phoneNum];
        _phoneNum = phoneNum;
        phoneNum.keyboardType = UIKeyboardTypeNumberPad;
        [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.equalTo(@33);
            make.top.equalTo(self).with.offset(0);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
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
        
        // 请输入密码
        UITextField *pwd = [[UITextField alloc] init];
//        pwd.backgroundColor = [UIColor redColor];
        pwd.font =   [UIFont fontWithName:@"PingFang SC" size: 16];

        pwd.placeholder = @"请输入您的密码";
        pwd.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:pwd];
        _pwd = pwd;
        [pwd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).with.offset(41);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
        
        // 请输入密码下划线
        UIView *pwdLine = [[UIView alloc] init];
        pwdLine.alpha = 1.0;
        pwdLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:pwdLine];
        _pwdLine = pwdLine;
        [pwdLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.equalTo(@1);
            make.top.equalTo(phoneNum).with.offset(74);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
        
        // 请输入验证码
        UITextField *inputCheckCode = [[UITextField alloc] init];
        inputCheckCode.placeholder = @"请输6位验证码";
        inputCheckCode.font =   [UIFont fontWithName:@"PingFang SC" size: 14];
        inputCheckCode.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:inputCheckCode];
        _inputCheckCode = inputCheckCode;
        [inputCheckCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.equalTo(@33);
            make.top.equalTo(phoneNum).with.offset(83);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
        // 发送注册验证码按钮
        UIButton *sendChenkNum = [UIButton buttonWithType:UIButtonTypeCustom];
        [sendChenkNum setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self addSubview:sendChenkNum];
        _sendChenkNum = sendChenkNum;
        sendChenkNum.titleLabel.font =  [UIFont fontWithName:@"PingFang SC" size: 12];
        sendChenkNum.alpha = 1.0;
        sendChenkNum.layer.backgroundColor = [UIColor orangeColor].CGColor;
        sendChenkNum.layer.cornerRadius = 5;
        [sendChenkNum setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        sendChenkNum.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [sendChenkNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@20);
            make.width.equalTo(@84);
            make.top.equalTo(self).with.offset(89);
            make.right.equalTo(self).with.offset(0);
        }];

//       // 验证码下划
        UIView *sendChenkNumLine = [[UIView alloc] init];
        sendChenkNumLine.alpha = 1.0;
        sendChenkNumLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:sendChenkNumLine];
        _phoneNumLine = sendChenkNumLine;
        [sendChenkNumLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.equalTo(@1);
            make.top.equalTo(phoneNum).with.offset(89+20+12);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(-95);
        }];

//        // 邀请码
        UITextField *inpuInviteCode = [[UITextField alloc] init];
        inpuInviteCode.placeholder = @"请输入邀请码";
        inpuInviteCode.alpha = 1.0;

        inpuInviteCode.layer.cornerRadius = 4;

        [self addSubview:inpuInviteCode];
        _inpuInviteCode = inpuInviteCode;
        [inpuInviteCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@33);
            make.centerX.equalTo(self);
            make.top.equalTo(self).with.offset(89+20+12+8);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];
        
        // 请输入邀请码下划线
        UIView *inpuInviteCodeLine = [[UIView alloc] init];
        inpuInviteCodeLine.alpha = 1.0;
        inpuInviteCodeLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:inpuInviteCodeLine];
        _inpuInviteCodeLine = inpuInviteCodeLine;
        [inpuInviteCodeLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.height.equalTo(@1);
            make.top.equalTo(phoneNum).with.offset(89+20+12+8+33+8);
            make.left.equalTo(self).with.offset(0);
            make.right.equalTo(self).with.offset(0);
        }];

        // 注册
        UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        registerBtn.alpha = 1.0;
        [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        registerBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 24];
        [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        registerBtn.backgroundColor = [UIColor orangeColor];
        [self addSubview:registerBtn];
        _registerBtn = registerBtn;

        [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@36);
//            make.width.equalTo(@48);
            make.top.equalTo(self).with.offset(89+20+12+8+33+8+24);
            make.left.equalTo(pwdLine).with.offset(0);
            make.right.equalTo(pwdLine).with.offset(0);
        }];

        //  同意点就送用户协议
        UIView *agreementView = [[UIView alloc] init];
//        agreementView.backgroundColor = [UIColor redColor];
        [self addSubview:agreementView];
        int agreementBtnMarignBottom = [UIScreen mainScreen].bounds.size.height*0.03;
        [agreementView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@22);
            make.right.equalTo(self).with.offset(0);
            make.left.equalTo(self).with.offset(0);
            make.bottom.equalTo(self).with.offset(-agreementBtnMarignBottom);
        }];
        
        //  同意点就送用户协议 同意按钮
        UIButton *agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        agreementBtn.alpha = 1.0;
        UIImage *tongguo = [[UIImage imageNamed:@"tongguo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [agreementBtn setImage:tongguo forState:UIControlStateNormal];
        [agreementView addSubview:agreementBtn];
        _agreementBtn = agreementBtn;
        [agreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@16);
            make.width.equalTo(@16);
            make.top.equalTo(agreementView).with.offset(3);
            make.left.equalTo(agreementView).with.offset(5);
            make.bottom.equalTo(agreementView).with.offset(-3);
        }];
        
        // 同意协议描述
        UILabel *agreementText = [[UILabel alloc] init];
        agreementText.numberOfLines = 0;
        [agreementView addSubview:agreementText];
        
        agreementText.font = [UIFont fontWithName:@"PingFang SC" size: 16];
        agreementText.text = @"注册表示同意点就送的《用户协议》";
        agreementText.alpha = 1.0;
        agreementText.textColor = [UIColor lightGrayColor];
        
        [agreementText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@22);
//            make.width.equalTo(@16);
            make.top.equalTo(agreementView).with.offset(4);
            make.right.equalTo(agreementView).with.offset(3);
            make.bottom.equalTo(agreementView).with.offset(-4);
            make.left.equalTo(agreementView).with.offset(27);
        }];
  
        
        
    }
    
    return self;
}
void sayHell(){
    printf("jjjj");
}

@end
