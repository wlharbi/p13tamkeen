//
//  AppDelegate.m
//  Tamkeen App
//
//  Created by Yazeed ALZahrani on 8/1/18.
//  Copyright © 2018 Yazeed ALZahrani. All rights reserved.
//

#import "AppDelegate.h"
@import GoogleMaps;
@import GooglePlaces;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {
        configuration.applicationId = @"tamkeen";
        configuration.clientKey = @"tamkeen";
        configuration.server = @"https://parse.csdevapps.com/tamkeen/parse";

    }]];
    [self saveInstallationObject];
    [GMSServices provideAPIKey:@"AIzaSyCw0hGlgHCPNXhwriiOgg56Ehc6Ly2icFs"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyCw0hGlgHCPNXhwriiOgg56Ehc6Ly2icFs"];
//    if ([PFUser currentUser]){
//        UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main"  bundle:nil];
//        UIViewController* loginViewController = [mainstoryboard instantiateViewControllerWithIdentifier:@"MainPagee"];
//        self.window.rootViewController = loginViewController;
//    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

-(void)saveInstallationObject{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"You have successfully connected your app");
        }else{
            NSLog(@"installation save failed %@",error.debugDescription);
        }
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
