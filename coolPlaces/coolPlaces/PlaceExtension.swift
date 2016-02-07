//
//  PlaceExtension.swift
//  coolPlaces
//
//  Created by z on 2/7/16.
//  Copyright © 2016 z. All rights reserved.
//

import MapKit

extension Place: MKAnnotation{
    
    public var coordinate: CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
    
    public var title: String! {
        return placeName
    }
    
//    var subtitle: String! {
//        return ratings
//    }
    
    
}
