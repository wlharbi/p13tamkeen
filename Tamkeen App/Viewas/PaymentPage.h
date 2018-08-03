//
//  PaymentPage.h
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/2/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentPage : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *completePayment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *paymentSegment;
@property (weak, nonatomic) IBOutlet UIView *HighlitedView;
@property (strong, nonatomic)  NSString *Type;
@property (strong, nonatomic)  NSString *priceValue;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic)  NSString *payment;
@end
