/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHNetWorking.m
 * @ProjectName(工程名):   DemoTableViewCl
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/28.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */



#import "YHNetWorking.h"
#import <AFNetworking.h>

@class YHNetWorking;
static YHNetWorking *getInstace;

static AFHTTPSessionManager *sessionManager;

@implementation YHNetWorking



+ (instancetype)manager
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        getInstace = [[YHNetWorking alloc] init];
        
        sessionManager = [AFHTTPSessionManager manager];
        
        sessionManager.responseSerializer  =[AFHTTPResponseSerializer serializer];
        sessionManager.requestSerializer.timeoutInterval = 30.f;
        
    });
    
    return getInstace;
    
}




-(void)get:(NSString *)urlString para:(NSDictionary *)para success:(void(^)(id json))succes failure:(void(^)(NSError *error))failure{
    
//    sessionManager.responseSerializer.acceptableContentTypes  =[NSSet setWithObjects:@"text/html",@"application/json", nil];
    
//    sessionManager.responseSerializer.acceptableContentTypes  = [NSSet setWithObject:@"application/json"];

      sessionManager.responseSerializer.acceptableContentTypes  = [NSSet setWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    
    [sessionManager GET:urlString parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
       // NSLog(@"--请求成功 dict = %@",dict);
//        if (responseObject)
        {
            succes(responseObject);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
    
//    .acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
}

-(void)post:(NSString *)urlString para:(NSDictionary *)para success:(void (^)(id _Nonnull))succes failure:(void (^)(NSError * _Nonnull))failure
{
    
    
    [sessionManager POST:urlString parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
    
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSLog(@"========== responseObject = %@",responseObject);
        succes(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"========== error = %@",error);
        failure(error);
    }];
    
    
}

@end
