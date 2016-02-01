//
//  User.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name = _name;

-(instancetype) initWithName:(NSString *)name andPassword:(NSString *)password{
    if (self=[super init]) {
        self.name = name;
        self.password = password;
        //self.myPlaces = [NSMutableArray arrayWithArray:myPlaces];
    }
    
    return self;
}

+(User*)userWithName:(NSString *)name andPassword:(NSString *)password{
    return [[User alloc] initWithName:name andPassword:password];
}

-(NSString *)name{
    return _name;
}

-(void)setName:(NSString *)name{
    //validation
    _name = name;
}

@end
