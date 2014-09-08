//
//  TNAChallengeHander.m
//  FormBaseAuthentication
//
//  Created by VuTuan Tran on 2014-09-06.
//  Copyright (c) 2014 dhltd.apple. All rights reserved.
//
#import "TNAChallengeHander.h"

@implementation TNAChallengeHander


#pragma mark - Test if challenge to be answered
-(BOOL)isCustomResponse:(WLResponse *)response {
    //NSLog(@"%s",__func__);
    if(response == nil || [response responseText] == nil || [[response responseText] rangeOfString:@"j_security_check"].location == NSNotFound){
        return false;
    }
    return true;    
}

#pragma mark - Handle the challenge
-(void)handleChallenge: (WLResponse *)response {
    //NSLog(@"%s",__func__);
    NSDictionary *dict=@{@"j_username": self.usr,@"j_password":self.pwd};
    [self submitLoginForm:@"j_security_check" requestParameters:dict requestHeaders:nil requestTimeoutInMilliSeconds:30000 requestMethod:@"POST"];
}

#pragma mark - WLDelegate
-(void) onFailure:(WLFailResponse *)response {
    [self submitFailure:response];
}
-(void) onSuccess:(WLResponse *)response {
    [self submitSuccess:response];
}




@end
