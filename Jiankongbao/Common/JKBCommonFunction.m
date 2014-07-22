//
//  JKBCommonFunction.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBCommonFunction.h"
#import "JKBUserDefaults.h"


@implementation JKBCommonFunction


- (id)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

+ (NSString *)getRandomDeviceID{
    NSString *deviceID = [JKBUserDefaults instance].randomDeviceID;
    if (!deviceID || deviceID.length == 0) {
        //get random from 1000 - 9999
        int randomNumber = random() % 8999 + 1000;
        
        //get timeMillis since 1970
        NSTimeInterval time =[[NSDate date] timeIntervalSince1970] * 100;
        long long currentTimeMillis = [[NSNumber numberWithDouble:time] longLongValue];
        
        [JKBUserDefaults instance].randomDeviceID = [NSString stringWithFormat:@"%@%d%llu",@"IOS_",randomNumber,currentTimeMillis];
        [[JKBUserDefaults instance] saveData];
        
        deviceID = [JKBUserDefaults instance].randomDeviceID;
    }
    
    return deviceID;
}

+ (BOOL)validString:(NSString *)string{
    return string && string.length;
}

@end
