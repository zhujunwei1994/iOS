//
//  ViewController.m
//  DemoNav
//
//  Created by 夷海科技 on 2019/9/17.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    
    [btn setTitle:@"我就是UIButton" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:btn];
    
}
-(void)btnAction{
    
    SecondViewController *svc = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:svc animated:true];
    
    
}


@end
