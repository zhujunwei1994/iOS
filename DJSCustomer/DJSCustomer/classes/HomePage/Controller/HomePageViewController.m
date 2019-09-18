//
//  HomePageViewController.m
//  DJSCustomer
//
//  Created by 夷海科技 on 2019/9/17.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "HomePageViewController.h"

@implementation HomePageViewController

- (void)viewDidLoad{

    
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width, self.view.frame.size.height/2)];
    
    
//    self.editButtonItem.image=[UIImage imageNamed:@"weixin"];
    self.title = @"首页";
    
    [lable setText:@"揭竿为旗 搞事点情......."];
    
    [lable setFont:[UIFont systemFontOfSize:25]];
    
    [self.view addSubview:lable];
    
    
}

// z设置左边的导航按钮
-(void)setLeftBarBtn{
    
}

@end
