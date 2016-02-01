//
//  NSObject_Place_initWithDicts.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"

@interface Place (Dictionaries)

+(Place*) placeWithDict: (NSDictionary*) dict;

-(NSData*) toNSData;

@end
