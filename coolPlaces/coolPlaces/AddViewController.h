//
//  AddViewController.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *textFieldPlaceName;
@property (weak, nonatomic) IBOutlet UITextView *textFieldDescription;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLocation;
@property (weak, nonatomic) IBOutlet UIButton *buttonSavePlace;
- (IBAction)onButtonTapSave:(id)sender;

@end
