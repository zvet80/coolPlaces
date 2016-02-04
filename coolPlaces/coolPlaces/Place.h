//
//  Place.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Place : PFObject<PFSubclassing>


@property (strong,nonatomic) NSString *placeName;

@property (strong,nonatomic) NSString *placeDescription;

@property (strong,nonatomic) NSString *location;

@property (strong,nonatomic) PFFile *image;

@property (strong,nonatomic) NSMutableArray *ratings;

@property (strong,nonatomic) NSMutableArray *comments;

-(instancetype)initWithName: (NSString*) name;

-(instancetype)initWithName: (NSString*) name
             andDescription: (NSString*) description;

-(instancetype)initWithName: (NSString*) name
                description: (NSString*) description
                   location:(NSString*) location
                   image: (PFFile*) image
                   ratings:(NSMutableArray*)ratings
                andComments:(NSMutableArray*)comments;

+(Place*)placeWithName: (NSString*) name;

+(Place*)placeWithName: (NSString*) name
        andDescription: (NSString*) description;

+(Place*)placeWithName: (NSString*) name
                description: (NSString*) description
                   location:(NSString*) location
                      image: (PFFile*) image
                   ratings:(NSMutableArray*)ratings
                andComments:(NSMutableArray*)comments;

+(NSString*) parseClassName;


@end
