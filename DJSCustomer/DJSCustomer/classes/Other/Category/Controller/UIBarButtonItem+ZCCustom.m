//
//  UIBarButtonItem+ZCCustom.m
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/15.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import "UIBarButtonItem+ZCCustom.h"

@implementation UIBarButtonItem (ZCCustom)

+ (UIBarButtonItem *)barButtomItemWithImage:(UIImage *)image selectImage:(UIImage *)selectImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.imageView.contentMode = UIViewContentModeCenter;

    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectImage forState:UIControlStateSelected];
    [btn sizeToFit];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

@end
