//
//  ExchangeContentCell.h
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDPointView.h"
#import "YDButton.h"
#import "util.h"

@interface ExchangeContentCell : UITableViewCell

@property (nonatomic,strong) UIImageView* contentImgView;
@property (nonatomic,strong) UILabel*     contentText;
@property (nonatomic,strong) UIImageView* vsImgView;
@property (nonatomic,strong) UILabel*     scoreLabel;
@property (nonatomic,strong) YDButton*    pointBtn;

-(void)setCellImg:(NSString*)imageName
     andLabelText:(NSString*)text
         andScore:(NSString*)score;

@end
