//
//  Validator.h
//  coolPlaces
//
//  Created by z on 2/4/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Validator : NSObject
extern int const MIN_USERNAME_LENGTH;

+(BOOL) validateUsername:(NSString*) username;

+(BOOL) validatePassword:(NSString*) password;

+(BOOL) validatePassword:(NSString*) password withConfirmedPassword:(NSString*) confirmedPassword;

+(void) showMessageWithTitle:(NSString*) title andMessage:(NSString*) message;
@end
