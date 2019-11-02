
/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  NetWorkingTool.h
 * @ProjectName(工程名):   DemoTableViewCl
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/28.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^Success)(id json);
/**
 *  请求失败回调错误信息
 *
 *  @param error error错误信息
 */
typedef void(^Failure)(NSError *error);

@interface NetWorkingTool : NSObject

+(NetWorkingTool *)manager;

-(void)getDataWithUrl:(NSString *)url parameters:(NSDictionary *)paramters success:(Success)success failure:(Failure)failure;

/**
 *  POST请求
 *
 *  @param url       NSString 请求url
 *  @param paramters NSDictionary 参数
 *  @param success   void(^Success)(id json)回调
 *  @param failure   void(^Failure)(NSError *error)回调
 */
- (void)postDataWithUrl:(NSString *)url parameters:(NSDictionary *)paramters success:(Success)success failure:(Failure)failure;


@end

NS_ASSUME_NONNULL_END
