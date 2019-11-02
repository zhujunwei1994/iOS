//
//  LoginView.h
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/10.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView

-(instancetype)initWithLoginType:(NSInteger) loginType;
-(void)setLoginType:(NSInteger)loginType;

//登录类型
@property (nonatomic,assign) NSInteger loginType;

// 手机号 / 账号
@property (nonatomic,weak) UITextField *phoneNum;

// 手机号 / 账号 下划线
@property (nonatomic,weak) UIView *phoneNumLine;

// 验证码 / 密码
@property (nonatomic,weak) UITextField *pwd;

// 验证码 / 密码 下划线
@property (nonatomic,weak) UIView *pwdLine;

// 发送验证码按钮
@property (nonatomic,weak) UIButton *sendChenkNum;

// 登录按钮
@property (nonatomic,weak) UIButton *loginBtn;

// 忘记密码
@property (nonatomic,weak) UIButton *forgetPwd;

// 快速注册按钮
@property (nonatomic,weak) UIButton *fastRegisterBtn;

@end

NS_ASSUME_NONNULL_END
