//
//  JBKHoriBarView.h
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/18/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBKHoriBarView : UIView

- (id)initWithFrame:(CGRect)frame
         startPoint:(CGPoint)startPoint
             values:(NSMutableArray *)values
           maxValue:(float)maxValue
     textIndicators:(NSMutableArray *)textIndicators
          textColor:(UIColor *)textColor
          barHeight:(float)barHeight
        barMaxWidth:(float)barMaxWidth
           gradient:(CGGradientRef)gradient;

@end
