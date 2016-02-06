//
//  PlaceService.h
//  coolPlaces
//
//  Created by z on 2/5/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"

@interface PlaceService : NSObject

extern NSMutableArray* places;

+(NSMutableArray*) getAllPlaces;

-(NSMutableArray*) getAllPlacesOrderedByRatingDesc;

-(NSMutableArray*) getAllPlacesOrderedByDateDesc;

-(Place*) getPlaceWithId: (NSString*) placeId;

-(void) savePlace: (Place*) place;

-(void) addCommentToAPlaceWithId:(NSString*) placeId;

-(void) addRatingToAPlaceWithId:(NSString*) placeId;

@end
