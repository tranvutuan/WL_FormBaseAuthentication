//
//  TNAConnection.m
//  FormBaseAuthentication
//
//  Created by VuTuan Tran on 2014-09-06.
//  Copyright (c) 2014 dhltd.apple. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"
#import "TNAConnectionListener.h"

@interface TNAConnectionListener ()
@property (strong, nonatomic) TNAChallengeHander *challengeHandler;
@property (strong, nonatomic) WLProcedureInvocationData *invocationData;
@end

@implementation TNAConnectionListener

#pragma mark - Initalization
- (id)initWithViewController :(ViewController*)controller;{
    if ( self = [super init] )
        self.controller = controller;
    return self;
}

#pragma mark - WLDelegate
-(void)onSuccess:(WLResponse *)response {
    //NSLog(@"%s",__func__);
    NSDictionary *dict = [response getResponseJson];
    BOOL isUseAuthenticated = [dict[@"userInfo"][@"SampleAppRealm"][@"isUserAuthenticated"] integerValue];
    if (!isUseAuthenticated )
        [self.controller showLoginForm];
    else
        [[WLClient sharedInstance] invokeProcedure:((AppDelegate*)[UIApplication sharedApplication].delegate).invocationData
                                      withDelegate:self.controller.invokeLinster];
    //[[WLClient sharedInstance] registerChallengeHandler:((AppDelegate*)[UIApplication sharedApplication].delegate).challengeHandler];

}
-(void)onFailure:(WLFailResponse *)response {
    NSLog(@"%s",__func__);

}
@end
