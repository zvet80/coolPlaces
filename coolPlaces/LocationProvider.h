//
//  LocationProvider.h
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface LocationProvider : NSObject

@property (strong, nonatomic) PFGeoPoint *parseGeopoint;

@property (strong, nonatomic) NSString *locationString;

-(void) start;

@end
