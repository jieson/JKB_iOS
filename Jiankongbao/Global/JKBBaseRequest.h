//
//  JKBBaseRequest.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/19/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "JKBRequestDelegate.h"

@interface JKBBaseRequest : NSObject{
    ASIHTTPRequest              *_request;      //请求
    __weak id<JKBRequestDelegate>    _delegate;      //委托
    
    NSMutableDictionary         *_reqAttDic;    //请求参数记录字典。参数值对
    NSMutableArray              *_signAttArray; //签名参数列表
    
    //通用字段，记录URL请求的一些通用参数
    NSString                    *_deviceId; //设备ID号
    NSString                    *_from;     //请求信息.比如iPhone4.1.1
    NSString                    *_output;   //请求返回数据包类型xml,json,bin等
    NSString                    *_language; //语言类型zh_CN,en_US等
    NSString                    *_channel;  //渠道号amap
    BOOL                        _compress;  //是否压缩
    
    //
    NSInteger                   _errCode;   //错误号，用来记录服务访问是否正常。
}

@property (nonatomic, weak) id<JKBRequestDelegate> delegate;

/*
 功能：    发起异步请求
 参数：    空
 返回值：   空
 */
- (void)doRequestWithActionCate:(NSString *)actionCate withAction:(NSString *)actionString;

/*
 功能：    取消请求
 参数：    空
 返回值：   空
 */
- (void)cancel;

/*
 功能：    添加URL请求参数对
 参数：    key     参数
 value   值
 isSign  是否是签名字段
 返回值：   空
 */
- (void)addReqAttWithKey:(NSString *)key andValue:(NSString *)value;

@end
