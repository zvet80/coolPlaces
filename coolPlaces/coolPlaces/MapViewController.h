//
//  MapViewController.h
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationProvider.h"

@interface MapViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *textLongitude;
@property (weak, nonatomic) IBOutlet UITextField *textLatitude;

@end