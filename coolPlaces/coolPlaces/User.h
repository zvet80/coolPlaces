//
//  User.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong,nonatomic) NSString *name;

@property (strong,nonatomic) NSString *password;

@property (strong,nonatomic) NSMutableArray *myPlaces;

@property (strong,nonatomic) NSMutableArray *myComments;

-(instancetype)initWithName: (NSString*) name
                andPassword: (NSString*) password;

+(User*)userWithName: (NSString*) name
         andPassword: (NSString*) password;



@end
