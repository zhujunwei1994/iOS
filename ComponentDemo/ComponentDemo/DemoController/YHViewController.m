
/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHViewController.m
 * @ProjectName(工程名):   ComponentDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/15.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import "YHViewController.h"

@interface YHViewController ()

@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation YHViewController

- (NSMutableArray *)data
{
    if (nil == _data) {
        _data = [NSMutableArray array];
        
        for (int i = 0; i<200; i++) {
            NSString *orderCode = [NSString stringWithFormat:@"订单编号：16514651513513615 = %d",i];
            
            
            [_data addObject:orderCode];
        }
    }
    return _data;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self data];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell123"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell123"];
    }
    cell.textLabel.text = self.data[indexPath.row];

    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 60;
}




@end
