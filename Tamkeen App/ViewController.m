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
#import "TripVIew.h"
@interface ViewController ()

@end

@implementation ViewController {
//    GMSMapView *mapView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.arrimg = [[NSMutableArray alloc] initWithObjects:@"cube.png",@"follow.png",@"sayi-4.png",@"kaaba.png", nil];
    self.arrTitle = [[NSMutableArray alloc] initWithObjects:@"Tawaf",@"Follow Me",@"Safa To Marwa",@"Overview", nil];
   
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
}


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
        buttonCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.image.image = [UIImage imageNamed:self.arrimg[indexPath.row]];
        cell.ButtonName.text = self.arrTitle[indexPath.row]
    ;
        return cell;
   
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
 

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"Trip"])
    {

        NSIndexPath *indexPath = [self.myCollection indexPathForCell:sender];
        TripVIew * vc = (TripVIew *) segue.destinationViewController;
         vc.tripNameString = self.arrTitle[indexPath.row];
    }
}


@end
