//
//  JKBTabBarController.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/21/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBTabBarController.h"
#import "JKBNavigationController.h"
#import "ViewController.h"
#import "JKBAlarmVC.h"

@interface JKBTabBarController ()

@end

@implementation JKBTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ViewController *vcHome = [[[ViewController alloc] init] autorelease];
    [self setViewControllers:[NSArray arrayWithObjects:
                              [[JKBNavigationController alloc] initWithRootViewController:vcHome],
                              [[[JKBNavigationController alloc] initWithRootViewController:[[[JKBAlarmVC alloc] init] autorelease]] autorelease],
                              nil]];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabBar_1"] selectedImage:[UIImage imageNamed:@"tabBar_1"]];
    vcHome.tabBarItem = item1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
