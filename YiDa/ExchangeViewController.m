//
//  ExchangeViewController.m
//  YiDa
//
//  Created by lcl on 21/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "ExchangeViewController.h"
#import "ExchangeContentCell.h"
#import "UIView+YDUIView.h"

@interface ExchangeViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *exchangeArray;
}


@end

@implementation ExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"14"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor yellowColor];
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"contentFile"
                                                          ofType:@"plist"];
    exchangeArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _exchangeTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    _exchangeTableView.dataSource = self;
    _exchangeTableView.delegate   = self;
    _exchangeTableView.bounces    = NO;
    _exchangeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_exchangeTableView];
}

static NSString *cellId = @"exchangeId";

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return exchangeArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExchangeContentCell *cell = (ExchangeContentCell*)[tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[ExchangeContentCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:cellId];
        
    }
    NSUInteger index = indexPath.row;
    NSDictionary* dic = (NSDictionary*)exchangeArray[index];
    NSString*imgName = [dic objectForKey:@"imageName"];
    NSString*textName= [dic objectForKey:@"textName"];
    NSString*score   = [dic objectForKey:@"score"];
    [cell setCellImg:imgName andLabelText:textName andScore:score];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView* titleImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    titleImgView.image = [UIImage imageNamed:@"苏宁"];
    return titleImgView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}




@end
