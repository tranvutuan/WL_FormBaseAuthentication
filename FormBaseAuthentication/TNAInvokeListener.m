//
//  TNAInvokeListener.m
//  FormBaseAuthentication
//
//  Created by VuTuan Tran on 2014-09-06.
//  Copyright (c) 2014 dhltd.apple. All rights reserved.
//
#import "ViewController.h"
#import "TNAInvokeListener.h"
@implementation TNAInvokeListener

#pragma mark - Initalization
- (id)initWithViewController :(ViewController*)controller;{
    if ( self = [super init] )
        self.controller = controller;
    return self;
}

#pragma mark - WLDelegate
-(void)onSuccess:(WLResponse *)response {    
    [self.controller displaySecretData:response.responseText];
}
-(void)onFailure:(WLFailResponse *)response {
    NSLog(@"%s",__func__);    
}
@end
