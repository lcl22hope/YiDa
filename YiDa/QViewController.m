//
//  QViewController.m
//  YiDa
//
//  Created by lcl on 22/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "QViewController.h"
#import "UIView+YDUIView.h"
#import "util.h"
#import "QImgView.h"

@interface QViewController ()

@property (nonatomic,strong) UILabel* question;
@property (nonatomic,strong) UILabel* subtitle;
@property (nonatomic,strong) UILabel* coverage;
@property (nonatomic,strong) UILabel* question1;
@property (nonatomic,strong) UILabel* question2;
@property (nonatomic,strong) UILabel* question3;
@property (nonatomic,strong) UILabel* question4;
@property (nonatomic,strong) UIView * pointView;
@property (nonatomic,strong) QImgView* qImgView;

@end

@implementation QViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *backButtonImage = [UIImage imageNamed:@"返回"];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(backTapped:)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    self.navigationItem.title = @"答题";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pointView];
    [self.view addSubview:self.question];
    [self.view addSubview:self.subtitle];
    [self.view addSubview:self.coverage];
    
    
    
    
    _pointView.size = CGSizeMake(5, 5);
    _pointView.layer.cornerRadius = 2.5;
    _pointView.layer.masksToBounds = YES;
    _pointView.top  = self.view.top + 10 + 64;
    _pointView.left = self.view.left + 10;
    
    _question.size  = CGSizeMake(200, 30);
    _question.centerY = _pointView.centerY;
    _question.left  = _pointView.left + 7;
    
    _subtitle.size = CGSizeMake(SCREEN_WIDTH-20, 40);
    _subtitle.top = _question.bottom + 5;
    _subtitle.left= self.view.left + 10;
    
    _coverage.size = CGSizeMake(SCREEN_WIDTH-20, 30);
    _coverage.left = self.view.left + 10;
    _coverage.top  = _subtitle.bottom + 5;
    
    QImgView *q1 = [[QImgView alloc] init];
    q1.size = CGSizeMake(SCREEN_WIDTH-20, 40);
    q1.left = _subtitle.left;q1.top = _coverage.bottom + 10;
    [self.view addSubview:q1];
    UILabel* l1 = [UILabel new];
    l1.size = CGSizeMake(40, 40);
    l1.text = @"1";
    l1.textColor =[UIColor whiteColor];
    l1.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:l1];
    l1.centerY = q1.centerY;
    l1.left = q1.left + 6;
    [self.view addSubview:self.question1];
    _question1.size    = CGSizeMake(SCREEN_WIDTH-40, 40);
    _question1.centerY = q1.centerY;
    _question1.left    = q1.left + 40;
    
    
    QImgView *q2 = [[QImgView alloc] init];
    q2.size = CGSizeMake(SCREEN_WIDTH-20, 40);
    q2.left = q1.left;q2.top = q1.bottom + 10;
    [self.view addSubview:q2];
    UILabel* l2 = [UILabel new];
    l2.size = CGSizeMake(40, 40);
    l2.text = @"2";
    l2.textColor =[UIColor whiteColor];
    l2.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:l2];
    l2.centerY = q2.centerY;
    l2.left = q2.left + 6;
    [self.view addSubview:self.question2];
    _question2.size    = CGSizeMake(SCREEN_WIDTH-40, 40);
    _question2.centerY = q2.centerY;
    _question2.left    = q2.left + 40;
    
    
    QImgView *q3 = [[QImgView alloc] init];
    q3.size = CGSizeMake(SCREEN_WIDTH-20, 40);
    q3.left = _subtitle.left;q3.top = q2.bottom + 10;
    [self.view addSubview:q3];
    UILabel* l3 = [UILabel new];
    l3.size = CGSizeMake(40, 40);
    l3.text = @"3";
    l3.textColor =[UIColor whiteColor];
    l3.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:l3];
    l3.centerY = q3.centerY;
    l3.left = q3.left + 6;
    [self.view addSubview:self.question3];
    _question3.size    = CGSizeMake(SCREEN_WIDTH-40, 40);
    _question3.centerY = q3.centerY;
    _question3.left    = q3.left + 40;
    
    QImgView *q4 = [[QImgView alloc] init];
    q4.size = CGSizeMake(SCREEN_WIDTH-20, 40);
    q4.left = _subtitle.left;q4.top = q3.bottom + 10;
    [self.view addSubview:q4];
    UILabel* l4 = [UILabel new];
    l4.size = CGSizeMake(40, 40);
    l4.text = @"4";
    l4.textColor =[UIColor whiteColor];
    l4.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:l4];
    l4.centerY = q4.centerY;
    l4.left = q4.left + 6;
    [self.view addSubview:self.question4];
    _question4.size    = CGSizeMake(SCREEN_WIDTH-40, 40);
    _question4.centerY = q4.centerY;
    _question4.left    = q4.left + 40;
}

-(UILabel *)question{
    _question = [UILabel new];
    _question.text = @"爸爸去哪儿第二季";
    _question.textColor = [UIColor darkTextColor];
    _question.font = [UIFont systemFontOfSize:15];
    _question.textAlignment = NSTextAlignmentLeft;
    return _question;
}

-(UIView *)pointView{
    _pointView = [UIView new];
    _pointView.backgroundColor = [UIColor blueColor];
    return _pointView;
}

-(UILabel *)subtitle{
    _subtitle = [UILabel new];
    _subtitle.text = @"重庆武隆特辑中，宝宝购物时，多多为什么要向导演阿姨借钱？";
    _subtitle.textColor = [UIColor darkTextColor];
    _subtitle.font = [UIFont systemFontOfSize:15];
    _subtitle.numberOfLines = 0;
    _subtitle.textAlignment = NSTextAlignmentLeft;
    return _subtitle;
}

-(UILabel *)coverage{
    _coverage = [UILabel new];
    _coverage.text = @"正确率:  88%";
    _coverage.textColor = [UIColor lightGrayColor];
    _coverage.font = [UIFont systemFontOfSize:15];
    _coverage.textAlignment = NSTextAlignmentLeft;
    return _coverage;
}

-(UILabel *)question1{
    _question1 = [UILabel new];
    _question1.text = @"多多丢钱了";
    _question1.textColor = [UIColor darkTextColor];
    _question1.font = [UIFont systemFontOfSize:20];
    _question1.textAlignment = NSTextAlignmentLeft;
    return _question1;
}

-(UILabel *)question2{
    _question2 = [UILabel new];
    _question2.text = @"为了买玩具";
    _question2.textColor = [UIColor darkTextColor];
    _question2.font = [UIFont systemFontOfSize:20];
    _question2.textAlignment = NSTextAlignmentLeft;
    return _question2;
}

-(UILabel *)question3{
    _question3 = [UILabel new];
    _question3.text = @"为了给妈妈买礼物";
    _question3.textColor = [UIColor darkTextColor];
    _question3.font = [UIFont systemFontOfSize:20];
    _question3.textAlignment = NSTextAlignmentLeft;
    return _question3;
}

-(UILabel *)question4{
    _question4 = [UILabel new];
    _question4.text = @"买食材钱不够";
    _question4.textColor = [UIColor darkTextColor];
    _question4.font = [UIFont systemFontOfSize:20];
    _question4.textAlignment = NSTextAlignmentLeft;
    return _question4;
}

-(void)backTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}




@end
