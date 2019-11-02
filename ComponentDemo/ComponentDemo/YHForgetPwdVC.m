
/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHForgetPwdVC.m
 * @ProjectName(工程名):   ComponentDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/12.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import "YHForgetPwdVC.h"

#import "YHRegisterView.h"

#import <Masonry.h>

@interface YHForgetPwdVC ()

@end

@implementation YHForgetPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor  = [UIColor whiteColor];
    
    YHRegisterView *loginView= [[YHRegisterView alloc] init];
    
    [self.view addSubview:loginView];
    int screenWith  = [UIScreen mainScreen].bounds.size.width;
    int screenHeight  = [UIScreen mainScreen].bounds.size.height;
    int top = screenHeight *0.2564;
    //    loginView.backgroundColor = [UIColor redColor];
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(top);
        make.left.equalTo(self.view).with.offset(38);
        make.right.equalTo(self.view).with.offset(-38);
        make.bottom.equalTo(self.view).with.offset(-1*screenWith*0.06);
    }];
    
    [loginView.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    
}



@end
