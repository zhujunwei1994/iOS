//
//  YHRegisterView.h
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/11.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHRegisterView : UIView


// 手机号
@property (nonatomic,weak) UITextField *phoneNum;

// 手机号 / 账号 下划线
@property (nonatomic,weak) UIView *phoneNumLine;

// 密码
@property (nonatomic,weak) UITextField *pwd;

//  密码 下划线
@property (nonatomic,weak) UIView *pwdLine;

// 请输入6位数验证码
@property (nonatomic,weak) UITextField *inputCheckCode;

// 发送验证码按钮
@property (nonatomic,weak) UIButton *sendChenkNum;

// 验证码下划线
@property (nonatomic,weak) UIView *sendChenkNumLine;

// 请输入邀请码
@property (nonatomic,weak) UITextField *inpuInviteCode;


// 邀请码下划线
@property (nonatomic,weak) UIView *inpuInviteCodeLine;

// 注册按钮
@property (nonatomic,weak) UIButton *registerBtn;

// 同意点就送用户协议
@property (nonatomic,weak) UIButton *agreementBtn;

@end

NS_ASSUME_NONNULL_END
