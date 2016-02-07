//
//  MapViewController.m
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController{
    LocationProvider *locationProvider;
}

@synthesize mapView=_mapView;

- (void)viewDidLoad {
    [super viewDidLoad];  
//    locationProvider = [[LocationProvider alloc] init];
//    [locationProvider start];
    //self.mapView = [[MKMapView alloc] init];
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setDelegate:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeMap:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            _mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            _mapView.mapType = MKMapTypeHybrid;
            break;

            
        default:
            break;
    }
}

#pragma mark - MKMapViewDelegate Methods

-(void)mapView:(MKMapView*)mapView didUpdateUserLocation:(nonnull MKUserLocation *)userLocation{
    [self.mapView setRegion:MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.1f, 0.1f)) animated:YES];
}
@end
