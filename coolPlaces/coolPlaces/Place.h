//
//  Place.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject

@property (strong,nonatomic) NSString *placeName;

@property (strong,nonatomic) NSString *description;

@property (strong,nonatomic) NSString *image;

@property (strong,nonatomic) NSMutableArray *ratings;

@property (strong,nonatomic) NSMutableArray *comments;

-(instancetype)initWithName: (NSString*) name;

-(instancetype)initWithName: (NSString*) name
             andDescription: (NSString*) description;

-(instancetype)initWithName: (NSString*) name
                description: (NSString*) description
                   andImage: (NSString*) image;

+(Place*)placeWithName: (NSString*) name;

+(Place*)placeWithName: (NSString*) name
        andDescription: (NSString*) description;

+(Place*)placeWithName: (NSString*) name
           description: (NSString*) description
              andImage: (NSString*) image;

@end
