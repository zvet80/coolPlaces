//
//  Validator.m
//  coolPlaces
//
//  Created by z on 2/4/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "Validator.h"

@implementation Validator

int const MIN_USERNAME_LENGTH = 3;

+(BOOL) validateUsername:(NSString*) username{
    if (username.length<MIN_USERNAME_LENGTH){
        [Validator showMessageWithTitle:@"Invalid!" andMessage:@"Username must be longer than 3 letters!"];
                return false;
    }
    
    return true;
}
    
+(BOOL) validatePassword:(NSString*) password{
    if (password.length<MIN_USERNAME_LENGTH){
        [Validator showMessageWithTitle:@"Invalid!" andMessage:@"Password must be longer than 3 letters!"];
        return false;
    }
    
    return true;
}

+(BOOL) validatePassword:(NSString*) password withConfirmedPassword:(NSString*) confirmedPassword{
    if (password!=confirmedPassword) {
        [Validator showMessageWithTitle:@"Invalid!" andMessage:@"Password not confirmed!"];
        return false;
    }
    
    return  true;
}

+(void) showMessageWithTitle:(NSString*) title andMessage:(NSString*) message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}

@end

