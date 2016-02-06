//
//  Place.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "Place.h"

@implementation Place
//@synthesize placeName = _placeName;
//@synthesize placeDescription = _description;
//@synthesize location = _location;
//@synthesize image = _image;
//@synthesize ratings = _ratings;
//@synthesize comments = _comments;

@dynamic placeName;
@dynamic placeDescription;
@dynamic location;
@dynamic image;
@dynamic ratings;
@dynamic comments;

-(instancetype)initWithName: (NSString*) name{
    return [[Place alloc] initWithName:name description:nil location:nil image:nil ratings:nil andComments:nil];
}

-(instancetype)initWithName: (NSString*) name
             andDescription: (NSString*) description{
    return [[Place alloc] initWithName:name description:description location:nil image:nil ratings:nil andComments:nil];
}

-(instancetype)initWithName:(NSString *)name description:(NSString *)description location:(PFGeoPoint *)location image:(PFFile *)image ratings:(NSMutableArray *)ratings andComments:(NSMutableArray *)comments{
    if (self=[super init]) {
        self.placeName = name;
        self.placeDescription=description;
        self.location=location;
        self.image=image;
        self.ratings=ratings;
        self.comments=comments;
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

+(Place*)placeWithName:(NSString *)name description:(NSString *)description location:(PFGeoPoint *)location image:(PFFile *)image ratings:(NSMutableArray *)ratings andComments:(NSMutableArray *)comments{
    return [[Place alloc] initWithName:name description:description location:location image:image ratings:ratings andComments:comments];
}

+(void)load{
    [self registerSubclass];
}

+(NSString*) parseClassName{
    return @"Place";
}

//-(NSString *)placeName{
//    return _placeName;
//}
//
//-(void)setPlaceName:(NSString *)placeName{
//    _placeName = placeName;
//}
//
//- (NSString *)placeDescription
//{
//    return _description;
//}
//
//-(void)setPlaceDescription:(NSString *)placeDescription{
//    _description = placeDescription;
//}
//
//- (NSString *)location
//{
//    return _location;
//}
//
//-(void)setLocation:(NSString *)location{
//    _location = location;
//}
//
//- (NSMutableArray *)ratings
//{
//    return _ratings;
//}
//
//-(void)setRatings:(NSMutableArray *)ratings{
//    _ratings = ratings;
//}
//
//- (NSMutableArray *)comments
//{
//    return _comments;
//}
//
//-(void)setComments:(NSMutableArray *)comments{
//    _comments = comments;
//}


//+(Place*) placeWithDict: (NSDictionary*) dict{
//    return [Place placeWithName: [dict objectForKey:@"name"]
//                 andDescription:[dict objectForKey:@"description"]];
//}
//
//-(NSData*) toNSData{
//    NSDictionary *dict = @{
//                           @"name":self.placeName,
//                           @"description":self.description
//                           };
//    
//    return [NSJSONSerialization dataWithJSONObject:dict
//                                           options:NSJSONWritingPrettyPrinted
//                                             error:nil];
//}

@end
