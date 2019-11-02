//
//  YHButton.m
//  ComponentDemo
//
//  Created by 夷海科技 on 2019/10/10.
//  Copyright © 2019 夷海科技. All rights reserved.
//

#import "YHButton.h"

@implementation YHButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat midX = self.frame.size.width / 2;
    CGFloat midY = self.frame.size.height/ 3 ;
    self.titleLabel.center = CGPointMake(midX, midY + 23);
    self.imageView.center = CGPointMake(midX, midY - 10);
    
}

@end
