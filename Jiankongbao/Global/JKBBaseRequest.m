//
//  JKBBaseRequest.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBBaseRequest.h"
#import "JKBCommonFunction.h"
#import "defines.h"
#import "CJSONDeserializer.h"

@implementation JKBBaseRequest

@synthesize delegate = _delegate;

- (id)init {
    self = [super init];
    if (self != nil) {
        _reqAttDic = [[NSMutableDictionary alloc] init];
        _deviceId = [JKBCommonFunction getRandomDeviceID];
        _from = [NSString stringWithFormat:@"%@_%@", [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion]];
    }
    
    return self;
}

- (void)addReqAttWithKey:(NSString *)key andValue:(NSString *)value{
    [_reqAttDic setValue:value forKey:key];
}

- (void)doRequestWithActionCate:(NSString *)actionCate withAction:(NSString *)actionString{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (_request) {
        [_request cancel];
    }
    
    NSMutableString *urlString = [[NSMutableString alloc] init];
    [urlString appendFormat:@"%@%@/%@",COMMON_STRING,actionCate,actionString];
    BOOL isFirst = YES;
    for (NSString *key in _reqAttDic) {
        NSString *val = [_reqAttDic objectForKey:key];
        if (isFirst) {
            isFirst = NO;
            [urlString appendFormat:@"?%@=%@",key,val];
        }else{
            [urlString appendFormat:@"&%@=%@",key,val];
        }
    }
    
    [urlString appendFormat:@"&from=%@",_from];
    [urlString appendFormat:@"&device_id=%@",_deviceId];
    
    NSString *url = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    _request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:url]];
//    [_request setRequestMethod:@"GET"];
//    [_request setUseCookiePersistence:YES];
//    _request.useSessionPersistence = YES;
	[_request setDelegate:self];
    [_request setShouldAttemptPersistentConnection:NO];
    [_request setTimeOutSeconds:30];
	[_request startAsynchronous];
}

- (void)cancel{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    if (_request) {
		[_request clearDelegatesAndCancel];
        [_request release];
		_request = nil;
	}
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSData *data = [request responseData];
    NSError *error;
    id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if ([_delegate respondsToSelector:@selector(jkbRequestFinished:response:)]) {
        [_delegate jkbRequestFinished:request response:jsonData];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSData *data = [request responseData];
    NSError *error;
    if (data && data.length) {
        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        if ([_delegate respondsToSelector:@selector(jkbRequestFailed:response:)]) {
            [_delegate jkbRequestFailed:request response:jsonData];
        }
    }else{
        NSLog(@"%@",[request responseString]);
    }
}

@end
