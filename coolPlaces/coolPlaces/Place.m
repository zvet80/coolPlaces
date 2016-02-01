//
//  Place.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "Place.h"

@implementation Place

-(instancetype)initWithName: (NSString*) name{
    return [[Place alloc] initWithName:name description:nil andImage:nil];
}

-(instancetype)initWithName: (NSString*) name
             andDescription: (NSString*) description{
    return [[Place alloc] initWithName:name description:description andImage:nil];
}

-(instancetype)initWithName: (NSString*) name
                description: (NSString*) description
                   andImage: (NSString*) image{
    if (self=[super init]) {
        self.placeName = name;
        self.description=description;
        self.image=image;
    }
    
    return self;
}

+(Place*)placeWithName: (NSString*) name{
    return [[Place alloc] initWithName:name];
}

+(Place*)placeWithName: (NSString*) name
        andDescription: (NSString*) description{
    return [[Place alloc] initWithName:name andDescription:description];
}

+(Place*)placeWithName: (NSString*) name
           description: (NSString*) description
              andImage: (NSString*) image{
    return [[Place alloc] initWithName:name description:description andImage:image];
}

+(Place*) placeWithDict: (NSDictionary*) dict{
    return [Place placeWithName: [dict objectForKey:@"name"]
                 andDescription:[dict objectForKey:@"description"]];
}

-(NSData*) toNSData{
    NSDictionary *dict = @{
                           @"name":self.placeName,
                           @"description":self.description
                           };
    
    return [NSJSONSerialization dataWithJSONObject:dict
                                           options:NSJSONWritingPrettyPrinted
                                             error:nil];
}

@end
