//
//  ViewController.m
//  CocoPodsDemo
//
//  Created by 夷海科技 on 2019/9/24.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "ViewController.h"
//#import <AFNetworking.h>
#import <AFNetworking/AFNetworking.h>

#import "LoginViewController.h"
#import <SDAutoLayout.h>

#import <Masonry.h>

// 4.屏幕大小尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(33, 192, 174)
#define separaterColor RGB(200, 199, 204)

#define DEFAULT_TEXT_NUM @"请输您的入手机号码"
#define DEFAULT_TEXT_PWD @"请输入您的密码"
@interface ViewController ()<UITextViewDelegate>

//{
//    UIImageView *imageview;
//}
@property (nonatomic,weak) UIImageView *imageview;

@property (nonatomic,weak) UIImage *image;
@property (nonatomic,strong)  NSMutableArray *data;
@property (nonatomic,weak) UITextField *textView;
@property (nonatomic,weak) UITextField *pwd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.scrollEnabled = NO;
    
    // 测试网络 和 应用数据存储等部分内容
//    [self initNavView];
    
    
//    // login 导航控制器
//    [self setLoginNav];
//
//    // login 登陆
//    [self initLogin];
//
    [self test2];
    
//    [self testWithName:nil];
    
    // 毛玻璃
//    [self glass];
    
    
    // masonry iOS 屏幕自适应适配
//    [self initMasonry];
    
}

-(void)initMasonry{
    UIView *masonryView = [[UIView alloc] init];
    
    masonryView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:masonryView];
    
    [masonryView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.top.equalTo(self.view).with.offset(50);
//        make.left.equalTo(self.view).with.offset(50);
//        make.bottom.equalTo(self.view).with.offset(-300);
//        make.right.equalTo(self.view).with.offset(-50);
//
        
        make.center.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(30);
        make.left.equalTo(self.view).with.offset(30);
        make.bottom.equalTo(self.view).with.offset(-50);
        make.right.equalTo(self.view).with.offset(-30);
    }];
}



-(void)glass{
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:self.view.bounds];
    
    toolBar.barStyle = UIBarStyleBlack;
    
    [self.view addSubview:toolBar];
}
///


-(void)testWithName:(NSString *)name{
    UIAlertController *alert = [[UIAlertController alloc] init];
    
    [self.navigationController pushViewController:alert animated:YES];
    
}

-(void)setLoginNav{
    
    UIView *navBar = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.navigationController.navigationBar.frame.size.width,44)];
    navBar.alpha = 1.0;
    
    // 左上角X号
    UIImageView *closeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 13, 17, 17)];
    UIImage *image = [UIImage imageNamed:@"guanbi"];
    closeImageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [navBar addSubview:closeImageView];

    //login 右上角手机号码快捷登录
    UIButton *numFastLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    
    int marignRight = 12;
    int numFastLoginWidth =84;
    int numFastLoginX = navBar.frame.size.width-marignRight-numFastLoginWidth;
    
    
    numFastLogin.frame = CGRectMake(numFastLoginX,13,84,17);
    numFastLogin.alpha = 1.0;
    [numFastLogin setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
    [numFastLogin setFont:[UIFont fontWithName:@"PingFang SC" size: 12]];
    [numFastLogin setTitleColor:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0] forState:UIControlStateNormal];
    [navBar addSubview:numFastLogin];
    [self.navigationController.navigationBar addSubview:navBar];
}

-(void)initLogin{
    
    UIView *loginView = [[UIView alloc] initWithFrame:self.view.bounds];
//    [loginView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:loginView];
    
    
//    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//    [self.navigationController pushViewController:loginVC animated:YES];
    
    // 背景
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgView.image = [UIImage imageNamed:@"02"];
    [loginView addSubview:bgView];
    
    //输入您的手机号码
    int marignNumAndPwd = 38;
    int width = self.view.bounds.size.width - 2*marignNumAndPwd;
    int phoneNumY = self.view.frame.size.height*0.2546;
    UITextField *phoneNum = [[UITextField alloc] initWithFrame:CGRectMake(38, phoneNumY, width, 22)];
    [phoneNum setFont:[UIFont fontWithName:@"PingFang SC" size: 16]];
    [phoneNum setTintColor:[UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0]];
    phoneNum.alpha = 0.33;
//    [phoneNum setBackgroundColor:[UIColor redColor]];
//    phoneNum.text = DEFAULT_TEXT_NUM;
    phoneNum.placeholder = DEFAULT_TEXT_NUM;
    phoneNum.keyboardType = UIKeyboardTypeNumberPad;
    phoneNum.returnKeyType = UIReturnKeyDone;
//    phoneNum.textAlignment = NSAL
    phoneNum.tag = 1;
//    phoneNum.
//    phoneNum.delegate = self;
    phoneNum.clearButtonMode = UITextFieldViewModeAlways;
    phoneNum.autocorrectionType = UITextAutocorrectionTypeNo;
    phoneNum.adjustsFontSizeToFitWidth = YES;
    [loginView addSubview:phoneNum];
     _textView= phoneNum;
    
    // 下划线
    UIView *numLins = [[UIView alloc] init];
    int numLinsY = self.view.frame.size.height*0.2969;
    numLins.frame = CGRectMake(37,numLinsY,width,1);
    numLins.alpha = 1.0;
    [numLins setBackgroundColor:[UIColor lightGrayColor]];
    [loginView addSubview:numLins];
    
    //输入您的密码
     int pwdY = self.view.frame.size.height*0.3208;
    UITextField *pwd = [[UITextField alloc] initWithFrame:CGRectMake(38, pwdY, width, 22)];
   
    [pwd setFont:[UIFont fontWithName:@"PingFang SC" size: 16]];
    [pwd setTintColor:[UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1.0]];
    pwd.alpha = 0.33;
//    [pwd setBackgroundColor:[UIColor redColor]];
//    pwd.text = DEFAULT_TEXT_PWD;
    pwd.placeholder = DEFAULT_TEXT_PWD;
    pwd.keyboardType = UIKeyboardTypeNumberPad;
    pwd.returnKeyType = UIReturnKeyDone;
    //    phoneNum.textAlignment = NSAL
    pwd.tag = 2;
//    pwd.delegate = self;
    pwd.clearButtonMode = UITextFieldViewModeAlways;
    pwd.autocorrectionType = UITextAutocorrectionTypeNo;
    pwd.adjustsFontSizeToFitWidth = YES;
    [loginView addSubview:pwd];
     _pwd= pwd;
    
    // 下划线
    UIView *pwdLine = [[UIView alloc] init];
      int pwdLineY = self.view.frame.size.height*0.3613;
    pwdLine.frame = CGRectMake(37,pwdLineY,width,1);
    pwdLine.alpha = 1.0;
    [pwdLine setBackgroundColor:[UIColor lightGrayColor]];
    [loginView addSubview:pwdLine];
    
    // 登录的路按钮
    UIButton *loginBtn = [[UIButton alloc] init];
    int loginBtnY = self.view.frame.size.height*0.4093;
    loginBtn.frame = CGRectMake(37,loginBtnY,width,36);
    loginBtn.alpha = 1.0;
    loginBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:153/255.0 blue:0/255.0 alpha:1.0];
    loginBtn.layer.cornerRadius = 4;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [loginBtn setFont:[UIFont fontWithName:@"PingFang SC" size: 24]];
    [loginView addSubview:loginBtn];
    
    [loginBtn addTarget:self action:@selector(loginUser) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    // 微信登录 图片
    
    int weixinLoginImageMarign = (loginView.frame.size.width-48)/2;
    int distance = loginView.frame.size.height+self.navigationController.navigationBar.frame.size.height -61-275-37;
   
    int distanceY = self.view.frame.size.height-61-44- 313-39- 44;
    
    UIImageView *weixinLoginImage = [[UIImageView alloc] init];
    
//    NSLog(@"distance = %d     --- %f    loginViewHeight = %f" ,distance,(self.navigationController.navigationBar.frame.size.height),(loginView.frame.size.height));

    NSLog(@"width = %f  , height = %f   distanceY = %d",self.view.frame.size.width,self.view.frame.size.height,distanceY);
    
    
    int weixinLoginImageY = (self.view.frame.size.height-20)*0.8426;
//    weixinLoginImage.frame = CGRectMake(weixinLoginImageMarign, weixinLoginImageY, 48, 44);
    weixinLoginImage.image = [[UIImage imageNamed:@"weixin"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [loginView addSubview:weixinLoginImage];
    weixinLoginImage.sd_layout.leftSpaceToView(loginView, weixinLoginImageMarign).topSpaceToView(loginBtn, distanceY).widthIs(48).heightIs(44);


    
    
    // 微信登录文字
    int weixinLoginTextMarigng = (loginView.frame.size.width - 70)/2;
    UILabel *weixinLoginText = [[UILabel alloc] init];
    
     int weixinLoginTextY = (self.view.frame.size.height-20)*0.9085;
    
//    weixinLoginText.frame = CGRectMake(weixinLoginTextMarigng,weixinLoginTextY,70,21);
    weixinLoginText.numberOfLines = 0;
    weixinLoginText.text = @"微信登录";
    [weixinLoginText setFont:[UIFont fontWithName:@"Microsoft YaHei" size: 16]];
    weixinLoginText.textColor = [UIColor colorWithRed:176/255.0 green:176/255.0 blue:176/255.0 alpha:1.0];
    weixinLoginText.alpha = 1.0;
    //    [weixinLoginText sizeToFit];
    [loginView addSubview:weixinLoginText];
    
    
    
    weixinLoginText.sd_layout.leftSpaceToView(loginView,weixinLoginTextMarigng).topSpaceToView(weixinLoginImage, 0).widthIs(70).heightIs(21);
   
}
-(void)loginUser{
    LoginViewController *loginVc = [[LoginViewController alloc] init];
    
    self.hidesBottomBarWhenPushed = YES;
    self.navigationController.navigationBar.hidden = YES;
    
    [self.navigationController pushViewController:loginVc animated:YES];
    
    
//    LoginViewController *loginVc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
//    [self.navigationController pushViewController:loginVc animated:YES];
}






-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    switch (textView.tag) {
        case 1:
            if ([DEFAULT_TEXT_NUM isEqualToString:textView.text]) {
                textView.text = @"";
            }
            break;
        case 2:
            if ([DEFAULT_TEXT_PWD isEqualToString:textView.text]) {
                textView.text = @"";
            }
            break;
        default:
            break;
    }
    textView.textColor =  [UIColor blackColor];
    return YES;
   
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    switch (textView.tag) {
        case 1:
            if ([@"" isEqualToString:textView.text]) {
                textView.text = DEFAULT_TEXT_NUM;
            }
            break;
        
        case 2:
            if ([@"" isEqualToString:textView.text]) {
                textView.text = DEFAULT_TEXT_PWD;
            }
            break;
            
        default:
            break;
    }
    

    textView.textColor = [UIColor grayColor];
    return YES;
}


-(void)initNavView{
    // Do any additional setup after loading the view.
    
    //    NSLog(@"wdith = %f    height = %f",self.view.frame.size.width,self.view.frame.size.height);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title  =@"我是你朱哥哥";
    
    
    self.navigationController.navigationBar.barTintColor = navigationBarColor;//[UIColor greenColor];
    
    // self.additionalSafeAreaInsets = UIEdgeInsetsMake(44, 0, 0, 0);
    
    // 设置导航控制器
    [self setNav];
    
    // 家在网络请求数据
    //    [self loadData];
    
    // x下载任务
    //    [self downLoadTask];
    
    //    [self requestData];
    
    //    [self test1];
    
    
    [self test2];
    _data = [NSMutableArray array];
    for (int i = 0; i<150; i++) {
        [_data addObject:[NSString stringWithFormat:@"82年的茅台 %d 件       月销量: 100000瓶",i]];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellid"];
//        [cell.textLabel autoresizingMask];
        [cell.textLabel sizeToFit];
    }
    
//    cell.backgroundColor = [UIColor redColor];
    cell.selected = UITableViewCellSelectionStyleNone;

    
    return cell;
    
    
}

-(void)test2{
    
    NSString *jsonURL = @"http://api.izhangchu.com/?page=1&methodName=SceneList&size=20&version=4.40";
    NSString *URL = @"https://www.baidu.com";
    NSString *androidURL = @"http://192.168.0.108:8092/app/version?type=android";
    
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

//                NSLog(@"==请求成功 responseObject = %@",obj);

        
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
-(void)updateUIWithImageUrl:(NSString *)imageUrl{
    NSLog(@"updateUIWithImageUrl = %@",imageUrl);
    _image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, _image.size.width, _image.size.height)];
    
    imageView.backgroundColor = [UIColor redColor];
//    [imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    
    [self.view addSubview:imageView];
    _imageview = imageView;
    
    self.imageview.image = _image;
    
    
}




-(void)test1{
  
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    
    NSURL *URL = [NSURL URLWithString:@"http://192.168.0.108:8092/app/version?type=android"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
//            NSLog(@"Error: %@", error);
            NSLog(@"网络请求成功 responseObject = %@",responseObject);
            NSLog(@"网络请求成功 response = %@",response);
            
            
        } else {
//            NSLog(@"%@ %@", response, responseObject);
            NSLog(@"网络请求失败");
        }
    }];
    [dataTask resume];
  
}

-(void)requestData{
    
    NSLog(@"start request ........ ");
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
//        id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//         id obj  = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONReadingMutableContainers error:nil];

         NSLog(@"responseObject obj = %@",[responseObject class]);
        if (error) {
//            NSLog(@"Error: %@", error);
//                     id obj  = [NSJSONSerialization dataWithJSONObject:error options:NSJSONReadingMutableContainers error:nil];

            NSLog(@"网络请求出错    obj = /");
        } else {
//            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

-(void)downLoadTask{
    
    
    NSLog(@"start downLoadTask");
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://www.baidu.com,"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSLog(@"responseObject = %@",response);

//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
        return nil;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}

-(void)loadData{
    
    
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

    -(void)setNav{
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 64)];
        backView.backgroundColor = navigationBarColor;
//        [self.view addSubview:backView];
//        self.navigationController.navigationBar = backView;
        [self.navigationController.navigationBar addSubview:backView];
        
        
        [self.navigationController.navigationBar setBackgroundColor:navigationBarColor];
        //城市
        UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cityBtn.frame = CGRectMake(10, 30, 40, 25);
        cityBtn.font = [UIFont systemFontOfSize:15];
        [cityBtn setTitle:@"贵阳" forState:UIControlStateNormal];
        [backView addSubview:cityBtn];
        //
        UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cityBtn.frame), 38, 13, 10)];
        [arrowImage setImage:[UIImage imageNamed:@"icon_homepage_downArrow"]];
        [backView addSubview:arrowImage];
        //地图
        UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        mapBtn.frame = CGRectMake(screen_width-42, 30, 42, 30);
        [mapBtn setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
        [mapBtn addTarget:self action:@selector(OnMapBtnTap:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:mapBtn];
        
        //搜索框
        UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(arrowImage.frame)+10, 30, 200, 25)];
        //    searchView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_home_searchBar"]];
        searchView.backgroundColor = RGB(7, 170, 153);
        searchView.layer.masksToBounds = YES;
        searchView.layer.cornerRadius = 12;
        [backView addSubview:searchView];
        
        
        //
        UIImageView *searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 15, 15)];
        [searchImage setImage:[UIImage imageNamed:@"icon_homepage_search"]];
        [searchView addSubview:searchImage];
        
        UILabel *placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 150, 25)];
        placeHolderLabel.font = [UIFont boldSystemFontOfSize:13];
        //    placeHolderLabel.text = @"请输入商家、品类、商圈";
        placeHolderLabel.text = @"你点你就喝";
        placeHolderLabel.textColor = [UIColor whiteColor];
        [searchView addSubview:placeHolderLabel];
    }


- (CGSize)intrinsicContentSize {
    return UILayoutFittingExpandedSize;
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"indexPath.row = %ld",indexPath.row);
    

    
    [cell.textLabel setText:self.data[indexPath.row]];
    
    
}



@end
