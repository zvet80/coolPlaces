//
//  RegisterViewController.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>
#import "MainViewController.h"
#import "Validator.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerTab:(UIButton *)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *confirmedPassword = self.confirmTextField.text;
    
    Boolean isValidUsername=[Validator validateUsername:username];
    Boolean isValidPassword=[Validator validatePassword:password];
    Boolean isPasswordConfirmed=[Validator validatePassword:password withConfirmedPassword:confirmedPassword];
    
    if (!isValidUsername){
        return;
    }else if(!isValidPassword){
        return;
    }else if (!isPasswordConfirmed){
        return;
    }else{
        
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (!error) {
                [Validator showMessageWithTitle:@"Success!" andMessage:@"You are registered!"];
                
                [self navigateToMain];
                
            }else{
                [Validator showMessageWithTitle:@"Invalid!" andMessage:@"User already exists!"];
                return;
            }
        }];
    }
}

-(void) navigateToMain{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainVC = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    [self presentViewController:mainVC animated:YES completion:nil];
}
@end
