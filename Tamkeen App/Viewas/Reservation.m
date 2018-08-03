

#import "Reservation.h"
#import "LangCell.h"
@interface Reservation ()

@end

@implementation Reservation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int randomID = arc4random() % 9000 + 1000;
    self.reservationCode.text = [NSString stringWithFormat:@"%i",randomID];
    [self saveTransaction];
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)saveTransaction {
    NSLog(@"%@",self.Type);
    NSLog(@"%@",self.reservationCode.text);
    NSLog(@"%@",self.payment);
    NSLog(@"%d",self.price);
}
@end
