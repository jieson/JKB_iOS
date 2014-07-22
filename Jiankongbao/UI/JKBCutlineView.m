//
//  JKBCutlineView.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/18/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBCutlineView.h"
#import "JKBLabel.h"
#import "defines.h"

#define COLOR_WITH 11.0
#define OFFSET 8.0


@interface JKBCutlineView()

@property (nonatomic, strong)UIImageView *colorView;
@property (nonatomic, strong)JKBLabel    *lblTitle;

@end

@implementation JKBCutlineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withColor:(UIColor *)color andTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        _colorView = [[UIImageView alloc] initWithFrame:CGRectMake(2, (self.frame.size.height - COLOR_WITH) / 2, COLOR_WITH, COLOR_WITH)];
        _colorView.backgroundColor = color;
        
        _lblTitle = [[JKBLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxY(_colorView.frame) + OFFSET, (self.frame.size.height - 30) / 2, self.frame.size.width - CGRectGetMaxY(_colorView.frame) - OFFSET, 30) withFont:[UIFont systemFontOfSize:14.0] andTextColor:COLOR_STATUS_NORMAL];
        
        [self addSubview:_colorView];
        [self addSubview:_lblTitle];
    }
    
    return self;
}

@end
