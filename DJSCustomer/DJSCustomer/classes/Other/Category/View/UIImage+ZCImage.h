//
//  UIImage+ZCImage.h
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/14.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZCImage)

+(UIImage *)imageRenderOriginalWithImageName:(NSString *)imageName;

+(UIImage *)stretchableWithImage:(UIImage *)image;

@end
