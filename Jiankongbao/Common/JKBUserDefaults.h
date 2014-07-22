//
//  JKBUserDefaults.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USER_DEFAULT_DEVICE_ID_KEY  @"USER_DEFAULT_DEVICE_ID_KEY"
#define USER_DEFAULT_USER_TOKEN_KEY @"USER_DEFAULT_USER_TOKEN_KEY"

@interface JKBUserDefaults : NSObject{
    NSString  *_randomDeviceID;             //获取不到DeviceID时随机生成DeviceID
    NSString  *_userToken;
}

@property (nonatomic, copy) NSString *randomDeviceID;
@property (nonatomic, copy, readonly) NSString *userToken;

+ (JKBUserDefaults *)instance;
- (void)saveData;
- (void)loadData;
- (BOOL)isLogin;
- (void)setUserTokenOnce:(NSString *)token;

@end
