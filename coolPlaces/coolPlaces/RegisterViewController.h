//
//  RegisterViewController.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "coolPlaces-Bridging-Header.h"

@class RegisterViewController;

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextField;
- (IBAction)registerTab:(UIButton *)sender;

//-(void)prova:(RegisterViewController*) registerViewController;

@end
