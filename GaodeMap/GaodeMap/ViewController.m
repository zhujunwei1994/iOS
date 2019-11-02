//
//  ViewController.m
//  GaodeMap
//
//  Created by 夷海科技 on 2019/10/8.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

#import <WebKit/WebKit.h>


#import <AMapSearchKit/AMapSearchKit.h>



@interface ViewController ()<AMapSearchDelegate>

@property (nonatomic,strong)AMapSearchAPI *search;

@property (nonatomic,strong) WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 高德地图
//    [self initMap];
    
    
    // WKWebView
    [self initWKWebview];
}
-(void)initWKWebview{
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webView loadRequest:request];
    
}

// 高德地图
-(void)initMap{
     ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    
    //    / 把地图添加至view
    //    [self.view addSubview:_mapView];
    
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
    
    request.keywords            = @"贵州大学";
    request.city                = @"贵阳";
    request.types               = @"高等院校";
    request.requireExtension    = YES;
    
    /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
    request.cityLimit           = YES;
    request.requireSubPOIs      = YES;
    
    //    [self.search AMapPOIKeywordsSearch:request];
    
}

- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if (response.pois.count == 0)
    {
        return;
    }
    
    //解析response获取POI信息，具体解析见 Demo
    
    for (int i = 0; i<response.pois.count; i++) {
        NSLog(@"---------response[%d] = %@",i,response.pois[i].address);

    }
}


@end
