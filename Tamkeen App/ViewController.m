//
//  ViewController.m
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import "ViewController.h"
#import "buttonCell.h"
#import <GoogleMaps/GoogleMaps.h>
@interface ViewController ()

@end

@implementation ViewController {
//    GMSMapView *mapView ;
//    GMSMarker *userPosition;
//    BOOL firstLocationUpdate_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.locationManager = [[CLLocationManager alloc] init];
//    self.locationManager.distanceFilter = kCLDistanceFilterNone;
//    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
//    [self.locationManager startUpdatingLocation];
//
//    [self.locationManager requestAlwaysAuthorization];
    
    self.arrimg = [[NSMutableArray alloc] initWithObjects:@"42509-kaaba-icon.png",@"42509-kaaba-icon.png",@"42509-kaaba-icon.png",@"42509-kaaba-icon.png", nil];
    self.arrTitle = [[NSMutableArray alloc] initWithObjects:@"Tawaf",@"Follw Me",@"Safa - Marwa",@"More", nil];
//    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:21.422510
//                                                            longitude:39.826168
//                                                                 zoom:16.5];
//    mapView = [GMSMapView mapWithFrame:self.mapVieww.bounds camera:camera];
//    mapView.myLocationEnabled = YES;
//    mapView.settings.myLocationButton = YES;
//    mapView.settings.allowScrollGesturesDuringRotateOrZoom = YES;
//    mapView.settings.compassButton = YES;
//    mapView.mapType = kGMSTypeSatellite;
//    mapView.settings.compassButton = YES;
//
//
//
//    [self.mapVieww addSubview:mapView];
//
//    // Creates a marker in the center of the map.
//    GMSMarker *marker_1 = [[GMSMarker alloc] init];
//    marker_1.position = CLLocationCoordinate2DMake(21.423720, 39.826168);
//    marker_1.title = @"Makkah";
//    marker_1.snippet = @"Saudi Arabia";
//    marker_1.map = mapView;
//    GMSMarker *marker_2 = [[GMSMarker alloc] init];
//    marker_2.position = CLLocationCoordinate2DMake(21.422615, 39.827734);
//    marker_2.title = @"Makkah";
//    marker_2.snippet = @"Saudi Arabia";
//    marker_2.map = mapView;
//    GMSMarker *marker_3 = [[GMSMarker alloc] init];
//    marker_3.position = CLLocationCoordinate2DMake(21.421187,39.824673);
//    marker_3.title = @"Makkah";
//    marker_3.snippet = @"Saudi Arabia";
//    marker_3.map = mapView;
//    GMSMarker *marker_4 = [[GMSMarker alloc] init];
//    marker_4.position = CLLocationCoordinate2DMake(21.422731,39.824688);
//    marker_4.title = @"Makkah";
//    marker_4.snippet = @"Saudi Arabia";
//    marker_4.map = mapView;
    
}
- (NSString *)deviceLocation
{
    NSString *theLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    return theLocation;
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
}

//- (void)locationManager:(CLLocationManager *)manager
//     didUpdateLocations:(NSArray *)locations {
//    // If it's a relatively recent event, turn off updates to save power.
//    CLLocation* location = [locations lastObject];
//    NSDate* eventDate = location.timestamp;
//    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
//    if (abs(howRecent) < 15.0) {
//        userPosition.position = CLLocationCoordinate2DMake(21.421187,39.824673);
//        userPosition.title = @"Makkah";
//        userPosition.snippet = @"Saudi Arabia";
//        userPosition.map = mapView;
//    }
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _arrimg.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        buttonCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1){
        buttonCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"FollowMecell" forIndexPath:indexPath];
        return cell;

    }else if (indexPath.row == 2){
        buttonCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Safacell" forIndexPath:indexPath];
        return cell;
    }else{
        buttonCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"OverViewcell" forIndexPath:indexPath];
         return cell;
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",[self deviceLocation]);
    
}


@end
