//
//  JKBNavigationController.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/21/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBNavigationController.h"

@implementation UINavigationItem (CustomTitle)

- (void) setTitle:(NSString *)title
{
    NSString *newTitle;
    if ([title length] > 12)
    {
        NSRange first = NSMakeRange(0, 11);
        NSMutableString *mStr = [NSMutableString string];
        [mStr appendString:[title substringWithRange:first]];
        [mStr appendString:@"…"];
        newTitle = mStr;
    }
    else
    {
        newTitle = title;
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont boldSystemFontOfSize:16];
    CGSize size = [title sizeWithFont:label.font];
    label.frame = CGRectMake((320.0-size.width)*0.5, 0, size.width, 44);
    label.textAlignment = UITextAlignmentCenter;
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor lightGrayColor]];
    label.text = newTitle;
    self.titleView = label;
    [label release];
}

@end

@implementation UINavigationBar (CustomImage)

- (void)drawRect:(CGRect)rect
{
	if ([[[UIDevice currentDevice].systemVersion substringToIndex:0] intValue] < 5) {
        UIImage *image = [UIImage imageNamed:@"navigationBar_bg.png"];
        [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
}

@end

@interface JKBNavigationController ()

@end

@implementation JKBNavigationController

#pragma mark - view lifecycle
- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.view.backgroundColor = [UIColor whiteColor];
//        if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0){
//            [[UINavigationBar appearance] setBackIndicatorImage:[[UIImage imageNamed:@"nav_back.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//            [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"nav_back.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//        }
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
