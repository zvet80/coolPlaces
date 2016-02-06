//
//  MapViewController.m
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "MapViewController.h"
#import "Validator.h"

@interface MapViewController ()

@end

@implementation MapViewController{
    LocationProvider *locationProvider;
}

- (void)viewDidLoad {
    [super viewDidLoad];  
    locationProvider = [[LocationProvider alloc] init];
    [locationProvider start];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
