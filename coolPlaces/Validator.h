//
//  Validator.h
//  coolPlaces
//
//  Created by z on 2/4/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject

-(void) validateUsername;
-(void) validatePassword;
-(void) showMessageWithTitle:(NSString*) title andMessage:(NSString*) message;
@end
