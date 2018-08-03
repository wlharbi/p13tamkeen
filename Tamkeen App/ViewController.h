//
//  ViewController.h
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "buttonCell.h"
@import GoogleMaps;
@import GooglePlaces;
@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,CLLocationManagerDelegate,GMSMapViewDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property(strong, nonatomic)NSMutableArray * arrimg;
@property(strong, nonatomic)NSMutableArray * arrTitle;
@property (weak, nonatomic) IBOutlet UIView *mapVieww;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;
@property (strong,nonatomic) NSString * Choosen;


@end

