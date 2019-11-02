//
//  Demo1TableViewCell.m
//  DemoTableViewCl
//
//  Created by 夷海科技 on 2019/10/24.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "Demo1TableViewCell.h"

@implementation Demo1TableViewCell


+(instancetype)demo:(UITableView *)tableview{
    Demo1TableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[Demo1TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}

@end
