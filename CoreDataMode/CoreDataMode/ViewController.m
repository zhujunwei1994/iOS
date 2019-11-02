//
//  ViewController.m
//  CoreDataMode
//
//  Created by 夷海科技 on 2019/10/30.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

#include "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"date row = %lu",indexPath.row];
    
    return cell;
    
}

@end
