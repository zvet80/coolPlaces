//
//  AddViewController.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "AddViewController.h"
#import "PlaceService.h"
#import "MainViewController.h"
#import "Validator.h"
#import "LocationProvider.h"

@interface AddViewController (){
    LocationProvider *locationProvider;
    UIProgressView *progressBar;
    NSTimer *timer;
}

@end

@implementation AddViewController
Place *newPlace;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationProvider = [[LocationProvider alloc] init];
    [locationProvider start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onButtonTapSave:(id)sender {
    NSString* placeName = self.textFieldPlaceName.text;
    NSString* description = self.textFieldDescription.text;
    PFGeoPoint* location = locationProvider.parseGeopoint;
    NSData* imageToSave = UIImageJPEGRepresentation(self.imageView.image,0.5f);
    if (placeName==nil|| description==nil || location==nil || imageToSave==nil) {
        [Validator showMessageWithTitle:@"Missing data" andMessage:@"All fields required"];
        
        return;
    }
    
    PFFile *imageFile = [PFFile fileWithData:imageToSave];
    
    newPlace = [Place placeWithName:placeName description:description location:location image:imageFile ratings:nil andComments:nil];
    
    [newPlace saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        [PlaceService getAllPlaces];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (error) {
                [Validator showMessageWithTitle:@"Failure" andMessage:@"Your coolPlace not saved!"];
            }else{
                [Validator showMessageWithTitle:@"Success" andMessage:@"Your coolPlace is saved!"];
            }
        });
    }];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

- (IBAction)takePhoto:(UIButton *)sender;{
    cameraPicker = [[UIImagePickerController alloc] init];
    cameraPicker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [cameraPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:cameraPicker animated:YES completion:nil];
    }else{
        [Validator showMessageWithTitle:@"Missing device" andMessage:@"Camera not available"];
    }
}

- (IBAction)loadPhoto:(UIButton *)sender {
    filePicker = [[UIImagePickerController alloc] init];
    filePicker.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        [filePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:filePicker animated:YES completion:nil];
    }else{
        [Validator showMessageWithTitle:@"Missing device" andMessage:@"Image folder not accessible"];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takeLocation:(UIButton *)sender {
    self.textFieldLocation.text = locationProvider.locationString;
}

@end
