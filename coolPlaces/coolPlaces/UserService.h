//
//  UserService.h
//  coolPlaces
//
//  Created by z on 2/5/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface UserService : NSObject

-(void) registerUserWithName: (NSString*) username andPassword:(NSString*) password;

-(void) loginUserWithName: (NSString*) username andPassword:(NSString*) password;

-(PFUser*) getUserProfile:(PFUser*) currentUser;

@end
