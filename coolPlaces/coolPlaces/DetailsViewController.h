//
//  DetailsViewController.h
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"

@interface DetailsViewController : UIViewController

@property (weak,nonatomic) Place *selectedPlace;
@property (weak, nonatomic) IBOutlet UILabel *textViewTitle;
@property (weak, nonatomic) IBOutlet UILabel *textViewPlace;
@property (weak, nonatomic) IBOutlet UITextView *textViewDescription;
@property (weak, nonatomic) IBOutlet UITextView *textViewComment;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
