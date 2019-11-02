
/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHNetWorking.h
 * @ProjectName(工程名):   DemoTableViewCl
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/28.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHNetWorking : NSObject


+(instancetype)manager;
-(void)get:(NSString *)urlString para:(NSDictionary *)para success:(void(^)(id json))succes failure:(void(^)(NSError *error))failure;
-(void)post:(NSString *)urlString para:(NSDictionary *)para success:(void(^)(id json))succes failure:(void(^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
