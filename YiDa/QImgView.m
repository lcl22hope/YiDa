//
//  QImgView.m
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "QImgView.h"

@implementation QImgView

-(instancetype)init{
    if (self = [super init]) {
        self.image = [UIImage imageNamed:@"答题label"];
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

@end
