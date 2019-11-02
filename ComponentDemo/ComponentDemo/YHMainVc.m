
/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHMainVc.m
 * @ProjectName(工程名):   ComponentDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/15.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import "YHMainVc.h"

#import <Masonry.h>

@interface YHMainVc ()

@end

@implementation YHMainVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//
    UIView *viewOne = [[UIView alloc] init];
//    UIView *viewOne = [[UIView alloc] initWithFrame:CGRectMake(10, 150, 100, 100)];
    viewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewOne];
    
    
    UIView *viewTwo = [[UIView alloc] init];
    viewTwo.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewTwo];
    

    [viewOne mas_makeConstraints:^(MASConstraintMaker *make) {


//        make.center.equalTo(self.view);
        make.height.equalTo(@(30));
        make.width.equalTo(@(30));
        make.top.equalTo(self.view).with.offset(150); make.left.equalTo(self.view).with.offset(10);
//        make.right.equalTo(self.view).with.offset(-150); make.bottom.equalTo(self.view).with.offset(-10);

    }];
    
    
    [viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {


        make.height.equalTo(@30);
        make.width.equalTo(@37);
        make.top.equalTo(viewTwo).with.offset(300); make.left.equalTo(self.view).with.offset(10);
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
