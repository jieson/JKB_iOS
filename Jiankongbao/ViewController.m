//
//  ViewController.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/17/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "ViewController.h"
#import "JKBPieView.h"
#import "defines.h"
#import "JKBBaseRequest.h"
#import "JKBLoginVC.h"
#import "JKBUserDefaults.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL bHasShown;

@end

@implementation ViewController

- (id)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"概览页";
    self.tabBarItem.title = nil;
    self.bHasShown = NO;
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)viewDidAppear:(BOOL)animated{
    if (!self.bHasShown) {//第一次加载，查找用户信息
        self.bHasShown = YES;
        if ([self checkLogin]) {//在本地查找用户信息
            //已经登录，取出用户数据，显示相关监控信息
            [self loadViewData];
        }else{
            //没有登录，去登录界面
            JKBLoginVC *vc = [[JKBLoginVC alloc] init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
    }else{
        //已经登录，取出用户数据，显示相关监控信息
        [self loadViewData];
    }
    
}

- (void)loadViewData{
    JKBPieView *view = [[JKBPieView alloc] initWithFrame:CGRectMake(60, 150, 200, 200)];
    NSDictionary *pieData1 = [[NSDictionary alloc] initWithObjectsAndKeys:@0.3,PIE_PERCENT_KEY,COLOR_STATUS_BREAKDOWN,PIE_COLOR_KEY, nil];
    
    NSDictionary *pieData2 = [[NSDictionary alloc] initWithObjectsAndKeys:@0.7,PIE_PERCENT_KEY,COLOR_STATUS_NORMAL,PIE_COLOR_KEY, nil];
    NSArray *pieArr = [[NSArray alloc] initWithObjects:pieData1,pieData2, nil];
    
    NSDictionary *viewData = [[NSDictionary alloc] initWithObjectsAndKeys:pieArr,PIE_DATA_KEY,@"北京联通",PIE_RESPONSE_STATION_KEY,@"100ms",PIE_RESPONSE_TIME_KEY,@"200 OK",PIE_RESPONSE_STATUS_KEY, nil];
    
    [self.view addSubview:view];
    
    [view setViewData:viewData];
}

- (BOOL)checkLogin{
    return [[JKBUserDefaults instance] isLogin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
