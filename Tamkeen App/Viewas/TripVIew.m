//
//  TripVIew.m
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/2/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import "TripVIew.h"
#import "PaymentPage.h"
@implementation TripVIew {
   GMSMapView *mapView;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TripName.text = self.tripNameString;
    if ([self.tripNameString isEqualToString:@"Tawaf"]) {
        self.hour.text = [NSString stringWithFormat:@"%i",2];
        self.price.text = [NSString stringWithFormat:@"%d",342.00];
    }else if ([self.tripNameString isEqualToString:@"Safa To Marwa"]) {
         self.hour.text = [NSString stringWithFormat:@"%i",1];
        self.price.text = [NSString stringWithFormat:@"%d",120];

    }
    self.ReserveButton.layer.cornerRadius =10;
    self.ReserveButton.clipsToBounds = YES;
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
        [self.locationManager startUpdatingLocation];
    
        [self.locationManager requestAlwaysAuthorization];
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.422510
                                                                longitude:39.826168
                                                                     zoom:16.5];
        mapView = [GMSMapView mapWithFrame:self.storyView.bounds camera:camera];
        mapView.myLocationEnabled = YES;
        mapView.settings.myLocationButton = YES;
        mapView.settings.allowScrollGesturesDuringRotateOrZoom = YES;
        mapView.settings.compassButton = YES;
        mapView.mapType = kGMSTypeSatellite;
        mapView.settings.compassButton = YES;
    
        [self.storyView addSubview:mapView];
        [self loadchairs];
}

-(void) loadchairs {
    PFQuery *query = [PFQuery queryWithClassName:@"Wheelchair" ];
    [query whereKey:@"status" equalTo:@"Free"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *  objects, NSError * error) {
        self.chairs = objects;
        NSLog(@"num of chairs is : %lu",self.chairs.count);
        int i = 0;
        for (PFObject* chair in self.chairs) {
            GMSMarker *marker_1 = [[GMSMarker alloc] init];
            NSNumber *latitude = [chair objectForKey:@"latitude"];
            NSNumber *Longitude = [chair objectForKey:@"Longitude"];
            NSLog(@"latitude is %d",latitude);
            NSLog(@"longtitde is %d",Longitude);
            marker_1.position = CLLocationCoordinate2DMake([latitude doubleValue], [Longitude doubleValue]);
            marker_1.title = @"chair";
            marker_1.snippet = @"ALHaram";
            marker_1.map = mapView;
            i++;
        }
    }];
}
- (NSString *)deviceLocation
{
    NSString *theLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    return theLocation;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Type"])
    {
        
        
        PaymentPage * vc = (PaymentPage *) segue.destinationViewController;
        vc.Type = self.TripName.text;
        vc.priceValue = self.price.text;
    }
}



@end
