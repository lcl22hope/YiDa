//
//  YDButton.m
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "YDButton.h"
#import "UIView+YDUIView.h"

@implementation YDButton


-(void)layoutSubviews{
    [self setBackgroundImage:[UIImage imageNamed:@"pViewBg"] forState:UIControlStateNormal];
    self.imageView.center = CGPointMake(self.centerX - 10, self.centerY);
    self.imageView.left = self.titleLabel.left + 5;
    self.imageView.image = [UIImage imageNamed:@"vs"];
    self.titleLabel.frame = CGRectMake(self.bottom-20, 20, 20, 20);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    self.titleLabel.textColor = [UIColor redColor];
}

@end
