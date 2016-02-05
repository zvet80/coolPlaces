//
//  AddViewController.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "AddViewController.h"
#import "Place_initWithDicts.h"
#import "Validator.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onButtonTapSave:(id)sender {
    NSString* placeName = self.textFieldPlaceName.text;
    NSString* description = self.textFieldDescription.text;
    NSString* location = self.textFieldLocation.text;
    NSData* imageToSave = UIImageJPEGRepresentation(self.imageView.image,0.5f);
    if (placeName==nil|| description==nil || location==nil || imageToSave==nil) {
        [Validator showMessageWithTitle:@"Missing data" andMessage:@"All fields required"];
        
        return;
    }
    
    PFFile *imageFile = [PFFile fileWithData:imageToSave];

    Place *place = [Place placeWithName:placeName description:description location:location image:imageFile ratings:nil andComments:nil];
    [place saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        [Validator showMessageWithTitle:@"Success" andMessage:@"Your coolPlace is saved!"];
    }];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

- (IBAction)takePhoto:(UIButton *)sender;{
    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:nil];
    //[picker release];
}

- (IBAction)loadPhoto:(UIButton *)sender {
    picker2 = [[UIImagePickerController alloc] init];
    picker2.delegate = self;
    [picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker2 animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (UIImage *)imageFromSystemBarButton:(UIBarButtonSystemItem)systemItem {
//    // Holding onto the oldItem (if any) to set it back later
//    // could use left or right, doesn't matter
//    UIBarButtonItem *oldItem = self.navigationItem.rightBarButtonItem;
//    
//    UIBarButtonItem *tempItem = [[UIBarButtonItem alloc]
//                                 initWithBarButtonSystemItem:systemItem
//                                 target:nil
//                                 action:nil];
//    
//    // Setting as our right bar button item so we can traverse its subviews
//    self.navigationItem.rightBarButtonItem = tempItem;
//    
//    // Don't know whether this is considered as PRIVATE API or not
//    UIView *itemView = (UIView *)[self.navigationItem.rightBarButtonItem performSelector:@selector(view)];
//    
//    UIImage *image = nil;
//    // Traversing the subviews to find the ImageView and getting its image
//    for (UIView *subView in itemView.subviews) {
//        if ([subView isKindOfClass:[UIImageView class]]) {
//            image = ((UIImageView *)subView).image;
//            break;
//        }
//    }
//    
//    // Setting our oldItem back since we have the image now
//    self.navigationItem.rightBarButtonItem = oldItem;
//    
//    return image;
//}
@end
//    NSString *urlStr=@"";
//
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    //NSDictionary *body = @{@"name":@".."};
//    //NSData *bodyData = [NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:nil];
//    Place *place = [Place placeWithName:@"somewhere"];
//    NSData *bodyData = [place toNSData];
//
//    [request setHTTPMethod:@"POST"];
//        [request setHTTPBody:bodyData];
//    [request addValue:@"application/json"
//   forHTTPHeaderField:@"content-type"];
//
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        if (error) {
//            NSLog(@"Error: %@",error);
//            return;
//        }
//        NSError *err;
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
//
//        NSLog(@"Data: %@",dict);
//    }]
//     resume];