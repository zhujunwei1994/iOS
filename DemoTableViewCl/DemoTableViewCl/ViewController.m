//
//  ViewController.m
//  DemoTableViewCl
//
//  Created by 夷海科技 on 2019/10/24.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

#import "DemoTableViewCell.h"
#import <MJRefresh.h>


#import <AFNetworking.h>

#import "NetWorkingTool.h"


#import "YHNetWorking.h"



@interface ViewController ()

@end

@implementation ViewController


-(void)netWorkRequest
{
    
//    NSString * urlString = @"http://www.baidu.com";
//    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:nil error:nil];
    
    NSString *jsonURL = @"http://api.izhangchu.com/?page=1&methodName=SceneList&size=20&version=4.40";
    NSString *URL = @"https://www.baidu.com";
    NSString *androidURL = @"http://192.168.0.108:8092/app/version?type=android";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; //application/json text/xml
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:androidURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


        id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        NSLog(@"--请求成功 responseObject = %@",obj);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"请求出错");
     }];
    
     
}

-(void)demo01
{
    NSString *jsonURL = @"http://api.izhangchu.com/?page=1&methodName=SceneList&size=20&version=4.40";
    NSString *URL = @"https://www.baidu.com";
    NSString *androidURL = @"http://192.168.0.108:8092/app/version?type=android";
    
    
    [[YHNetWorking manager] get:jsonURL para:nil success:^(id  _Nonnull json) {
        id obj = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"--请求成功 json = %@",obj);
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"--请求失败 error = %@",error);
    }];
}
-(void)demo02
{
    NSString *jsonURL = @"http://api.izhangchu.com/?page=1&methodName=SceneList&size=20&version=4.40";
    NSString *URL = @"https://www.baidu.com";
    
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        [manager GET:jsonURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    
            NSLog(@"请求成功 responseObject = %@",obj);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"--请求出错");
        }];
}

-(void)demoPost{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    manager POST:<#(nonnull NSString *)#> parameters:<#(nullable id)#> progress:<#^(NSProgress * _Nonnull uploadProgress)uploadProgress#> success:<#^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)success#> failure:<#^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)failure#>
}


-(void)test2{
    
    NSString *jsonURL = @"http://api.izhangchu.com/?page=1&methodName=SceneList&size=20&version=4.40";
    NSString *baiduURL = @"https://www.baidu.com";
    NSString *androidURL = @"http://192.168.0.108:8092/app/version?type=android";
    
     NSString *goodsURL = @"http://192.168.0.253:8067/product-service/api/goods/list";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; //application/json text/xml
    //    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //    params[@"a"] = @"123";
    //    params[@"b"] = @"4";
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:jsonURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //        NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        NSString *imageURL = obj[@"data"][@"data"][0][@"scene_background"];
        //        [self performSelectorOnMainThread:@selector(updateUIWithImageUrl:) withObject:imageURL waitUntilDone:NO];
        //        NSLog(@"data responseObject = %@",imageURL);
        
        NSLog(@"==请求成功 responseObject = %@",obj);
        
        
        // iOS 子线程中更新UI的三个方法
        //        dispatch_async(dispatch_get_main_queue(), ^{
        //            self.imageview.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
        //        });
        
        
        //        [self performSelectorOnMainThread:@selector(;) withObject:nil waitUntilDone:YES]
        
        //        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        //            self.imageview.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
        //        }];
        
        
        
        
        //        dispatch_sync(dispatch_get_main_queue(), ^{
        ////            [self->imageview setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]]];
        //
        //        });
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求出错");
    }];
    
}


-(void)testPostReqest{
    
    NSString *urlString = @"http://192.168.0.253:8067/doc.html/product-service/api/goods/detail/save";
    [[YHNetWorking manager] post:urlString para:nil success:^(id  _Nonnull json) {
        
        NSLog(@"请求成功 testPostReqest。json = %@",json);

        
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"请求失败  testPostReqest error = %@",error);

    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self demo01];
    
    [self testPostReqest];
    
   

    
   
    
//
//   MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
////        NSLog(@"----mj_header   %s",__func__);
//
//    }];
//
//    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    header.automaticallyChangeAlpha = YES;
//
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    self.tableView.mj_header = header;
//
//    [self.tableView.mj_header beginRefreshing];
//
//
//
//
//    [[NSRunLoop currentRunLoop] addTimer:[NSTimer timerWithTimeInterval:4.0 target:self selector:@selector(timerWithTStop) userInfo:nil repeats:NO] forMode:NSDefaultRunLoopMode];
//
}

-(void)timerWithTStop{
    NSLog(@"----end   %s",__func__);
    [self.tableView.mj_header endRefreshing];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"----touchs   %s",__func__);
    [self.tableView.mj_header endRefreshing];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
//    if (!cell) {
//        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
//    }
//
//    cell.textLabel.text  = [NSString stringWithFormat:@"朱哥哥---- %lu",indexPath.row];
    
    DemoTableViewCell *cell = [DemoTableViewCell demoTBVCellWithTableView:tableView];
    return cell;
}



@end
