//
//  JKBPieCardView.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/18/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBPieCardView.h"
#import "JKBLabel.h"
#import "JKBCutlineView.h"
#import "defines.h"
#import "JKBPieView.h"

@interface JKBPieCardView()

@property (nonatomic, strong)JKBPieView *piewView; //左侧圆饼
@property (nonatomic, strong)JKBLabel   *lblValue;//最右侧百分比数值
@property (nonatomic, strong)JKBLabel   *lblNum;//故障次数
@property (nonatomic, strong)JKBLabel   *lblTime;//检测时间

@end

@implementation JKBPieCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _piewView = [[JKBPieView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        
    }
    return self;
}

- (void)loadPieCardViewData:(NSDictionary *)dataDict{
    
}

@end
