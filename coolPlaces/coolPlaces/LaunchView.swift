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
//        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
//        backgroundImage.image = UIImage(named: "background.png")
//        self.view.insertSubview(backgroundImage, atIndex: 0)
        
    }
    
    @IBAction func loginButtonTap(sender: UIButton) {
        
    }
    
    @IBAction func newUserButtonTap(sender: UIButton) {
        let storyBoard: UIStoryboard=UIStoryboard(name:"Main",bundle:nil)
        let navigatedTo = storyBoard.instantiateViewControllerWithIdentifier("RegisterViewController") 
        self.presentViewController(navigatedTo, animated: true, completion: nil)
    }
}
