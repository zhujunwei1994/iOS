//
//  NSString+ZCString.m
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/28.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import "NSString+ZCString.h"

@implementation NSString (ZCString)
- (CGFloat)widthWithFont:(CGFloat)fontSize height:(CGFloat)height {
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size.width;
}

- (CGFloat)heightWithFont:(CGFloat)fontSize width:(CGFloat)width {
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size.height;
}
@end
