//
//  loginPage.h
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface loginPage : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *NatID;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
