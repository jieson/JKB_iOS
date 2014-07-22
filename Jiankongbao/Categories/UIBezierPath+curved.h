//
//  UIBezierPath+curved.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/18/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (curved)


- (UIBezierPath*)smoothedPathWithGranularity:(NSInteger)granularity;

@end
