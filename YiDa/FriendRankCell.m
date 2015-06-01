//
//  FriendRankCell.m
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "FriendRankCell.h"
#import "UIView+YDUIView.h"
#define AVATAR_WIDTH (40)

@implementation FriendRankCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        [self createSubViews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createSubViews];
    }
    return self;
}

-(void)layoutSubviews{
    _avatarImgView.size = CGSizeMake(AVATAR_WIDTH, AVATAR_WIDTH);
    _avatarImgView.left = self.contentView.left + 20;
    _avatarImgView.centerY = self.contentView.centerY;
    _avatarImgView.layer.cornerRadius = _avatarImgView.size.width/2.0;
    _avatarImgView.layer.masksToBounds= YES;

    _vsImgView.size = CGSizeMake(20, 20);
    _vsImgView.left = _avatarImgView.right + 20;
    _vsImgView.centerY = self.contentView.centerY;
    
    _scoreLabel.size = CGSizeMake(40, 20);
    _scoreLabel.left = _vsImgView.right + 5;
    _scoreLabel.centerY = self.contentView.centerY;
}

-(void)createSubViews{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.avatarImgView];
    [self.contentView addSubview:self.vsImgView];
    [self.contentView addSubview:self.scoreLabel];
}

#pragma mark - subviews
-(UIImageView *)avatarImgView{
    _avatarImgView = [UIImageView new];
//    _avatarImgView.layer.borderWidth  = 1;
//    _avatarImgView.layer.borderColor  = [UIColor whiteColor].CGColor;
    
    return _avatarImgView;
}

-(UIImageView *)vsImgView{
    _vsImgView = [UIImageView new];
    _vsImgView.backgroundColor = [UIColor clearColor];
    _vsImgView.image = [UIImage imageNamed:@"vs"];
    _vsImgView.contentMode = UIViewContentModeCenter;
    return _vsImgView;
}

-(UILabel *)scoreLabel{
    _scoreLabel = [UILabel new];
    _scoreLabel.layer.cornerRadius = 5;
    _scoreLabel.layer.masksToBounds= YES;
    _scoreLabel.backgroundColor = [UIColor yellowColor];
    _scoreLabel.textColor = [UIColor darkTextColor];
    _scoreLabel.textAlignment = NSTextAlignmentCenter;
    _scoreLabel.font = [UIFont systemFontOfSize:20];
    return _scoreLabel;
}

#pragma mark - init content

-(void)setCellContent:(UIImage*)avaImg withScores:(NSString*)score{
    _avatarImgView.image = avaImg;
    _scoreLabel.text = score;
//    [self setNeedsLayout];
}

@end
