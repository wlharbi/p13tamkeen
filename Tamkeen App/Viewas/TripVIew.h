//
//  TripVIew.h
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/2/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
@interface TripVIew : UIViewController
@property (weak, nonatomic) IBOutlet UIView *storyView;
@property (weak, nonatomic) IBOutlet UILabel *TripName;
@property (weak, nonatomic) IBOutlet UILabel *hour;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *ReserveButton;
@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,retain) NSMutableArray *chairs;

@property (nonatomic,strong) NSString* tripNameString;
@end
