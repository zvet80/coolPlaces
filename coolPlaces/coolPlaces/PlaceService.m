//
//  PlaceService.m
//  coolPlaces
//
//  Created by z on 2/5/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "PlaceService.h"

@implementation PlaceService

-(NSMutableArray*) getAllPlaces{
    //NSMutableArray *result;
    PFQuery *query = [PFQuery queryWithClassName:[Place parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
//        [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            Place *place = obj;
//        }];
        //return objects;
        //[result addObjectsFromArray:objects];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.result=[[NSMutableArray alloc]initWithArray:objects copyItems:YES];
        });
        
        //return result;
    }];
    
    return self.result;
}

-(NSMutableArray*) getAllPlacesOrderedByRatingDesc{
    NSMutableArray *result;
    PFQuery *query = [PFQuery queryWithClassName:[Place parseClassName]];
    [query orderByDescending:@"ratings"];
    
    return result;
}

-(NSMutableArray*) getAllPlacesOrderedByDateDesc{
    NSMutableArray *result;
    PFQuery *query = [PFQuery queryWithClassName:[Place parseClassName]];
    [query orderByDescending:@"createdAt"];
    
    return result;
}

//-(Place*) getPlaceWithId: (NSString*) placeId{
//    PFQuery *query = [PFQuery queryWithClassName:[Place parseClassName]];
//    [query whereKey:@"id" equalTo: placeId];
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject * _Nullable object, NSError * _Nullable error) {
//        if (!object) {
//            NSLog(@"object not found");
//        }else{
//            NSLog(@"object found");
//            return object;
//        }
//    }]
//    //eturn query fin
//}

-(void) savePlace: (Place*) place{
    
}

-(void) addCommentToAPlaceWithId:(NSString*) placeId{
    
}

-(void) addRatingToAPlaceWithId:(NSString*) placeId{
    
}

@end
