//
//  UIImageView+ZCImageView.m
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/23.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import "UIImageView+ZCImageView.h"
//#import "UIButton+WebCache.h"

@implementation UIImageView (ZCImageView)

-(instancetype)imageView:(SEL)aSelector
{
    UIImageView *imageView =[[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"more_icon"];
    imageView.frame = CGRectMake(0, 0, 30, 30);
    imageView.center = self.center;
    [self addSubview:imageView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:aSelector];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [imageView addGestureRecognizer:tap];
    return self;
}
-(instancetype)imageView
{
    UIImageView *imageView =[[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"more_icon"];
    imageView.frame = CGRectMake(0, 0, 30, 30);
    imageView.center = self.center;
    [self addSubview:imageView];
    return self;
}


+(instancetype)imageWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];

    NSURL *url = [NSURL URLWithString:imageName];
    NSData *data = [NSData dataWithContentsOfURL:url];
    imageView.image = [UIImage imageWithData:data];
    return imageView;
}


@end
