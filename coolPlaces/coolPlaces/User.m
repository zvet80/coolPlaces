//
//  User.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize username = _username;
@synthesize password = _password;
@synthesize myPlaces = _myPlaces;
@synthesize myComments = _myComments;

-(instancetype) initWithName:(NSString *)username andPassword:(NSString *)password{
    if (self=[super init]) {
        self.username = username;
        self.password = password;
        //self.myPlaces = [NSMutableArray arrayWithArray:myPlaces];
    }
    
    return self;
}

+(User*)userWithName:(NSString *)username andPassword:(NSString *)password{
    return [[User alloc] initWithName:username andPassword:password];
}

-(NSString *)username{
    return _username;
}

-(void)setName:(NSString *)username{
    //validation
    _username = username;
}

-(NSString *)password{
    return _password;
}

-(void)setPassword:(NSString *)password{
    //validation
    _password = password;
}

-(NSMutableArray*)myPlaces{
    return _myPlaces;
}

-(void)setMyPlaces:(NSMutableArray *)myPlaces{
    _myPlaces=myPlaces;
}

-(NSMutableArray*)myComments{
    return _myComments;
}

-(void)setMyComments:(NSMutableArray *)myComments{
    _myComments=myComments;
}



@end
