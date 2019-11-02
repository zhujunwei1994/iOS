//
//  ViewController.m
//  YHYHStationDemo
//
//  Created by 夷海科技 on 2019/10/29.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>


#import <AFNetworking.h>

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray *buttons;

@property (nonatomic,weak) UIButton *selectedBtn;

@property (nonatomic,weak)  UIView *contentView;

@end

@implementation ViewController

- (NSMutableArray *)buttons
{
    if (_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

-(void)setupSubViewsWihtTitles:(NSArray *)titles{
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:contentView];
    _contentView = contentView;
    
    for (NSInteger i = 0; i<titles.count; i++) {
        
              UIButton *titleBtn = [[UIButton alloc] init];
            
              [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
              
              [titleBtn setTitleColor:[UIColor colorWithRed:255/255.0 green:153/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateSelected];
             
              [titleBtn setTitleColor:[UIColor colorWithRed:77/255.0 green:77/255.0 blue:77/255.0 alpha:1.0] forState:UIControlStateNormal];
              
              titleBtn.titleLabel.font  =  [UIFont fontWithName:@"PingFang SC" size: 14];
              
              titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
              
              [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
              
              titleBtn.tag = i;
        
              [self.contentView addSubview:titleBtn];
        
              [_buttons addObject:titleBtn];
    }
}

-(void)titleBtnClick:(UIButton *)btn{

    NSLog(@"%s",__func__);
    _selectedBtn.selected = NO;
    _selectedBtn =btn;
     _selectedBtn.selected = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self loadData];
    
    self.view.backgroundColor  = [UIColor whiteColor];
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self scrollView];

    [self setupSubViewsWihtTitles:@[@"干锅",@"麻辣",@"火锅",@"炒菜",@"茄子",@"蔬菜",@"土豆",@"西虹市",@"洋芋"]];

    [self setupViewLayoutSubviews];
    
//    [self initTest];
}

-(void)initTest
{
    UIScrollView *horizontalScrollView = [[UIScrollView alloc] init];
    horizontalScrollView.backgroundColor = [UIColor orangeColor];
    horizontalScrollView.pagingEnabled =YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:horizontalScrollView];
    [horizontalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(100);
    }];
    // 创建过渡视图并设置contentSize和其约束
    UIView *horizontalContainerView = [[UIView alloc] init];
    [horizontalScrollView addSubview:horizontalContainerView];
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(horizontalScrollView);
            make.height.equalTo(horizontalScrollView);//水平滚动高度固定，这个很重要
    }];
    //过渡视图上添加子视图
    UIView *previousView =nil;
    for (int i =0; i <10; i++) {

            UILabel *label = [[UILabel alloc]init];
            label.textAlignment =NSTextAlignmentCenter;
            label.backgroundColor = [UIColor colorWithHue:(arc4random() %256 / 256.0)
                                              saturation:(arc4random() %128 /256.0) +0.5
                                              brightness:(arc4random() %128 /256.0) +0.5
                                                   alpha:1];
            label.text = [NSString stringWithFormat:@"第 %d个视图", i];
          
           //添加到过渡视图，并设置子视图的约束
            [horizontalContainerView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.and.bottom.equalTo(horizontalContainerView);
                make.width.equalTo(horizontalScrollView);
                
                if (previousView) {
                    make.left.mas_equalTo(previousView.mas_right);
                }
                else {
                    make.left.mas_equalTo(0);
                }
            }];
     
            previousView = label;
    }
    // 设置过渡视图的右距（此设置将影响到scrollView的contentSize）这个也是关键的一步
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(previousView.mas_right);
    }];
}


-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.bounces = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = NO;
        scrollView.delegate = self;
        [self.view addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}


-(void)setupViewLayoutSubviews
{
    self.scrollView.backgroundColor  =[UIColor redColor];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//               make.width.equalTo(self.view);
               make.height.equalTo(@(50));
               make.left.equalTo(self.view).with.offset(0);
               make.right.equalTo(self.view).with.offset(0);
               make.top.equalTo(self.view).with.offset(30);
        
    }];
    
    self.contentView.backgroundColor = [UIColor orangeColor];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.scrollView);
              make.height.equalTo(self.scrollView);
        
//        make.edges.equalTo(self.scrollView);
//        make.width.equalTo(self.scrollView);
        
//        make.left.equalTo(self.scrollView.mas_left).with.offset(0);
//        make.bottom.equalTo(self.scrollView.mas_bottom).with.offset(0);
//        make.top.equalTo(self.scrollView.mas_top).with.offset(0);
//        make.right.equalTo(self.scrollView.mas_right).with.offset(0);
    }];
    
        float width  = (self.view.frame.size.width )/ 5;
        for (int i=0; i<self.buttons.count; i++) {
            UIButton *item = self.buttons[i];
            item.backgroundColor = [UIColor greenColor];
            CGFloat pointX = i*(width +10);
            item.backgroundColor = [UIColor orangeColor];
             [item mas_makeConstraints:^(MASConstraintMaker *make) {
            //               make.width.equalTo(self.view);
//               make.height.equalTo(@(40));
//               make.left.equalTo(self.contentView.mas_left).with.offset(pointX);
//               make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
//               make.top.equalTo(self.contentView.mas_top).with.offset(0);
//                 make.right.equalTo(self.scrollView.mas_right).with.offset(0);
    
                 make.top.and.bottom.equalTo(self.contentView);
                 make.width.equalTo(self.contentView);
                }];
        }
// 设置过渡视图的右距（此设置将影响到scrollView的contentSize）这个也是关键的一步
  [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.right.mas_equalTo([[self.buttons lastObject] mas_right]);
  }];

//    
//    

    
    
    
}




#pragma mark --网络加载数据
-(void)loadData{
//    NSString *jsonURL = @"http://api.izhangchu.com/?page=1&methodName=SceneList&size=20&version=4.40";
    
    NSString *goodsListURL = @"http://192.168.0.253:8067/product-service/api/goods/list";

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"]; //application/json text/xml
    //    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //    params[@"a"] = @"123";
    //    params[@"b"] = @"4";
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:goodsListURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"----请求成功  responseObject = %@",responseObject);
        
        id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"----请求成功  obj = %@",obj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        NSLog(@"----请求失败  error = %@",error);
    }];
}

@end
