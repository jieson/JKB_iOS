//
//  JKBLoginVC.m
//  Jiankongbao
//
//  Created by Liu Xu Bing on 7/21/14.
//  Copyright (c) 2014 YunZhiHui. All rights reserved.
//

#import "JKBLoginVC.h"
#import "JKBCommonFunction.h"
#import "JKBUserDefaults.h"

@interface JKBLoginVC ()

@property (nonatomic, retain) UITextField *tfUserName;
@property (nonatomic, retain) UITextField *tfPassWord;
@property (nonatomic, retain) JKBBaseRequest *request;

@end

@implementation JKBLoginVC

- (id)init{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)dealloc{
    [_request cancel];
    _request.delegate = nil;
    [_request release];
    
    [_tfPassWord release];
    [_tfUserName release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tfUserName = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 280, 30)];
    _tfPassWord = [[UITextField alloc] initWithFrame:CGRectMake(20, 140, 280, 30)];
    
    _tfUserName.backgroundColor = [UIColor lightGrayColor];
    _tfPassWord.backgroundColor = [UIColor lightGrayColor];
    
    _tfPassWord.delegate = self;
    _tfUserName.delegate = self;
    
    _tfPassWord.secureTextEntry = YES;
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 280, 30)];
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:loginBtn];
    [loginBtn release];
    
    [self.view addSubview:_tfUserName];
    [self.view addSubview:_tfPassWord];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //用于测试
    _tfUserName.text = @"dengchao1@yunzhihui.com111";
    _tfPassWord.text = @"123456";
    // Do any additional setup after loading the view.
}

- (void)loginAction{
    if (_request) {
        [_request cancel];
        _request.delegate = nil;
        [_request release];
    }
    
    if (![JKBCommonFunction validString:_tfUserName.text]) {
        //提示
        return;
    }
    
    if (![JKBCommonFunction validString:_tfPassWord.text]) {
        //提示
        return;
    }
    
    _request = [[JKBBaseRequest alloc] init];
    _request.delegate = self;
    [_request addReqAttWithKey:@"email" andValue:_tfUserName.text];
    [_request addReqAttWithKey:@"password" andValue:_tfPassWord.text];
    [_request addReqAttWithKey:@"tag" andValue:@"err"];
    [_request doRequestWithActionCate:@"user" withAction:@"login"];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.backgroundColor = [UIColor whiteColor];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length == 0) {
        textField.backgroundColor = [UIColor lightGrayColor];
    }else{
        textField.backgroundColor = [UIColor whiteColor];
    }
}

- (void)jkbRequestFinished:(NSObject *)request response:(id)responseData{
    if ([responseData isKindOfClass:[NSDictionary class]]) {
        NSString *token = [[responseData objectForKey:@"response"] objectForKey:@"mobile_ticket"];
        [[JKBUserDefaults instance] setUserTokenOnce:token];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)jkbRequestFailed:(NSObject *)request response:(id)responseData{
    if ([responseData isKindOfClass:[NSDictionary class]]) {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
