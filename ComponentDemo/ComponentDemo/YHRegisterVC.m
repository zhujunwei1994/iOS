//
//  YHRegisterVC.m
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/11.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "YHRegisterVC.h"
#import "LoginView.h"
#import "YHRegisterView.h"

#import <Masonry.h>


@implementation YHRegisterVC


- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 1.0 初始化
    
    [self initUserRegisterView];
}


-(void)initUserRegisterView{
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
    
    

    
    
    
}

@end
