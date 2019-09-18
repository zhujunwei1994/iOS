//
//  ViewController.m
//  DJSCustomer
//
//  Created by 夷海科技 on 2019/9/16.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(37,273,301,36);
    view.alpha = 1.0;
    view.backgroundColor = [UIColor colorWithRed:255/255.0 green:153/255.0 blue:0/255.0 alpha:1.0];
    view.layer.cornerRadius = 4;
    [self.view addSubview:view];
    
    
//    [self initView];
}



-(void)initView
{
    

    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    UIImage *image = [UIImage imageNamed:@"02"];

//    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];


    [imageView setImage:image];


    [self.view addSubview:imageView];

}


@end
