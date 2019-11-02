//
//  HomePageViewController.m
//  DJSCustomer
//
//  Created by 夷海科技 on 2019/9/17.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "HomePageViewController.h"
#import "UIImage+ZCImage.h"

#import "HomeHeaderView.h"
#import "HomeMiddleView.h"
#import "HomeBottomView.h"

#import "HomeCellMode.h"
#import "HomeTableViewCell.h"

@interface HomePageViewController ()

@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,assign) NSInteger numTickets;

@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewDidLoad{

    [self createData];
    
    [super viewDidLoad];
    
    
//    self.view.autoresizingMask= UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
 
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    navigationBarFrame.size.height = 36;
    self.navigationController.navigationBar.frame = navigationBarFrame;
    
    
    NSLog(@"width = %f    height = %f",self.navigationController.navigationBar.frame.size.width,self.navigationController.navigationBar.frame.size.height);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self setLeftBarBtn];
    
    
    [self setRightBtn];
    
    [self searchNavBarController];
    
    
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
 
//    [self getFilepath];
    
//    [self multiThread];
    
//    [self syncLock];
    
    
    [self setTableviewHeaderView];
    
    
}
-(void)createData{
    _data = [NSMutableArray array];
    
    HomeCellMode *mode = [[HomeCellMode alloc] init];
    mode.image = @"image_jiujiu";
    mode.describle=@"54°国井1951私藏原浆品鉴100ml单瓶";
    mode.salePrice = @"1500";
    mode.discountPrice = @"2000"; // 原价
    
    HomeCellMode *mode1 = [[HomeCellMode alloc] init];
    mode1.image = @"image_jiujiu";
    mode1.describle=@"54°国井1951私藏原浆品鉴100ml单瓶";
    mode1.salePrice = @"1500";
    mode1.discountPrice = @"2000"; // 原价
    
    HomeCellMode *mode2 = [[HomeCellMode alloc] init];
    mode2.image = @"image_jiujiu";
    mode2.describle=@"54°国井1951私藏原浆品鉴100ml单瓶";
    mode2.salePrice = @"1500";
    mode2.discountPrice = @"2000"; // 原价
    
    HomeCellMode *mode3 = [[HomeCellMode alloc] init];
    mode3.image = @"image_jiujiu";
    mode3.describle=@"54°国井1951私藏原浆品鉴100ml单瓶";
    mode3.salePrice = @"1500";
    mode3.discountPrice = @"2000"; // 原价
    
    
    [_data addObject:mode];
    [_data addObject:mode1];
    [_data addObject:mode2];
    [_data addObject:mode3];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeTableViewCell *cell = [HomeTableViewCell cellWithTableViewC:tableView];
    cell.mode = self.data[indexPath.row];
//    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  270;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
    tableView.backgroundColor = [UIColor whiteColor];
}




-(void)setTableviewHeaderView{
    
    HomeHeaderView *homeHeaderView = [[HomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 169)];
    
   // self.tableView.tableHeaderView = homeHeaderView;
    
    HomeMiddleView *homeMiddleView = [[HomeMiddleView alloc] initWithFrame:CGRectMake(0, homeHeaderView.frame.size.height, self.view.frame.size.width, 169)];
    
//    self.tableView.tableHeaderView = homeMiddleView;
    HomeBottomView *homeButtomView= [[HomeBottomView alloc] initWithFrame:CGRectMake(0, homeHeaderView.frame.size.height+homeMiddleView.frame.size.height, self.view.frame.size.width, 240)];
    
    int height = homeHeaderView.frame.size.height+homeMiddleView.frame.size.height+homeButtomView.frame.size.height;
    
    UIView *contentView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    [contentView addSubview:homeHeaderView];
    [contentView addSubview:homeMiddleView];
    [contentView addSubview:homeButtomView];
    
    self.tableView.tableHeaderView = contentView;
    
}

-(void)syncLock{
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    NSThread *thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    
    self.numTickets = 30;
    thread1.name = @"thread1 数据1";
    thread2.name = @"thread1 数据2";
    thread3.name = @"thread1 数据3";
    
     [thread1 start];
     [thread2 start];
     [thread3 start];
    
}

-(void)saleTicket{
    
    while (1) {
        @synchronized (self) {
            if (self.numTickets >0) {
                NSLog(@"numTickets = %ld      self = %@ ",self.numTickets,self);
                self.numTickets--;
            }else
            {
                break;
            }
        }
    }
    
}

// 设置导航栏搜索控制器
-(void)searchNavBarController{
   
//    self.navigationItem.titleView = button;
    
//
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:button.bounds];
//    searchBar.placeholder =  @"请输入你想要的美酒";
//    [searchBar setTranslucent:YES];
//    [searchBar setBarStyle:UIBarStyleBlackTranslucent];
////    [searchBar setValue:[UIFont boldSystemFontOfSize:10] forKeyPath:@"_placeholderLabel.font"];
////    [searchBar sizeToFit];
//    [button addSubview:searchBar];
//    UITextField *textfield = [searchBar valueForKey:@"_searchField"];
//    [textfield setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [textfield setValue:[UIFont boldSystemFontOfSize:8]forKeyPath:@"_placeholderLabel.font"];
    
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(16,0,150,16);
    label.numberOfLines = 1;
//    [label sizeToFit];
    label.text =@"输入您想要的美酒";
    [label setFont:[UIFont fontWithName:@"Microsoft YaHei" size: 12]];
    //    [label setTintColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]];
    
    label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    label.alpha = 0.54;
    [self.view addSubview:label];
    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"输入您想要的美酒" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Microsoft YaHei" size: 12], NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];

    
    
    UIImage *searchImage = [UIImage imageRenderOriginalWithImageName:@"home_icon_fangdajing"];
    UIImageView *searchBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 14, 14)];
    searchBarImageView.image = searchImage;
    
    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(133, 15, 120, 16)];
    
//    [button addSubview:label];
    [searchBarView addSubview:label];
    [searchBarView addSubview:searchBarImageView];
    self.navigationItem.titleView = searchBarView;
 
    
    
    
    
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithBackgroundImage:nil placeholder:@"搜一搜，订单一清二楚" isFollow:YES];
//    if (@available(iOS 11.0, *)) {
//    //  https://www.jianshu.com/p/352f101d6df1
//    // 下面的 100  可以根据情况添加
//     _searchBar.frame = CGRectMake(0, 0, kScreenWidth - 100, button.height);
//    }
//
//   [button addSubview:_searchBar];

    
//
//    self.definesPresentationContext = YES;
//
//    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//
//    //设置背景不透明
//    _searchController.searchBar.translucent=YES;
//    _searchController.searchBar.showsCancelButton = NO;
//    _searchController.searchBar.barTintColor=[UIColor redColor];
//    [_searchController.searchBar sizeToFit];
//
//    //设置searchbar的边框颜色和背景颜色一致
////    _searchController.searchBar.layer.borderWidth=1;
////    _searchController.searchBar.layer.borderColor=[[UIColor brownColor] CGColor];
////    _searchController.searchBar.placeholder=@"搜索联系人";
////    _searchController.searchResultsUpdater = self;
////    _searchController.dimsBackgroundDuringPresentation = NO;
//    _searchController.hidesNavigationBarDuringPresentation = NO;
//
//    CGRect searchBarFrame = CGRectMake(124, 9, 20, 19);
//    _searchController.searchBar.frame = self.navigationItem.titleView.frame;
////    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44);
////    _searchController.searchBar.delegate=self;
//
////    UIOffset offset = {10.0,0};
//
////    _searchController.searchBar.searchTextPositionAdjustment = offset;
//    _searchController.dimsBackgroundDuringPresentation = YES;
//
////     _searchController.searchBar.barTintColor = [UIColor colorWithRed:245/255.0 green:202/255.0 blue:121/255.0 alpha:1.0];
//    _searchController.searchBar.barTintColor = [UIColor redColor];
//    self.navigationItem.titleView = _searchController.searchBar;
////    [self.navigationController.navigationBar addSubview:self.searchController.searchBar];
//
    
}


// z设置左边的导航按钮
-(void)setLeftBarBtn{
  
    //[[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked)];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:home_dingwei style:UIBarButtonItemStylePlain target:self action:@selector(leftDingweiClick)];
    
    UIImage *home_dingwei_image  = [UIImage imageRenderOriginalWithImageName:@"home_icon_dingwei"];
    UIImageView *homeDingWeiImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 11, 12, 14)];
    homeDingWeiImageView.image = home_dingwei_image;
    
    UIBarButtonItem *home_dingwei = [[UIBarButtonItem alloc] initWithCustomView:homeDingWeiImageView];
    
//    UIBarButtonItem *home_dingwei= [[UIBarButtonItem alloc] initWithImage:home_dingwei_image style:UIBarButtonItemStylePlain target:self action:@selector(leftDingweiClick)];
    

//    UIBarButtonItem *home_dingwei_text= [[UIBarButtonItem alloc] initWithTitle:@"美的·林城" style:UIBarButtonItemStylePlain target:self action:@selector(selectorleftDingweiClick_text)];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(30.3,29,70,19);
    label.numberOfLines = 1;
//    [self.view addSubview:label];
    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"贵阳云岩区" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Microsoft YaHei" size: 14], NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    label.text= @"贵阳云岩区";
    [label setFont: [UIFont fontWithName:@"Microsoft YaHei" size: 14]];
    [label setTintColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]];
    
//    label.attributedText = string;
    label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    label.alpha = 1.0;
    
    UIBarButtonItem *home_dingwei_text = [[UIBarButtonItem alloc] initWithCustomView:label];
    

  
    self.navigationItem.leftBarButtonItems=@[home_dingwei,home_dingwei_text];
}
-(void)setRightBtn{
    
    //[[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked)];
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:home_dingwei style:UIBarButtonItemStylePlain target:self action:@selector(leftDingweiClick)];
    
    UIImage *message_image = [UIImage imageRenderOriginalWithImageName:@"home_icon_xiaoxi"];
    UIImageView *rightBarImageview = [[UIImageView alloc] initWithFrame:CGRectMake(347, 10, 16, 16)];
    rightBarImageview.image = message_image;
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithCustomView:rightBarImageview];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:message_image style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClicked)];
}
-(void)rightBarButtonItemClicked{
    
}
-(void)leftDingweiClick
{
    
}
-(void)selectorleftDingweiClick_text{
    
}

-(void)getFilepath{
    
    NSString *path = NSHomeDirectory();

    NSLog(@"path = %@",path);
    
    
    // 只访问当前h应用 获取Documents文件夹
    NSArray *docuPaths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docuPath = [docuPaths lastObject];
     NSLog(@"docuPath = %@",docuPath);
    
    
    // 获取Library目录
    NSArray *libraryPaths =  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libraryPaths lastObject];
    NSLog(@"libraryPath = %@",libraryPath);
    
    
    
    // 获取temp目录
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"tempPath = %@",tempPath);
    
    
//   [NSdata alloc] initWithContentsOfFile:<#(nonnull NSString *)#>
    
}


-(void)multiThread{
    
    
    // 1. 第一种实现方案 pthread
    
//    pthread_t pthread;
//    pthread_ceate();
    
    
    dispatch_queue_t queue = dispatch_queue_create("",DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"dispatch_queue_t = %@",queue);
    });
    
}


//- (void)viewSafeAreaInsetsDidChange {
//    // 补充：顶部的危险区域就是距离刘海10points，（状态栏不隐藏）
//    // 也可以不写，系统默认是UIEdgeInsetsMake(10, 0, 34, 0);
//    [super viewSafeAreaInsetsDidChange];
//  //  self.additionalSafeAreaInsets = UIEdgeInsetsMake(10, 0, 34, 0);
//}


@end
