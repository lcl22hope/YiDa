//
//  MainViewController.m
//  YiDa
//
//  Created by lcl on 21/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "util.h"
#import "MainViewController.h"
#import "YDPlayer.h"
#import "FriendRankCell.h"
#import "UIView+YDUIView.h"
#import "VsViewController.h"
#import "QViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *players;
    NSMutableArray *scores;
    UIButton       *curAvatarBtn;
}

@property (strong,nonatomic) UITableView *friendsTableView;
@property (strong,nonatomic) UIImageView *taskDayImageView;
@property (strong,nonatomic) UILabel     *taskBtn;
@property (strong,nonatomic) UIImageView *emigrateModeImageView;
@property (strong,nonatomic) UILabel     *emigrateBtn;
@property (strong,nonatomic) UIImageView *vsPlayImageView;
@property (strong,nonatomic) UILabel     *vsPlayBtn;

@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mainBg"]];
    UIBarButtonItem *avatarItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"ava6Item"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    self.navigationItem.leftBarButtonItem = avatarItem;
    
    //好友排行
    CGRect frame = CGRectMake(SCREEN_WIDTH/2.0, 0, SCREEN_WIDTH/2.0, SCREEN_HEIGHT);
    players = [[NSMutableArray alloc] initWithCapacity:6];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"scoreFile"
                                                          ofType:@"plist"];
    scores = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];

    for (NSInteger i = 0; i < 9; i++) {
        YDPlayer* player = [YDPlayer new];
        NSString* pName = [NSString stringWithFormat:@"ava%ld",i+1];
        player.avatarImg = [UIImage imageNamed:pName];
        player.scoreText = (NSString*)scores[i];
        [players addObject:player];
    }
    
    _friendsTableView = [[UITableView alloc] initWithFrame:frame
                                                     style:UITableViewStylePlain];
    _friendsTableView.delegate = self;
    _friendsTableView.dataSource = self;
    _friendsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _friendsTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"friendsBgCopy"]];
    _friendsTableView.bounces = NO;
    [self.view addSubview:_friendsTableView];
    
    //每日任务
    _taskBtn = [UILabel new];
    _taskBtn.size = CGSizeMake(SCREEN_WIDTH/2.0-20, 40);
    _taskBtn.backgroundColor = [UIColor colorWithRed:0
                                               green:181
                                                blue:248
                                               alpha:1.0];
    _taskBtn.text = @"每日任务";
    _taskBtn.textAlignment = NSTextAlignmentCenter;
    _taskBtn.font = [UIFont boldSystemFontOfSize:30];
    _taskBtn.layer.cornerRadius = 5;
    _taskBtn.layer.masksToBounds= YES;
    _taskBtn.top = 170;_taskBtn.left = 10;
    _taskBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* taskTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickTaskBtn:)];
    [_taskBtn addGestureRecognizer:taskTap];
    [self.view addSubview:_taskBtn];
    _taskDayImageView = [UIImageView new];
    _taskDayImageView.size = CGSizeMake(SCREEN_WIDTH/2.0, 150);
    _taskDayImageView.top  = 50;
    _taskDayImageView.left = 10;
    _taskDayImageView.image = [UIImage imageNamed:@"9"];
    [self.view addSubview:_taskDayImageView];
    
    //闯关模式
    _emigrateBtn = [UILabel new];
    _emigrateBtn.size = CGSizeMake(SCREEN_WIDTH/2.0-20, 40);
    _emigrateBtn.backgroundColor = [UIColor colorWithRed:0
                                               green:181
                                                blue:248
                                               alpha:1.0];
    _emigrateBtn.text = @"闯关模式";
    _emigrateBtn.textAlignment = NSTextAlignmentCenter;
    _emigrateBtn.font = [UIFont boldSystemFontOfSize:30];
    _emigrateBtn.layer.cornerRadius = 5;
    _emigrateBtn.layer.masksToBounds= YES;
    _emigrateBtn.top = 330;_emigrateBtn.left = 10;
    _emigrateBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* emigrateTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickEmigrateBtn:)];
    [_emigrateBtn addGestureRecognizer:emigrateTap];
    [self.view addSubview:_emigrateBtn];
    
    _emigrateModeImageView = [UIImageView new];
    _emigrateModeImageView.size = CGSizeMake(SCREEN_WIDTH/3.0+20, 150);
    _emigrateModeImageView.top  = _taskBtn.bottom - 10;
    _emigrateModeImageView.right= _friendsTableView.left + 10;
    _emigrateModeImageView.image= [UIImage imageNamed:@"8"];
    [self.view addSubview:_emigrateModeImageView];
    //对战模式配图
    _vsPlayImageView = [UIImageView new];
    _vsPlayImageView.image = [UIImage imageNamed:@"10"];
    _vsPlayImageView.size  = CGSizeMake(SCREEN_WIDTH/2.0-20, 150);
    _vsPlayImageView.top   = _emigrateBtn.bottom;
    _vsPlayImageView.left  = 10;
    [self.view addSubview:_vsPlayImageView];
    
    //对战模式
    _vsPlayBtn = [UILabel new];
    _vsPlayBtn.size = CGSizeMake(SCREEN_WIDTH/2.0-20, 40);
    _vsPlayBtn.backgroundColor = [UIColor colorWithRed:0
                                               green:181
                                                blue:248
                                               alpha:1.0];
    _vsPlayBtn.text = @"对战模式";
    _vsPlayBtn.textAlignment = NSTextAlignmentCenter;
    _vsPlayBtn.font = [UIFont boldSystemFontOfSize:30];
    _vsPlayBtn.layer.cornerRadius = 5;
    _vsPlayBtn.layer.masksToBounds= YES;
    _vsPlayBtn.bottom = self.view.bottom -60;_vsPlayBtn.left = 10;
    _vsPlayBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer* vsPlayTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickVsPlayBtn:)];
    [_vsPlayBtn addGestureRecognizer:vsPlayTap];
    [self.view addSubview:_vsPlayBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource
static NSString *cellId = @"friendId";

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return players.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendRankCell *cell = (FriendRankCell*)[tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[FriendRankCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:cellId];
    }
    NSUInteger index = indexPath.row;
    YDPlayer* player = players[index];
    [cell setCellContent:player.avatarImg withScores:player.scoreText];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *titleLabel = [UILabel new];
    titleLabel.size = CGSizeMake(SCREEN_WIDTH/2.0, 40);
    titleLabel.font = [UIFont systemFontOfSize:36];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"好友排行";
    titleLabel.backgroundColor = [UIColor clearColor];
    return titleLabel;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark - Btn Click Action
-(void)didClickTaskBtn:(id)sender{
    

}

-(void)didClickEmigrateBtn:(id)sender{
    QViewController* qVC = [QViewController new];
    [self.navigationController pushViewController:qVC animated:YES];
}

-(void)didClickVsPlayBtn:(id)sender{
    VsViewController* vsVC = [VsViewController new];
    vsVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:vsVC animated:YES completion:nil];
}
@end
