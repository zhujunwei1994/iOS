//
//  NSString+ZCString.h
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/28.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZCString)

- (CGFloat)widthWithFont:(CGFloat)fontSize height:(CGFloat)height;
- (CGFloat)heightWithFont:(CGFloat)fontSize width:(CGFloat)width;

@end
