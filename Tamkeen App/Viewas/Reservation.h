//
//  LanguageTableView.h
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface Reservation : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *reservationCode;
@property (strong, nonatomic) NSString *Type;
@property (strong, nonatomic) NSNumber  *price;
@property (strong, nonatomic) NSString  *payment;

@end
