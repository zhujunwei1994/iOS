//
//  ViewController.m
//  WebviewDemo
//
//  Created by 夷海科技 on 2019/9/27.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,retain) NSMutableArray *data;
//@property (nonatomic,weak)   WKW

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.tableView.scrollEnabled = NO;
    self.tableView.editing =YES;
    
    //  测试 UITableview 分区数据的显示
      [self data];
    
    
}
-(NSMutableArray *)data{
    
    if (!_data) {
        _data = [NSMutableArray array];
        for (int j =0 ; j<10; j++) {
            NSMutableArray *itemData = [NSMutableArray array];

            for (int i = 0; i< 20; i++) {
                [itemData addObject:[NSString stringWithFormat:@"茅台---- %d件",i]];
            }
            [_data addObject:itemData];
        }
    }
    
    return _data;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (nil == _data) {
        return 0;
    }
    return _data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_data) {
        return 0;
    }
    return [_data[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cellid"];
//        cell = [UITableViewCell alloc] initWithStyle: reuseIdentifier:(nullable NSString *)
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CATransform3D  transform;
    transform.m34 = 1.0/-800;
    //定义 Cell的初始化状态
    cell.layer.transform = transform;
    //定义Cell 最终状态 并且提交动画
    [UIView beginAnimations:@"transform" context:NULL];
    [UIView setAnimationDuration:1];
    cell.layer.transform = CATransform3DIdentity;
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    
    [UIView commitAnimations];
    cell.textLabel.text = _data[indexPath.section][indexPath.row];
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}


//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
//
////    headerView.backgroundColor = [UIColor redColor];
//
//    UILabel *headerTitleLable = [[UILabel alloc] initWithFrame:headerView.frame];
//
//    headerTitleLable.text = [NSString stringWithFormat:@"茅台 = %ld区",section];
////    [headerView addSubview:headerTitleLable];
//    return headerView;
//}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    footerView.backgroundColor = [UIColor orangeColor];
    [footerView setHidden:YES];
    
    return footerView;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
//    view.hidden = NO;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"朱哥哥 === %ld",section];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"------------scrollView = %@",scrollView);
}

//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}

@end
