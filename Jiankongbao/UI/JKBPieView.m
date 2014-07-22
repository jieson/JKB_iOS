//
//  JKBPieView.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/17/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBPieView.h"
#import "JKBPieLayer.h"
#import "defines.h"
#import "JKBLabel.h"

@interface JKBPieView()


@property (nonatomic, strong)JKBLabel *lblResponseStation;
@property (nonatomic, strong)JKBLabel *lblResponseTime;
@property (nonatomic, strong)JKBLabel *lblResponseStatus;
@property (nonatomic, strong)JKBPieLayer    *pieLayer;

@end

@implementation JKBPieView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lblResponseStation = [[JKBLabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30) withFont:[UIFont systemFontOfSize:14.0] andTextColor:COLOR(0, 0, 0, 1)];
        _lblResponseStatus = [[JKBLabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30) withFont:[UIFont systemFontOfSize:14.0] andTextColor:COLOR(78.0, 78.0, 78.0, 1)];
        _lblResponseTime = [[JKBLabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30) withFont:[UIFont systemFontOfSize:14.0] andTextColor:COLOR(78.0, 78.0, 78.0, 1)];
        
        [self addSubview:_lblResponseStation];
        [self addSubview:_lblResponseStatus];
        [self addSubview:_lblResponseTime];
        
        _lblResponseStation.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 - 30);
        _lblResponseTime.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 );
        _lblResponseStatus.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 + 30);
        
        self.pieLayer = [JKBPieLayer layer];
        self.pieLayer.frame = self.bounds;
        self.pieLayer.contentsScale = [UIScreen mainScreen].scale;
        self.pieLayer.masksToBounds = NO;
        self.pieLayer.backgroundColor = [UIColor clearColor].CGColor;
        [self.pieLayer setNeedsDisplay];
        [self.layer addSublayer:self.pieLayer];
        
//        self.backgroundColor = [UIColor grayColor];
    }
    
    return self;
}

- (void)setViewData:(NSDictionary *)dataDict{
    if (dataDict) {
        NSString *station = [dataDict objectForKey:PIE_RESPONSE_STATION_KEY];
        NSString *time = [dataDict objectForKey:PIE_RESPONSE_TIME_KEY];
        NSString *status = [dataDict objectForKey:PIE_RESPONSE_STATUS_KEY];
        
        _lblResponseStation.text = station;
        _lblResponseStatus.text = status;
        _lblResponseTime.text = time;
        
        [self.pieLayer setContentData:[dataDict objectForKey:PIE_DATA_KEY]];
    }
}


@end
