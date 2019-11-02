//
//  ViewController.m
//  UIButtonDemo
//
//  Created by 夷海科技 on 2019/9/29.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self initBtn];
}


-(void)initBtn{
    UIImage *image = [UIImage imageNamed:@"home_icon_guojiu"];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    CGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)

    btn.frame = CGRectMake(0, 0, 300, 300);
    
    btn.center = self.view.center;
    
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn setTitle:@"你点我啊" forState:UIControlStateNormal];
    [btn setTitle:@"你点我 您做我媳妇" forState:UIControlStateHighlighted];
    
//    [btn setContentMode:UIViewContentModeCenter];
    
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.contentMode = UIViewContentModeCenter;

    
//    UIKIT_STATIC_INLINE UIEdgeInsets UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
    
    int btnImageWidth = btn.imageView.frame.size.width;
    int btnImageH = btn.imageView.frame.size.height;
    int btnImageX = btn.imageView.frame.origin.x;
    int btnImageY = btn.imageView.frame.origin.y;
    
    
    
    int titLableX = btn.titleLabel.frame.origin.x;
    int titLableY = btn.titleLabel.frame.origin.y;
    int titLableW = btn.titleLabel.frame.size.width;
    int titLableH = btn.titleLabel.frame.size.height;
    
    int marign =  (btn.frame.size.width - btnImageWidth)/2;
    int maringV = (btn.frame.size.height - btnImageH - titLableH) /3;
    

    [btn setImageEdgeInsets:UIEdgeInsetsMake(maringV, marign, 2*maringV+titLableH, marign)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(maringV*2+btnImageH, -45 , maringV, 0 )];
    
//    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
//    btn.imageView.frame = CGRectMake(btn.frame.origin.x, btn.frame.origin.y, btn.frame.size.width, btn.frame.size.height/2);
//    btn.titleLabel.frame = CGRectMake(btn.frame.origin.x,  btn.frame.origin.y+btn.frame.size.height/2,btn.frame.size.width , btn.frame.size.height/2);
//
    
//    [btn sizeToFit];
    
//    btn.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:btn];
}


@end
