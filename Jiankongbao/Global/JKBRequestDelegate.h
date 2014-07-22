//
//  JKBRequestDelegate.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//


@protocol JKBRequestDelegate <NSObject>

- (void)jkbRequestFinished:(NSObject *)request response:(id)responseData;
- (void)jkbRequestFailed:(NSObject *)request response:(id)responseData;

@end

