//
//  AddViewController.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    UIImage * image;
}



@property (weak, nonatomic) IBOutlet UITextField *textFieldPlaceName;
@property (weak, nonatomic) IBOutlet UITextView *textFieldDescription;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLocation;
@property (weak, nonatomic) IBOutlet UIButton *buttonSavePlace;

@property (weak, nonatomic) IBOutlet UIButton *takePicButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)loadPhoto:(UIButton *)sender;

- (IBAction)onButtonTapSave:(id)sender;

@end
