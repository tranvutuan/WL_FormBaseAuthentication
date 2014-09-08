//
//  ViewController.m
//  FormBaseAuthentication
//
//  Created by VuTuan Tran on 2014-09-05.
//  Copyright (c) 2014 dhltd.apple. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) AppDelegate *appDelegate;
@end

@implementation ViewController

#pragma mark - View cycle
- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"FormBaseAuthentication";
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.invokeLinster = [[TNAInvokeListener alloc] initWithViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Check connection
- (IBAction)connectToServer:(id)sender {
    [[WLClient sharedInstance] wlConnectWithDelegate:[[TNAConnectionListener alloc] initWithViewController:self]];
}

#pragma mark - UITextFieldDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        self.appDelegate.challengeHandler.usr = [alertView textFieldAtIndex:0].text;
        self.appDelegate.challengeHandler.pwd = [alertView textFieldAtIndex:1].text;
        
        [[WLClient sharedInstance] registerChallengeHandler:self.appDelegate.challengeHandler];
        [[WLClient sharedInstance] invokeProcedure:self.appDelegate.invocationData
                                      withDelegate:self.invokeLinster];

    }
    else
        [self logOut:nil];
}

#pragma mark - Show log in form
-(void)showLoginForm {
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Login"
                                                     message:@"Enter Username & Password"
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert addButtonWithTitle:@"Login"];
    [alert show];

}

-(void)displaySecretData:(NSString*)secretData {
    self.responseTextView.text = secretData;
}

#pragma mark - WLDelegate
-(void)onSuccess:(WLResponse *)response {
    self.responseTextView.text = @"";
}

-(void)onFailure:(WLFailResponse *)response {
    
}

#pragma mark - Log out
-(IBAction)logOut:(id)sender {
    [[WLClient sharedInstance] logout:@"SampleAppRealm" withDelegate:self];
}
@end
