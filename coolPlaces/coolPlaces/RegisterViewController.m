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
    NSString *confirmPassword = self.confirmTextField.text;
    
    if (password!=confirmPassword) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid!" message:@"Password not confirmed!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }else if (username.length<3){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid!" message:@"Username must be longer than 3 letters!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }else if (password.length<3){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid!" message:@"Password must be longer than 3 letters!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }else{
    
    PFUser *user = [PFUser user];
    user.username = username;
    user.password = password;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"succes");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"You are registered!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            MainViewController *mainVC = [storyboard instantiateViewControllerWithIdentifier:@"Main"];
            [self presentViewController:mainVC animated:YES completion:nil];
            
            
        }else{
            NSLog(@"error");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid!" message:@"User already exists!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return;
        }
    }];
    }

}
@end
