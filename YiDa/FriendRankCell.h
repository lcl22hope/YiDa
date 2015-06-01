//
//  FriendRankCell.h
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendRankCell : UITableViewCell
@property (nonatomic,strong) UIImageView* avatarImgView;
@property (nonatomic,strong) UIImageView* vsImgView;
@property (nonatomic,strong) UILabel*     scoreLabel;

-(void)setCellContent:(UIImage*)avaImg withScores:(NSString*)score;
@end
