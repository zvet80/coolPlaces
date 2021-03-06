//
//  LocationProvider.m
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

#import "LocationProvider.h"


@interface LocationProvider()<CLLocationManagerDelegate>

@end

@implementation LocationProvider{
    CLLocationManager *locationManager;    
}

-(void)start{
    locationManager =[[CLLocationManager alloc] init];
    
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
    
    [locationManager requestAlwaysAuthorization];
    
    [locationManager startUpdatingLocation];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = [locations lastObject];
    self.clLocation=location;
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *mark = [placemarks lastObject];
        NSLog(@"objectivec %@",mark.addressDictionary);
        PFGeoPoint *geopoint = [PFGeoPoint geoPointWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
        self.parseGeopoint=geopoint;
        
        NSString *placeLocationString = mark.country;
        self.locationString = placeLocationString;    }];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
}
@end
