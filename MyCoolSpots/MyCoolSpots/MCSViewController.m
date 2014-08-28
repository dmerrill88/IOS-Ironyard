//
//  MCSViewController.m
//  MyCoolSpots
//
//  Created by Heidi Proske on 8/18/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

#import "MCSViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MCSAnnotation.h"


@interface MCSViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MCSViewController
{
    MKMapView * myMapView;
    CLLocationManager * locationMngr;
    MKMapCamera * mapCamera;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myMapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    myMapView.delegate = self;
    [self.view addSubview:myMapView];
    myMapView.showsUserLocation = YES;
    myMapView.delegate = self;
//    mapView.userTrackingMode = YES;

    locationMngr = [[CLLocationManager alloc] init];
    locationMngr.delegate = self;
    [locationMngr startUpdatingLocation]; //Prompts user that app would like to use their location
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation* location in locations)
    {
        NSLog(@"%f, %f", location.coordinate.latitude, location.coordinate.longitude);
        
        //call ForSquareRequest and create annotations for each venue
        
        //
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        [myMapView setRegion:region animated:YES];
        
        for (int i = 0; i < 10; i++)
        {
            
            MCSAnnotation * annotation = [[MCSAnnotation alloc] init];
            
            float randomLat = (arc4random_uniform(100) - 50.0) / 100 + location.coordinate.latitude;
            
            float randomLong = (arc4random_uniform(100) - 50.0) / 100 + location.coordinate.longitude;
            
            CLLocationCoordinate2D  randomCoordinate = CLLocationCoordinate2DMake(randomLat, randomLong);
            
            
            CLLocation *  randomLocation = [[CLLocation alloc] initWithLatitude:randomCoordinate.latitude longitude:randomCoordinate.longitude];
            
            CLGeocoder * geoCoder = [[CLGeocoder alloc] init];

            
          
            
            [annotation setCoordinate:randomCoordinate];
            
            
            [geoCoder reverseGeocodeLocation:randomLocation completionHandler:^(NSArray *placemarks, NSError *error) {
                
                for (CLPlacemark * placemark in placemarks)
                {
                  //  NSLog(@"%@", placemark.addressDictionary);
                    
                    
                    [annotation setTitle:placemark.addressDictionary[@"City"]];
                    
                }
                
                
            }];
            
            [annotation setTitle:@"Title"];
            
            [myMapView addAnnotation: annotation];
            
            
        }
        
        
    }
    
    [locationMngr stopUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
   
    MCSAnnotation * ann = annotation;
    
    if  (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
    {

    
    
    
    } else {
        
        MKPinAnnotationView * annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        
        annotationView.draggable = YES;
        
        
        NSArray * markers = @[
                              
                             [UIImage imageNamed:@"magentaPin"],
                             [UIImage imageNamed:@"bluePin"],
                             [UIImage imageNamed:@"greenPin"]
                             ];
        
        
        
        int randomMarker = arc4random_uniform((int)markers.count);
        
        annotationView.image = markers[randomMarker];
        
        annotationView.canShowCallout = YES;
        
        
        UIButton * rightCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        [rightCallout addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];
        
        
        annotationView.rightCalloutAccessoryView = rightCallout;
        
        
        return annotationView;
        
    }
    
    return nil;
  
}
 - (void)showDetailVC
{
    UIViewController * detailvc = [[UIViewController alloc] init];
    detailvc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:detailvc animated:YES];
    
}

@end
