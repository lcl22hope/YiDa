//
//  YDBaseTabBarController.m
//  YiDa
//
//  Created by lcl on 21/5/15.
//  Copyright (c) 2015 lcl. All rights reserved.
//

#import "YDBaseTabBarController.h"

@interface YDBaseTabBarController ()

@end

@implementation YDBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Rotation
-(BOOL)shouldAutorotate{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}


@end
