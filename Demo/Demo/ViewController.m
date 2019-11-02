//
//  ViewController.m
//  Demo
//
//  Created by 夷海科技 on 2019/9/19.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    //设置背景不透明
    _searchController.searchBar.translucent=NO;
    _searchController.searchBar.barTintColor=[UIColor brownColor];
    
    //设置searchbar的边框颜色和背景颜色一致
    _searchController.searchBar.layer.borderWidth=1;
    _searchController.searchBar.layer.borderColor=[[UIColor brownColor] CGColor];
    _searchController.searchBar.placeholder=@"搜索联系人";
    //    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;
    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44);
    //    _searchController.searchBar.delegate=self;
    //清空tableview多余的空格线
    
    self.view.autoresizesSubviews = true;
    
    _searchController.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:_searchController.searchBar];
}


@end
