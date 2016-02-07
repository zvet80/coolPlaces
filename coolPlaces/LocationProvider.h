//
//  LocationProvider.h
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "coolPlaces/coolPlaces-Bridging-Header.h"
#import <CoreLocation/CoreLocation.h>


@interface LocationProvider : NSObject

@property (strong, nonatomic) PFGeoPoint *parseGeopoint;

@property (strong, nonatomic) NSString *locationString;

@property (strong, nonatomic) CLLocation *clLocation;

-(void) start;

@end
