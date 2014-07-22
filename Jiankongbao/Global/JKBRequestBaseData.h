//
//  JKBRequestBaseData.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKBRequestBaseData : NSObject{
    BOOL        _headResult;
    NSInteger   _headCode;
    long        _headTimestamp;
    NSString    *_headVersion;
    NSString    *_headMessage;
}

@property (nonatomic, assign) BOOL HeadResult;     //服务器返回结果,ture/false
@property (nonatomic, assign) NSInteger HeadCode;       //服务器返回码
@property (nonatomic, assign) long HeadTimeStamp;  //服务器返回时间戳
@property (nonatomic, copy) NSString *HeadVersion;    //服务器返回版本号
@property (nonatomic, copy) NSString *HeadMessage;    //服务器返回消息

@end
