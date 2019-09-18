//
//  ZCUIView.m
//  掌上厨房
//
//  Created by Lxrent 37 on 16/4/25.
//  Copyright © 2016年 zhujunwei. All rights reserved.
//

#import "ZCUIView.h"
#import "UIImageView+ZCImageView.h"


@implementation ZCUIView

+(instancetype)viewWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title
{

    ZCUIView *view = [[ZCUIView alloc] initWithFrame:frame];
    UIImageView *imageView = [UIImageView imageWithFrame:CGRectMake(frame.origin.x,frame.origin.y , frame.size.width, frame.size.height - 10) imageName:imageName];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x, frame.size.height - 10, frame.size.width,10)];
    lable.font = [UIFont systemFontOfSize:10];
    lable.textColor = [UIColor blackColor];
    lable.text = title;
    [lable sizeToFit];

    [view addSubview:imageView];
    [view addSubview:lable];
    return view;
}

@end
