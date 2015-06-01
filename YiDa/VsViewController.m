//
//  VsViewController.m
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "VsViewController.h"
#import "UIView+YDUIView.h"
#import "util.h"

@interface VsViewController ()

@property (nonatomic,strong) UILabel*     titleLabel;
@property (nonatomic,strong) UIImageView* voleImgView;
@property (nonatomic,strong) UIImageView* questionImgView;
@property (nonatomic,strong) UILabel*     vsLabel;
@property (nonatomic,strong) UILabel*     qMarkImgView;
@property (nonatomic,strong) UILabel*     findLabel;
@property (nonatomic,strong) UIButton*    backBtn;

@end

@implementation VsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vsBg"]];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.voleImgView];
    [self.view addSubview:self.questionImgView];
    [self.view addSubview:self.vsLabel];
    [self.view addSubview:self.qMarkImgView];
    [self.view addSubview:self.findLabel];
    [self.view addSubview:self.backBtn];
    
    _titleLabel.size = CGSizeMake(SCREEN_WIDTH/2.0, 30);
    _titleLabel.top = self.view.top + 100; _titleLabel.centerX = self.view.centerX;
    
    _voleImgView.size = CGSizeMake(50, 50);
    _voleImgView.top  = _titleLabel.bottom + 100;
    _voleImgView.centerX = SCREEN_WIDTH/4.0;
    
    _questionImgView.size = CGSizeMake(50, 50);
    _questionImgView.top  = _titleLabel.bottom + 100;
    _questionImgView.centerX = SCREEN_WIDTH* 0.75;

    _qMarkImgView.size = CGSizeMake(30, 30);
    _qMarkImgView.center = _questionImgView.center;
    
    _vsLabel.size = CGSizeMake(40, 40);
    _vsLabel.centerX = (_voleImgView.right + _questionImgView.left)/2.0;
    _vsLabel.centerY = _voleImgView.centerY;
    
    _findLabel.size = CGSizeMake(SCREEN_WIDTH/2.0, 30);
    _findLabel.top  = _voleImgView.bottom + 180;
    _findLabel.centerX = self.view.centerX;
    
    _backBtn.size = CGSizeMake(100, 40);
    _backBtn.top  = _findLabel.bottom + 10;
    _backBtn.centerX = self.view.centerX;
    
}



#pragma mark - subviews
-(UILabel *)titleLabel{
    _titleLabel = [UILabel new];
    _titleLabel.text = @"随机对战模式";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_titleLabel sizeToFit];
    return _titleLabel;
}

-(UIImageView *)voleImgView{
    _voleImgView = [UIImageView new];
    _voleImgView.image = [UIImage imageNamed:@"vvv"];
    return _voleImgView;
}

-(UILabel *)vsLabel{
    _vsLabel = [UILabel new];
    _vsLabel.text = @"vs";
    _vsLabel.textColor = [UIColor darkTextColor];
    _vsLabel.font = [UIFont systemFontOfSize:20];
    _vsLabel.textAlignment = NSTextAlignmentCenter;
    return _vsLabel;
}

-(UIImageView *)questionImgView{
    _questionImgView = [UIImageView new];
    _questionImgView.image = [UIImage imageNamed:@"kuai"];
    return _questionImgView;
}

-(UILabel *)qMarkImgView{
    _qMarkImgView = [UILabel new];
    _qMarkImgView.text = @"?";
    _qMarkImgView.textColor = [UIColor darkTextColor];
    _qMarkImgView.font = [UIFont systemFontOfSize:20];
    _qMarkImgView.textAlignment = NSTextAlignmentCenter;
    return _qMarkImgView;
}

-(UILabel *)findLabel{
    _findLabel = [UILabel new];
    _findLabel.text = @"寻找对手中...";
    _findLabel.textColor = [UIColor whiteColor];
    _findLabel.font = [UIFont systemFontOfSize:20];
    _findLabel.textAlignment = NSTextAlignmentCenter;
    return _findLabel;
}

-(UIButton *)backBtn{
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"pViewBg"] forState:UIControlStateNormal];
    [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [_backBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(didClickDismissVC:) forControlEvents:UIControlEventTouchUpInside];
    return _backBtn;
}

-(void)didClickDismissVC:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
