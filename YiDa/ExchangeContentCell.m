//
//  ExchangeContentCell.m
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "ExchangeContentCell.h"
#import "UIView+YDUIView.h"

@implementation ExchangeContentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        [self createSubviews];
    }
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        [self createSubviews];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self createSubviews];
    }
    return self;
}


-(void)layoutSubviews{
    _contentImgView.size = CGSizeMake(40, 40);
    _contentImgView.centerY = self.centerY;
    _contentImgView.left = self.left + 10;
    
    _contentText.size = CGSizeMake(SCREEN_WIDTH/3.0, 30);
    _contentText.centerX = self.centerX;
    _contentText.centerY = self.centerY;
    
    _pointBtn.size = CGSizeMake(70, 40);
    _pointBtn.centerY = self.centerY;
    _pointBtn.right = self.right-10;
    _pointBtn.layer.cornerRadius = 20;
    _pointBtn.layer.masksToBounds = YES;
    
    _vsImgView.size = CGSizeMake(30, 30);
    _vsImgView.centerY = self.centerY;
    _vsImgView.left = _pointBtn.left + 5;
    
    _scoreLabel.size = CGSizeMake(40, 30);
    _scoreLabel.centerY = self.centerY;
    _scoreLabel.left = _vsImgView.right + 4;
    
    
}

#pragma mark - init
-(void)createSubviews{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.contentImgView];
    [self.contentView addSubview:self.contentText];
    [self.contentView addSubview:self.pointBtn];
    [self.contentView addSubview:self.vsImgView];
    [self.contentView addSubview:self.scoreLabel];
}

#pragma mark - subviews
-(UIImageView *)contentImgView{
    _contentImgView = [UIImageView new];
    return _contentImgView;
}

-(UILabel *)contentText{
    _contentText = [UILabel new];
    _contentText.textAlignment = NSTextAlignmentCenter;
    _contentText.textColor = [UIColor darkTextColor];
    _contentText.font = [UIFont systemFontOfSize:15];
    return _contentText;
}

-(YDButton *)pointBtn{
    _pointBtn = [[YDButton alloc] init];
    _pointBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pViewBg"]];
    return _pointBtn;
}

-(UIImageView *)vsImgView{
    _vsImgView = [UIImageView new];
    _vsImgView.image = [UIImage imageNamed:@"vs"];
    return _vsImgView;
}

-(UILabel *)scoreLabel{
    _scoreLabel = [UILabel new];
    _scoreLabel.textAlignment = NSTextAlignmentLeft;
    _scoreLabel.textColor = [UIColor redColor];
    return _scoreLabel;
}


-(void)setCellImg:(NSString*)imageName
     andLabelText:(NSString*)text
         andScore:(NSString*)score{
    _contentImgView.image = [UIImage imageNamed:imageName];
    _contentText.text = text;
    _scoreLabel.text = score;
}

@end
