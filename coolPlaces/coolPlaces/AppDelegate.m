//
//  AppDelegate.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#include "Place.h"
#import "ListWithPLaces.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ListWithPLaces seedPlaces];
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"laM2O42kKHRui4IdqXubuTPVIAyGXja96ifAqjBe"
                  clientKey:@"O5rraYoXeAqYEJpm2UtN2rZd5C7IRGktQBVyTWUU"];
    
    
    // [Optional] Track statistics around application opens.
    //[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    //placesLoadedfromDb = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:[Place parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    Place *place = obj;
                    //NSLog(place.placeName);
                    //[placesLoadedfromDb addObject:place];
                   // NSLog([NSString stringWithFormat:@"%lu",(unsigned long)placesLoadedfromDb.count]);
                }];
//        return objects;
//        [result addObjectsFromArray:objects];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.places addObjectsFromArray: objects];
//            //self.places=[[NSMutableArray alloc]initWithArray:objects copyItems:YES];
//        });
        
        //return result;
    }];

    //NSLog([NSString stringWithFormat:@"%lu",(unsigned long)placesLoadedfromDb.count]);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
