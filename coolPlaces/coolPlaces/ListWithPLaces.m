//
//  ListWithPLaces.m
//  coolPlaces
//
//  Created by z on 2/5/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "ListWithPLaces.h"
#import "Place.h"

@implementation ListWithPLaces

 NSMutableArray *places;

+(void)seedPlaces{
    Place *place1 = [Place placeWithName:@"nice" description:@"very nice" location:nil image:nil ratings:nil andComments:nil];
    Place *place2=[Place placeWithName:@"cool" andDescription:@"very cool"];
}
@end
