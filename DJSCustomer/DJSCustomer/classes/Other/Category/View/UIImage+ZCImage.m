//
//  UIImage+ZCImage.m
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/14.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import "UIImage+ZCImage.h"

@implementation UIImage (ZCImage)

+(UIImage *)imageRenderOriginalWithImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+(UIImage *)stretchableWithImage:(UIImage *)image
{
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
