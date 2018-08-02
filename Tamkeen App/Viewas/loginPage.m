//
//  loginPage.m
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import "loginPage.h"

@interface loginPage ()

@end

@implementation loginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    _NatID.delegate = self;
    _Password.delegate = self;
    _loginButton.layer.cornerRadius = 10;
    _loginButton.clipsToBounds = YES;
}
-(void)viewDidAppear:(BOOL)animated{
    [_NatID becomeFirstResponder];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _NatID) {
        [_Password becomeFirstResponder];
    }else{
        [self login:nil];
    }
    return YES;
}
- (void)goToMainPage {
    UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainPagee"];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)login:(id)sender {
    NSLog(@"CLICKED");
    [PFUser logInWithUsernameInBackground: self.NatID.text password:self.Password.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                             [self goToMainPage];
                                            NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
                                            [defaults setBool:YES forKey:@"loggedin"];
                                            [defaults synchronize];
                                           
                                        } else {
                                            [self displayMessageToUser:error.localizedDescription];
                                        }
                                    }];
}



- (void)displayMessageToUser:(NSString*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Message"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    popPresenter.sourceView = self.view;
    UIAlertAction *Okbutton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alert addAction:Okbutton];
    popPresenter.sourceRect = self.view.frame;
    alert.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:alert animated:YES completion:nil];
}



@end
