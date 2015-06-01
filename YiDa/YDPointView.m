//
//  YDPointView.m
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "YDPointView.h"
#import "UIView+YDUIView.h"

@implementation YDPointView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pViewBg"]];
        [self addSubview:self.vsImgView];
        [self addSubview:self.pointLabel];
    }
    return self;
}

-(instancetype)init{
    if (self =[super init]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pViewBg"]];
        [self addSubview:self.vsImgView];
        [self addSubview:self.pointLabel];
    }
    return self;
}

-(void)layoutSubviews{
//    self.backgroundColor = [UIColor purpleColor];
    self.layer.cornerRadius = 20;
    self.layer.masksToBounds= YES;
    _vsImgView.size = CGSizeMake(20, 20);
    _vsImgView.left = self.left + 5; _vsImgView.centerY = self.centerY;
    _pointLabel.size = CGSizeMake(20, 20);
    _pointLabel.left = _vsImgView.right + 5;
    _pointLabel.centerY = self.centerY;
}

#pragma mark - subviews
-(UIImageView *)vsImgView{
    _vsImgView = [UIImageView new];
    _vsImgView.image = [UIImage imageNamed:@"vs"];
    _vsImgView.backgroundColor = [UIColor clearColor];
    return _vsImgView;
}

-(UILabel *)pointLabel{
    _pointLabel = [UILabel new];
    _pointLabel.textAlignment = NSTextAlignmentCenter;
    _pointLabel.textColor = [UIColor redColor];
    _pointLabel.font = [UIFont systemFontOfSize:15];
    _pointLabel.backgroundColor = [UIColor clearColor];
    return _pointLabel;
}

@end
