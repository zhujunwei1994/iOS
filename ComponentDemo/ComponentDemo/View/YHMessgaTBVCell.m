/** 贵州夷海j科技有限公司
 
 * @FileName(文件名):  YHMessgaTBVCell.m
 * @ProjectName(工程名):   ComponentDemo
 * @CreateDate(创建日期):  Created by zhujw on 2019/10/12.
 * @emain(联系方式)：1963295777@qq.com
 * @Copyright(版权所有) : Copyright © 2019 夷海科技. All rights reserved.
 */

#import "YHMessgaTBVCell.h"

#import <Masonry.h>

@interface YHMessgaTBVCell ()

@end

@implementation YHMessgaTBVCell

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//
//        // 初始化Cell背景视图
//        [self initDefauleStyle];
//
//        // 添加子视图
//        [self addViews];
//
//    }
//    return self;
//}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId =@"reUseCellId";
    YHMessgaTBVCell  *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[YHMessgaTBVCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
        
        [cell addViews];
        
        [cell initDefauleStyle];

    }
    return cell;
}



// 初始化Cell背景视图
-(void)initDefauleStyle{
    self.contentView.alpha = 1.0;
     self.contentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
     self.contentView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.20].CGColor;
     self.contentView.layer.shadowOffset = CGSizeMake(0,1);
     self.contentView.layer.shadowRadius = 8;
     self.contentView.layer.shadowOpacity = 1;
     self.contentView.layer.cornerRadius = 8;
    
}

  // 添加子视图
-(void)addViews{
    
    // 消息类型图标
    UIImageView *msgIcon = [[UIImageView alloc] init];
    msgIcon.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:msgIcon];
    _msgIcon = msgIcon;
    
    
    // 消息标题
    UILabel *msgTitle = [[UILabel alloc] init];
    msgTitle.numberOfLines = 0;
    msgTitle.font = [UIFont fontWithName:@"PingFang SC" size: 24];
    msgTitle.alpha = 1.0;
    [self.contentView addSubview:msgTitle];
    _msgTitle = msgTitle;
    
    
    // 消息详情描述
    
    UILabel *msgDetail = [[UILabel alloc] init];
    msgDetail.numberOfLines = 0;
    msgDetail.font = [UIFont fontWithName:@"Microsoft YaHei UI" size: 14];
    msgDetail.alpha = 1.0;
    [self.contentView addSubview:msgDetail];
    _msgDetail = msgDetail;
    
}

- (void)layoutSubviews
{

    
    // 消息图标布约束
    [_msgIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@60);
        make.height.equalTo(@60);
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(10);
        make.bottom.equalTo(self).with.offset(-10);
        
    }];
    
    // 消息标题约束
    [_msgTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@60);
        make.height.equalTo(@33);
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(86);
        make.right.equalTo(self).with.offset(-16);
//        make.bottom.equalTo(self.contentView).with.offset(9);
    }];
    
    // 消息详情约束
    [_msgDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.width.equalTo(@60);
        make.height.equalTo(@18);
        make.top.equalTo(self).with.offset(50);
        make.left.equalTo(self).with.offset(86);
        make.right.equalTo(self).with.offset(-16);
        make.bottom.equalTo(self).with.offset(-10);
    }];
    
    
}

// 重写Modef Set方法设置数据
-(void)setMode:(YHMsgMode *)mode
{
    _mode = mode;
    self.msgIcon.image = [[UIImage imageNamed:mode.icon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.msgTitle.text =mode.title;
    
    self.msgDetail.text = mode.detail;
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.y += 15;
    frame.size.height -= 15;
    frame.size.width  = frame.size.width - 24;
    frame.origin.x = 12;
    [super setFrame:frame];
}


@end
