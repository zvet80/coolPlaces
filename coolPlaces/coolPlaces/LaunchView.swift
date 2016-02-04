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
                NSLog("user logedin");
                let  alert = UIAlertView(title:"Success",message: "You are logged in!",delegate: self,cancelButtonTitle: "OK")
                alert.show()
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let viewController:UIViewController=UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("Main") 
                self.presentViewController(viewController, animated: true, completion: nil)
                })
            }
            else{
                let  alert = UIAlertView(title:"Invalid",message: "Invalid username or password",delegate: self,cancelButtonTitle: "OK")
                alert.show()
            }
        })

    }
    
    @IBAction func newUserButtonTap(sender: UIButton) {
        let storyBoard: UIStoryboard=UIStoryboard(name:"Main",bundle:nil)
        let navigatedTo = storyBoard.instantiateViewControllerWithIdentifier("RegisterViewController") 
        self.presentViewController(navigatedTo, animated: true, completion: nil)
    }
}
