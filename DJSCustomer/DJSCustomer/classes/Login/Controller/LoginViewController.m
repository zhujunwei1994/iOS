//
//  LoginViewController.m
//  DJSCustomer
//
//  Created by 夷海科技 on 2019/9/16.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "LoginViewController.h"

#import "HomePageViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)loginBtnAction:(id)sender {
    
    
    NSLog(@"我是登陆按钮");
    HomePageViewController *homeVc = [[HomePageViewController alloc] init];
    
//    [self.navigationController pushViewController:homeVc animated:true];
    [self presentViewController:homeVc animated:true completion:^{
        
    }];
}


@end
