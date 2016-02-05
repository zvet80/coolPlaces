//
//  User.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User:NSObject

@property (strong,nonatomic) NSString *username;

@property (strong,nonatomic) NSString *password;

@property (strong,nonatomic) NSMutableArray *myPlaces;

@property (strong,nonatomic) NSMutableArray *myComments;

-(instancetype)initWithName: (NSString*) username
                andPassword: (NSString*) password;

+(User*)userWithName: (NSString*) username
         andPassword: (NSString*) password;

//+(NSString*) parseClassName;

@end
