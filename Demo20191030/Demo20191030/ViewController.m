//
//  ViewController.m
//  Demo20191030
//
//  Created by 夷海科技 on 2019/10/30.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.view.backgroundColor  =[UIColor whiteColor];
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.bounces = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = NO;
        scrollView.delegate = self;
        [self.view addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

@end
