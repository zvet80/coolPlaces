//
//  MapViewController.swift
//  coolPlaces
//
//  Created by z on 2/6/16.
//  Copyright © 2016 z. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    let AnnotationViewReuseIdentifier = "place"
    @IBOutlet weak var mapView: MKMapView!
    
    let annotation = MKPointAnnotation()
    var locationManager = CLLocationManager()
    var userLocationParse = PFGeoPoint(latitude: 0, longitude: 0);
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        displayMarkers()
        
    }
    
    func displayMarkers() -> Void {
        
        let annotationQuery = PFQuery(className: Place.parseClassName())
        annotationQuery.whereKey("location", nearGeoPoint: userLocationParse)
        annotationQuery.limit = 30
        
        //let nearPlaces = annotationQuery.findObjects()
        annotationQuery.findObjectsInBackgroundWithBlock { (places, error) -> Void in
            if error == nil{
                let nearPlaces = places! as [PFObject]
                for place in nearPlaces{
                    
                    let placeAnnotation = MKPointAnnotation()
                    let point = place["location"] as! PFGeoPoint
                    let pointName = place["placeName"] as! String
                    
                    let annotationLocation = CLLocationCoordinate2DMake(point.latitude, point.longitude)
                    
                    placeAnnotation.coordinate = annotationLocation
                    placeAnnotation.title = pointName
                    
                    self.mapView.addAnnotation(placeAnnotation)
                }
            }else {
                print("Error:" + (error?.localizedDescription)!)
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta:3,longitudeDelta: 3))
        self.mapView.setRegion(region, animated: true)
        //self.locationManager.stopUpdatingLocation()
        
        
        let myLat = location!.coordinate.latitude
        let myLong = location!.coordinate.longitude
        userLocationParse=PFGeoPoint(latitude: myLat, longitude: myLong)
        
        let myAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2D(latitude: myLat, longitude: myLong)
        myAnnotation.title = "You are here!"
        mapView.addAnnotation(myAnnotation)
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error swift:" + error.localizedDescription)
    }
    
    func clearAnnotations(){
        if mapView?.annotations != nil {
            mapView.removeAnnotations(mapView.annotations as [MKAnnotation])
        }
    }
    
    func handlePoints(annotationstoShow:[MKAnnotation]){
        mapView.addAnnotations(annotationstoShow)
        mapView.showAnnotations(annotationstoShow, animated: true)
    }
    
    func mapView(mapView:MKMapView,didSelectAnnotationView view:MKAnnotationView){
        
    }
    
    func mapView(mapView:MKMapView, viewForAnnotation:MKAnnotation) -> MKAnnotationView?{
        
        var view = mapView.dequeueReusableAnnotationViewWithIdentifier(AnnotationViewReuseIdentifier)
        if view == nil{
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: AnnotationViewReuseIdentifier)
            view!.canShowCallout = true
        } else {
            view!.annotation = annotation
        }
        
        //view!.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton
        return view
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegueWithIdentifier("showDetail", sender: view)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showdetail"{
            if let place = (sender as? MKAnnotationView)?.annotation as? Place{
                if let ivc = segue.destinationViewController as? DetailsViewController{
                    ivc.textViewTitle?.text = place.placeName
                }
            }
        }
    }
    
    @IBAction func changeMapType(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapView.mapType = MKMapType.Standard
        case 1:
            self.mapView.mapType = MKMapType.Satellite
        case 2:
            self.mapView.mapType = MKMapType.Hybrid
        default: self.mapView.mapType = MKMapType.Standard
        }
    }    
}
