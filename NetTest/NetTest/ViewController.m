//
//  ViewController.m
//  NetTest
//
//  Created by 夷海科技 on 2019/10/29.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

#import <AdSupport/AdSupport.h>



#import <AFNetworking.h>

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray *lablesArr;

@end

@implementation ViewController
-(void)loadData{
    NSString *jsonURL = @"http://api.izhangchu.com/?page=1&methodName=SceneList&size=20&version=4.40";
    
    NSString *goodsListURL = @"http://192.168.0.253:8067/product-service/api/goods/list";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; //application/json text/xml
    //    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //    params[@"a"] = @"123";
    //    params[@"b"] = @"4";
    
    [manager GET:goodsListURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"----请求成功  responseObject = %@",responseObject);
        
        id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"----请求成功  obj = %@",obj);
        NSLog(@"----请求成功  data = %@",obj[@"data"]);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"----请求失败  error = %@",error);
    }];
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        scrollView.bounces = YES;
//        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = NO;
        
        scrollView.center = self.view.center;
        
        scrollView.backgroundColor = [UIColor orangeColor];
        //    scrollView.automaticallyAdjustsScrollViewInsets = NO;
        //    scrollView.edgesForExtendedLayout = UIRectEdgeNone;
        scrollView.delegate = self;
        
        //        scrollView.delaysContentTouches = NO;
        [self.view addSubview:scrollView];
        _scrollView = scrollView;
        
    }
    return _scrollView;
}


-(void)testScrollView{
     self.navigationController.navigationBar.translucent = NO;
        
        int count = 10;
        CGFloat pointX   = 0;
        CGFloat width = 100;//self.view.frame.size.width;
        
        self.scrollView.contentSize = CGSizeMake(width*count, 100);
        
        _lablesArr = [NSMutableArray array];
        for(int i =0 ; i <count;i++){
            pointX =width*i;
            UIButton *lable = [[UIButton alloc] initWithFrame:CGRectMake(pointX, 0, width, 100)];
            
            lable.titleLabel.font =  [UIFont fontWithName:@"PingFang SC" size: 14];
            
         
            if (i%2==0) {
                lable.backgroundColor = [UIColor redColor];
            }else{
                lable.backgroundColor = [UIColor greenColor];

            }
            
    //        lable.textAlignment = NSTextAlignmentLeft;
            
    //        lable.center = self.view.center;
            
    //        lable.text = [NSString stringWithFormat:@"滚动视图---- %i",i];
            [lable setTitle:[NSString stringWithFormat:@"滚动视图---- %i",i] forState:UIControlStateNormal];
            
            [lable addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            
            [self.scrollView addSubview:lable];
            
            [_lablesArr addObject:lable];
            
            NSLog(@"i = %i      pointX = %f",i,pointX);
            
        }
}

-(void)testDirectoy
{
    //沙河目录
//    NSLog(@"%lu",NSHomeDirectory().length);
    
    
    // library 目录
    //获取Library的目录路径
//    NSString *libDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) firstObject];
//    NSLog(@"Library 路径：%@", libDir);
    
    // 获取library 目录下的 cache目录
    // 获取cache目录路径
//    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject];
//    NSLog(@"Cache 路径：%@", cachesDir);
    
    
//    [[NSUserDefaults standardUserDefaults] setFloat:20 forKey:@"demo"];
    
    // 临时目录
//    NSString *tmp = NSTemporaryDirectory();
//    NSLog(@"temp = %@",tmp);
    
//     NSString *bundlepath = [[NSBundle mainBundle] bundlePath];
//    NSLog(@"bundlepath = %@",bundlepath);
    
    //1.获取文件路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //2、添加储存的文件名
    NSString *path  = [docPath stringByAppendingPathComponent:@"data.archiver"];
    //3、将一个对象保存到文件中
    BOOL flag = [NSKeyedArchiver archiveRootObject:@"name" toFile:path];
    
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    
    NSLog(@"path = %@  obj= %@",path,obj);
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadData];
    // Do any additional setup after loading the view.
    
//    [self scrollView];
    
//    [self testDirectoy];
//
//    self.navigationItem.title = @"网络测试";
//
//    self.view.backgroundColor  = [UIColor redColor];
    
    
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSLog(@"adId = %@      idfv = %@",adId,idfv);
   
}

-(void)btnClick
{
    NSLog(@"---- %s",__func__);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}


//2019-10-31 16:30:53.228251+0800 NetTest[4002:160931] adId = 00000000-0000-0000-0000-000000000000      idfv = 676A3B07-ACBA-471E-A2A5-FC17D277FDC0

@end
