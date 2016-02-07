//
//  MapViewController.h
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationProvider.h"
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)changeMap:(UISegmentedControl *)sender;

@end