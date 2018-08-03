//
//  PaymentPage.m
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/2/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import "PaymentPage.h"
#import "Reservation.h"
@interface PaymentPage ()
@end
@implementation PaymentPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.payment = @"Visa";
    self.completePayment.layer.cornerRadius = 10;
    self.completePayment.clipsToBounds = YES;
    self.price.text = self.priceValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)cancelPage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)paymentSegment:(id)sender {
    if (self.paymentSegment.selectedSegmentIndex == 0) {
        self.HighlitedView.hidden = YES;
        self.payment = @"Visa";
    }else{
        self.HighlitedView.hidden = NO;
         self.payment = @"Cash";
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Type"])
    {
        
        
        Reservation * vc = (Reservation *) segue.destinationViewController;
        vc.payment = self.payment;
        vc.Type = self.Type;
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        vc.price = [f numberFromString:self.priceValue];
        NSLog(@"%@",self.Type);
        //NSLog(@"%@",self.reservationCode.text);
        NSLog(@"%@",self.payment);
        NSLog(@"%d",vc.price);
    }
}


@end
