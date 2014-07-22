//
//  JKBUserDefaults.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBUserDefaults.h"

static JKBUserDefaults *_instance = nil;

@implementation JKBUserDefaults

@synthesize randomDeviceID = _randomDeviceID;
@synthesize userToken = _userToken;

+ (JKBUserDefaults *)instance{
    if(!_instance) {
		_instance = [[JKBUserDefaults alloc] init];
        
	}
	
	return _instance;
}

- (id)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)dealloc{
    [_randomDeviceID release];
    [_userToken release];
    [super dealloc];
}

- (void)saveData{
    [[NSUserDefaults standardUserDefaults] setObject:_randomDeviceID forKey:USER_DEFAULT_DEVICE_ID_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadData{
    self.randomDeviceID = [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEFAULT_DEVICE_ID_KEY];
}

- (BOOL)isLogin{
    _userToken = [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEFAULT_USER_TOKEN_KEY];
    if (self.userToken && self.userToken.length) {
        return YES;
    }
    
    return NO;
}

- (void)setUserTokenOnce:(NSString *)token{
    if (![self isLogin]) {
        if (token && token.length) {
            _userToken = [token copy];
            [[NSUserDefaults standardUserDefaults] setObject:_userToken forKey:USER_DEFAULT_USER_TOKEN_KEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}



@end
