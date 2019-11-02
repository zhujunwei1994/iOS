/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHMessgaTBVCell.h
 * @ProjectName(工程名):   ComponentDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/12.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import <UIKit/UIKit.h>

#import "YHMsgMode.h"

NS_ASSUME_NONNULL_BEGIN

#define REUSE_MESSAGE_CELL @"messgecellid"

@interface YHMessgaTBVCell : UITableViewCell



+(instancetype)cellWithTableView:(UITableView *)tableView;


// 消息类型图标
@property (nonatomic,weak) UIImageView *msgIcon;

// 消息标题
@property (nonatomic,weak) UILabel     *msgTitle;

// 消息详情描述
@property (nonatomic,weak) UILabel     *msgDetail;

// 消息Mode
@property (nonatomic,assign) YHMsgMode *mode;

@end

NS_ASSUME_NONNULL_END
