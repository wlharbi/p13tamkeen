//
//  CreateNewAccount.h
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface CreateNewAccount : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{
     UIPickerView * languagePickertView;
    NSMutableArray * languagesList;
    NSString * choosenLang;
}
@property (weak, nonatomic) IBOutlet UITextField *ID;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *language;
@property (weak, nonatomic) IBOutlet UIButton *signUP;

@end
