//
//  JKBPieLayer.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/17/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBPieLayer.h"
#import "defines.h"

#define toRadians(x) ((x)*M_PI / 180.0)
#define toDegrees(x) ((x)*180.0 / M_PI)

@interface JKBPieLayer()

@property (nonatomic, copy)NSMutableArray *contentArray;//将颜色值和百分比封装成字典传进来

@end

@implementation JKBPieLayer

- (void)drawInContext:(CGContextRef)ctx{
    CGPoint center = CGPointMake(self.frame.size.width / (2), self.frame.size.height / (2));
    CGFloat innerRadius = 72.5;
    CGFloat outerRadius = 87.5;
    
    CGFloat totalDelta = 0.0;
    CGFloat preDelta = 0.0;
    
    if (self.contentArray.count) {
        for (int i = 0; i < self.contentArray.count; i ++) {
            CGMutablePathRef path = CGPathCreateMutable();
            NSDictionary *dict = self.contentArray[i];
            CGFloat persent = [[dict objectForKey:PIE_PERCENT_KEY] floatValue];
            CGFloat delta = toRadians(360 * persent);
            totalDelta += delta;
            UIColor *color = [dict objectForKey:PIE_COLOR_KEY];
            CGContextSetFillColorWithColor(ctx, color.CGColor);
            
            CGContextSetLineWidth(ctx, 1);
            CGContextSetLineCap(ctx, kCGLineCapRound);
            CGContextSetAllowsAntialiasing(ctx, YES);
            
            CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, preDelta, delta);
            CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, totalDelta, -delta);
//            CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
            
            CGContextAddPath(ctx, path);
            CGContextFillPath(ctx);
            
            CFRelease(path);
            
            preDelta += delta;
        }
    }
}

- (void)setContentData:(NSMutableArray *)dataArray{
    if (!self.contentArray) {
        _contentArray = [[NSMutableArray alloc] init];
    }
    
    self.contentArray = dataArray;
    [self setNeedsDisplay];
}

@end
