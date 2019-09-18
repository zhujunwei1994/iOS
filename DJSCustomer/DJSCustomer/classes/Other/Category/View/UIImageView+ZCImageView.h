//
//  UIImageView+ZCImageView.h
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/23.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZCImageView)
-(instancetype)imageView;

+(instancetype)imageWithFrame:(CGRect)frame imageName:(NSString *)imageName;

@end
