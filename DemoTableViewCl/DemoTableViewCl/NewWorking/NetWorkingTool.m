
/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  NetWorkingTool.m
 * @ProjectName(工程名):   DemoTableViewCl
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/28.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */



#import "NetWorkingTool.h"
#import <AFNetworking.h>

@class NetWorkingTool;

static NetWorkingTool *manager = nil;
static AFHTTPSessionManager *afnManager = nil;


@implementation NetWorkingTool


+(instancetype)manager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetWorkingTool alloc] init];
        afnManager = [AFHTTPSessionManager manager];
        afnManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    
    return manager;
}

+ (id)handleResponseObject:(NSData *)data {
    
    //将获取的二进制数据转成字符串
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //去掉字符串里的转义字符
    NSString *str1 = [str stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    //去掉头和尾的引号“”
    NSString *str2 = [str1 substringWithRange:NSMakeRange(1, str1.length-2)];
    //最终str2为json格式的字符串，将其转成需要的字典和数组
//    id object = [str2 objectFromJSONString];
    
    return str2;
}

//GET请求
- (void)getDataWithUrl:(NSString *)url parameters:(NSDictionary *)paramters success:(Success)success failure:(Failure)failure {
    
    afnManager.responseSerializer = [AFJSONResponseSerializer serializer];
    [afnManager GET:url parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
        }else {
            [[self class] showAlertViewWithMessage:@"暂无数据"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            
            NSLog(@"=== error %@",error);
            [[self class] showAlertViewWithMessage:@"服务器出错了~~~~(>_<)~~~~"];
            failure(error);
        }
    }];
    
}

/**
 *  提示信息
 *
 *  @param message 要提示的内容
 */
+ (void)showAlertViewWithMessage:(NSString *)message {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

-(void)postDataWithUrl:(NSString *)url parameters:(NSDictionary *)paramters success:(Success)success failure:(Failure)failure
{
    
    [afnManager POST:url parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success([[self class] handleResponseObject:responseObject]);
        }else {
            [[self class] showAlertViewWithMessage:@"暂无数据"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            [[self class] showAlertViewWithMessage:@"服务器出错了~~~~(>_<)~~~~"];
            failure(error);
        }
    }];
}


@end
