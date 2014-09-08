//
//  AppDelegate.h
//  FormBaseAuthentication
//
//  Created by VuTuan Tran on 2014-09-05.
//  Copyright (c) 2014 dhltd.apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TNAChallengeHander.h"
#import "WLProcedureInvocationData.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) TNAChallengeHander *challengeHandler;
@property (strong,nonatomic) WLProcedureInvocationData *invocationData;
@end
