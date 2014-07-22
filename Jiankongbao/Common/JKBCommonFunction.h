//
//  JKBCommonFunction.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import <Foundation/Foundation.h>

#define	DEVICE_ID	[[UIDevice currentDevice] uniqueDeviceIdentifier]	//如果ios5+则使用mac地址加密做id，否则调用系统方法

@interface JKBCommonFunction : NSObject

+(NSString *)getRandomDeviceID;
+(BOOL)validString:(NSString *)string;

@end
