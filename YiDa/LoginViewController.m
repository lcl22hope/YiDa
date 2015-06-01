//
//  LoginViewController.m
//  YiDa
//
//  Created by lcl on 21/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//
#import "QuestionLibViewController.h"
#import "ExchangeViewController.h"
#import "PersonalViewController.h"
#import "MainViewController.h"
#import "YDBaseNavigationViewController.h"
#import "YDBaseTabBarController.h"
#import "LoginViewController.h"
#import "UIView+YDUIView.h"
#import "util.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (strong,nonatomic) UILabel*     titleLabel;
@property (strong,nonatomic) UITextField* accTextField;
@property (strong,nonatomic) UITextField* passTextField;
@property (strong,nonatomic) UIButton*     loginBtn;
@property (strong,nonatomic) UITextView*  forgetPassTextView;
@property (strong,nonatomic) UIButton*    forgetPassBtn;
@property (strong,nonatomic) UIButton*    regWithPhoneNumberBtn;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0 green:238/255.0 blue:245/255.0 alpha:1];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.accTextField];
    [self.view addSubview:self.passTextField];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.forgetPassTextView];
    [self.view addSubview:self.forgetPassBtn];
    [self.view addSubview:self.regWithPhoneNumberBtn];
    
    _titleLabel.size = CGSizeMake(SCREEN_WIDTH/2.0, 60);
    _titleLabel.centerX = self.view.centerX;
    _titleLabel.top  = self.view.top + 60;
    
    _accTextField.size = CGSizeMake(SCREEN_WIDTH-10, 30);
    _accTextField.top  = _titleLabel.bottom + 5;
    _accTextField.centerX = self.view.centerX;
    
    _passTextField.size= CGSizeMake(SCREEN_WIDTH-10, 30);
    _passTextField.top = _accTextField.bottom;
    _passTextField.centerX= self.view.centerX;
    
    _loginBtn.size  = CGSizeMake(SCREEN_WIDTH-20, 30);
    _loginBtn.centerX = self.view.centerX;
    _loginBtn.top   = _passTextField.bottom + 20;
    
    _forgetPassTextView.size = CGSizeMake(SCREEN_WIDTH/4.0, 25);
    _forgetPassTextView.centerX = self.view.centerX;
    _forgetPassTextView.top  = _loginBtn.bottom + 5;
    
    _forgetPassBtn.size      = CGSizeMake(SCREEN_WIDTH/4.0, 25);
    _forgetPassBtn.centerX   = self.view.centerX;
    _forgetPassBtn.top       = _loginBtn.bottom + 5;
    
    _regWithPhoneNumberBtn.size = CGSizeMake(SCREEN_WIDTH-20, 30);
    _regWithPhoneNumberBtn.centerX = self.view.centerX;
    _regWithPhoneNumberBtn.top  = _forgetPassBtn.bottom + 10;
    
    
    
    UIImageView* weiboIV = [UIImageView new];[weiboIV setImage:[UIImage imageNamed:@"weibo"]];
    UIImageView* renrenIV= [UIImageView new];[renrenIV setImage:[UIImage imageNamed:@"renren"]];
    UIImageView* weixinIV= [UIImageView new];[weixinIV setImage:[UIImage imageNamed:@"weixin"]];
    UIImageView* qqIV    = [UIImageView new];[qqIV setImage:[UIImage imageNamed:@"qq"]];
    weiboIV.contentMode = UIViewContentModeCenter;
    renrenIV.contentMode= UIViewContentModeCenter;
    weixinIV.contentMode= UIViewContentModeCenter;
    qqIV.contentMode    = UIViewContentModeCenter;
    NSInteger space = 2;
    renrenIV.size= CGSizeMake(60, 60);renrenIV.right = self.view.centerX-space;
    renrenIV.top = _regWithPhoneNumberBtn.bottom + 5;
    weiboIV.size = CGSizeMake(60, 60);weiboIV.right = renrenIV.left - space;
    weiboIV.top  = _regWithPhoneNumberBtn.bottom + 5;
    weixinIV.size= CGSizeMake(60, 60);weixinIV.left = self.view.centerX + space;
    weixinIV.top = _regWithPhoneNumberBtn.bottom + 5;
    qqIV.size    = CGSizeMake(60, 60);qqIV.left = weixinIV.right + space;
    qqIV.top     = _regWithPhoneNumberBtn.bottom + 5;
    weiboIV.layer.cornerRadius = weiboIV.width/2.0;weiboIV.layer.masksToBounds= YES;
    renrenIV.layer.cornerRadius= 30;renrenIV.layer.masksToBounds = YES;
    qqIV.layer.cornerRadius = 30;qqIV.layer.masksToBounds  = YES;
    weixinIV.layer.cornerRadius= 30;weixinIV.layer.masksToBounds = YES;
    
    
    [self.view addSubview:weiboIV];
    [self.view addSubview:renrenIV];
    [self.view addSubview:weixinIV];
    [self.view addSubview:qqIV];
    
    self.view.userInteractionEnabled = YES;
    
}
#pragma mark - subviews
-(UILabel *)titleLabel{
    _titleLabel = [UILabel new];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font          = [UIFont systemFontOfSize:60 weight:5];
    _titleLabel.textColor     = [UIColor blueColor];
    _titleLabel.text          = @"益答";
    return _titleLabel;
}

-(UITextField *)accTextField{
    _accTextField = [UITextField new];
    _accTextField.placeholder = @"手机号/用户名";
    _accTextField.textAlignment = NSTextAlignmentLeft;
    _accTextField.delegate = self;
    
    _accTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _accTextField.borderStyle=UITextBorderStyleRoundedRect;
    _accTextField.layer.borderColor = [UIColor grayColor].CGColor;
//    _accTextField.layer.borderWidth = 0.5;
    return _accTextField;
}

-(UITextField *)passTextField{
    _passTextField = [UITextField new];
    _passTextField.textAlignment = NSTextAlignmentLeft;
    _passTextField.placeholder   = @"密码";
    _passTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passTextField.secureTextEntry = YES;
    _passTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"txtPassword"];
    _passTextField.borderStyle=UITextBorderStyleRoundedRect;
    _passTextField.layer.borderColor = [UIColor grayColor].CGColor;
//    _passTextField.layer.borderWidth = 0.5;
    return _passTextField;
}

-(UIButton *)loginBtn{
    _loginBtn = [UIButton new];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor colorWithRed:53.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1.0]];
    
    [_loginBtn addTarget:self action:@selector(didClickLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.layer.cornerRadius = 2;
    _loginBtn.layer.masksToBounds = YES;
    return _loginBtn;

}

-(UITextView *)forgetPassTextView{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"忘记密码?"];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor darkTextColor] range:NSMakeRange(0, attrString.length)];
    [attrString addAttribute:NSLinkAttributeName value:attrString range:NSMakeRange(0, attrString.length)];
    NSRange range = [[attrString string] rangeOfString:@"忘记密码?"];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:range];
    [attrString addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithInt:3] range:range];
    [attrString addAttribute:NSUnderlineColorAttributeName value:[UIColor darkTextColor] range:range];
    NSDictionary *linkAttributes = @{
                                     NSForegroundColorAttributeName:
                                         [UIColor darkTextColor],
                                     NSUnderlineStyleAttributeName:
                                         @(NSUnderlineStyleSingle)
                                     };
    
    
    _forgetPassTextView = [UITextView new];
    _forgetPassTextView.backgroundColor = [UIColor clearColor];
    _forgetPassTextView.linkTextAttributes = linkAttributes;
    _forgetPassTextView.attributedText     = attrString;
    _forgetPassTextView.editable = NO;
    return _forgetPassTextView;
}

-(UIButton *)forgetPassBtn{
    _forgetPassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _forgetPassBtn.backgroundColor = [UIColor clearColor];
    return _forgetPassBtn;
}

-(UIButton *)regWithPhoneNumberBtn{
    _regWithPhoneNumberBtn = [UIButton new];
    [_regWithPhoneNumberBtn setTitle:@"使用手机号注册" forState:UIControlStateNormal];
    [_regWithPhoneNumberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_regWithPhoneNumberBtn setBackgroundColor:[UIColor colorWithRed:44/255 green:205/255.0 blue:112/255.0 alpha:1.0]];
    [_regWithPhoneNumberBtn addTarget:self action:@selector(didClickRegisterWithPhoneNumber:) forControlEvents:UIControlEventTouchUpInside];
    _regWithPhoneNumberBtn.layer.cornerRadius = 2;
    _regWithPhoneNumberBtn.layer.masksToBounds = YES;
    return _regWithPhoneNumberBtn;
}


#pragma mark - Actions
-(void)didClickLoginAction:(id)sender{
    NSString *account = [[_accTextField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [[_passTextField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (![@"admin@yida.com" isEqualToString:[account lowercaseString]] || ![@"12345678" isEqualToString:password]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"用户名/密码错误"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        
        [alertView show];
        return;
    }
    
    //Main
    MainViewController *mainVC = [MainViewController new];
    mainVC.title = @"益答";
    mainVC.tabBarItem.image = [UIImage imageNamed:@"home"];
    YDBaseNavigationViewController *mainNVC = [[YDBaseNavigationViewController alloc] initWithRootViewController:mainVC];
    //QuestionLib
    QuestionLibViewController *questionLibVC = [QuestionLibViewController new];
    questionLibVC.title = @"题库";
    questionLibVC.tabBarItem.image = [UIImage imageNamed:@"questionLib"];
    YDBaseNavigationViewController *questionLibNVC = [[YDBaseNavigationViewController alloc] initWithRootViewController:questionLibVC];
    //Exchange
    ExchangeViewController *exchangeVC = [ExchangeViewController new];
    exchangeVC.title = @"兑换";
    exchangeVC.tabBarItem.image = [UIImage imageNamed:@"exchange"];
    YDBaseNavigationViewController *exchangeNVC = [[YDBaseNavigationViewController alloc] initWithRootViewController:exchangeVC];
    //Personal
    PersonalViewController* personVC = [PersonalViewController new];
    personVC.title = @"个人";
    personVC.tabBarItem.image = [UIImage imageNamed:@"personal"];
    YDBaseNavigationViewController *personNVC = [[YDBaseNavigationViewController alloc] initWithRootViewController:personVC];
    //tabBar
    YDBaseTabBarController* rootTabBarController = [YDBaseTabBarController new];
    rootTabBarController.viewControllers = [NSArray arrayWithObjects:mainNVC,questionLibNVC,exchangeNVC,personNVC,nil];
    
   
    rootTabBarController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:rootTabBarController animated:YES completion:nil];
    
}

-(void)didClickRegisterWithPhoneNumber:(id)sender{

}

@end
