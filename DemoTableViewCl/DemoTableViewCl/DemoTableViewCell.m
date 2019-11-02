
//
//  DemoTableViewCell.m
//  DemoTableViewCl
//
//  Created by 夷海科技 on 2019/10/24.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "DemoTableViewCell.h"

@implementation DemoTableViewCell

+(instancetype)demoTBVCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"shopCarCell";
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell) {
       cell = [[DemoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // 标题
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 300, 50)];
//    [cell.contentView addSubview:title];
    //    title.numberOfLines = 0;
    title.text = @"53°飞天茅台375ml";
    title.font = [UIFont fontWithName:@"PingFang SC" size: 18];
    title.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    title.alpha = 1.0;
    [title sizeToFit];
    
    [cell.contentView addSubview:title];
    
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width, cell.frame.size.height)];
    
//    textFiled.backgroundColor = [UIColor lightGrayColor];


    UIImage *im = [UIImage imageNamed:@"icon"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:im];
    UIView *lv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];//宽度根据需求进行设置，高度必须大于 textField 的高度
//    lv.backgroundColor = [UIColor blueColor];
    iv.center = lv.center;
    [lv addSubview:iv];
    
    //设置 textField 的左侧视图
    //设置左侧视图的显示模式
    textFiled.leftViewMode = UITextFieldViewModeAlways;
    textFiled.leftView = lv;
    
    
//    [cell.contentView addSubview:textFiled];
    
    
    
    
    return cell;
}

@end
