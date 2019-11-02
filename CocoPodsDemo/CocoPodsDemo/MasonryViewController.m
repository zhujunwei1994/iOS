
/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  MasonryViewController.m
 * @ProjectName(工程名):   CocoPodsDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/8.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import "MasonryViewController.h"
//#import <Masonry.h>
#import <Masonry.h>

@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    self.view.backgroundColor  = [UIColor whiteColor];

//    [self initMasonry];
    
    
    [self initPageCount];

}
-(void)initPageCount{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    pageControl.numberOfPages = 10;
    
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    
//    [self.view addSubview:pageControl];
}



-(void)initMasonry{
    UIView *masonryView = [[UIView alloc] init];
    
    masonryView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:masonryView];
    
    [masonryView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.center.equalTo(self.view);
        //        make.top.equalTo(self.view).with.offset(50);
        //        make.left.equalTo(self.view).with.offset(50);
        //        make.bottom.equalTo(self.view).with.offset(-300);
        //        make.right.equalTo(self.view).with.offset(-50);
        //
//
//        make.center.equalTo(self.view);
//        make.top.equalTo(self.view).with.offset(70);
//        make.left.equalTo(self.view).with.offset(30);
//        make.bottom.equalTo(self.view).with.offset(-30);
//        make.right.equalTo(self.view).with.offset(-30);
        
        //  <#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(80, 60, 80, 50));
    }];
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
