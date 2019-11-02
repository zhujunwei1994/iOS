/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  LoginViewController.m
 * @ProjectName(工程名):   CocoPodsDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/9/25.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import "LoginViewController.h"

@interface LoginViewController () <UITableViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view regis
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lable= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    
    [lable setText:@"欢迎使用夷海科技·点就送外卖客户端"];
    
    lable.textAlignment = NSTextAlignmentCenter;
    
    [lable setFont:[UIFont systemFontOfSize:24]];
    
    
    [self.view addSubview:lable];
    
    lable.center = CGPointMake(self.view.center.x, self.view.center.y);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
