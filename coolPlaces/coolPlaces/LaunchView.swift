//
//  LaunchView.swift
//  coolPlaces
//
//  Created by z on 2/2/16.
//  Copyright © 2016 z. All rights reserved.
//


import UIKit

 class LaunchView: UIViewController {
    
    
    @IBOutlet weak var usernameTextView: UITextField!

    @IBOutlet weak var passwordTextView: UITextField!
    
    override func viewDidLoad(){

        
    }
    
    @IBAction func loginTap(sender: UIButton) {
    
        let username = usernameTextView.text
        let password = passwordTextView.text
        
        PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
            
            if error == nil{
                NSLog("user logged in");
                Validator.showMessageWithTitle("Success", andMessage: "You are logged in!")
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController:UIViewController=UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("NavigationController") 
                self.presentViewController(viewController, animated: true, completion: nil)
                })
            }
            else{
                Validator.showMessageWithTitle("Invalid", andMessage: "Invalid username or password!")
            }
        })

    }
    
    @IBAction func newUserButtonTap(sender: UIButton) {
        let storyBoard: UIStoryboard=UIStoryboard(name:"Main",bundle:nil)
        let navigatedTo = storyBoard.instantiateViewControllerWithIdentifier("RegisterViewController") 
        self.presentViewController(navigatedTo, animated: true, completion: nil)
    }
}
