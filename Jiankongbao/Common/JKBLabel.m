//
//  JKBLabel.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/18/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBLabel.h"

@implementation JKBLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withFont:(UIFont *)font andTextColor:(UIColor *)color{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = font;
        self.textColor = color;
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

@end
