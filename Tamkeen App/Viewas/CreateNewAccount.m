//
//  CreateNewAccount.m
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import "CreateNewAccount.h"

@interface CreateNewAccount ()

@end

@implementation CreateNewAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    _ID.delegate = self;
    _Password.delegate = self;
    _Name.delegate = self;
    _language.delegate = self;
    self.signUP.layer.cornerRadius = 10;
    self.signUP.clipsToBounds = YES;
     languagesList = [[NSMutableArray alloc] initWithObjects:@"العربية",@"English",@"Spanich",@"Urdo", nil];
    [self createlanguagePickerView];
}

-(void) createlanguagePickerView {
    languagePickertView = [[UIPickerView alloc]init];
    languagePickertView.dataSource = self;
    languagePickertView.delegate = self;
    self.language.inputView = languagePickertView;
    UIToolbar * Bar = [[UIToolbar alloc]init];
    [Bar sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                   target:self action:@selector(FillLanguage)];
    self.language.inputAccessoryView = Bar;
    Bar.items = @[doneButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [_ID becomeFirstResponder];
}
-(void) FillLanguage {
    [self.language resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _ID) {
        [_Password becomeFirstResponder];
    }else if (textField == _Password){
       [_Name becomeFirstResponder];
    }else if (textField == _Name){
        [_language becomeFirstResponder];
    }else {
         [self SignUp];
        
    }
    return YES;
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)goToMainPage {
    UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MainPagee"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)signUpButton:(id)sender {
    [self SignUp];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return languagesList.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return languagesList[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    choosenLang = languagesList[row];
    self.language.text = choosenLang;
}

- (void)SignUp {
    PFUser *user = [PFUser user];
    user.username = self.ID.text;
    user.password = self.Password.text;
    user[@"name"] = self.Name.text;
    user[@"language"] = self.language.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            [self goToMainPage];
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
