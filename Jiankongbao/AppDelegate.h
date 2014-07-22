//
//  AppDelegate.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/17/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STFU_UIAccessibilityLoader.h"
#import "JKBTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;
@property (nonatomic, retain) JKBTabBarController *tabBarController;

@end
