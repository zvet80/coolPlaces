//
//  DetailsViewController.m
//  coolPlaces
//
//  Created by z on 2/1/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "DetailsViewController.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    [self.textViewTitle setText:self.selectedPlace.placeName];
    [self.textViewDescription setText:self.selectedPlace.placeDescription];
    PFFile *placeImage = self.selectedPlace.image;
    
    [placeImage getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        UIImage *imageToShow = [UIImage imageWithData:data];
        
        if (imageToShow==nil) {
            imageToShow = [UIImage imageNamed:@"cliff"];
        }
        
        [self.imageView setImage:imageToShow];
    }];
    
    
    CLLocationCoordinate2D placeCoordinates;
    placeCoordinates = CLLocationCoordinate2DMake(self.selectedPlace.location.latitude, self.selectedPlace.location.latitude);
   // MKCoordinateSpan span = MK
    MKCoordinateRegion region = MKCoordinateRegionMake(placeCoordinates, MKCoordinateSpanMake(0.0005, 0.0005));
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = placeCoordinates;
    [self.mapView addAnnotation:annotation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
