//
//  testMapViewController.m
//  inb348
//
//  Created by Clement Chwin Chiat Ng on 25/10/2014.
//  Copyright (c) 2014 Dongmin Lee. All rights reserved.
//

#import "testMapViewController.h"

@interface testMapViewController ()
@property (strong,nonatomic)CLLocationManager *locationManager;
@end
double currentLat, currentLng;
@implementation testMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addArc
{
    CLLocationCoordinate2D loc1 = {locationCoordinate.latitude, locationCoordinate.longitude};
    CLLocationCoordinate2D loc2 = {-27.477488,153.028461};
    CLLocationCoordinate2D pointsArc[] = {loc1,loc2};
    MKGeodesicPolyline *geodesic;
    geodesic = [MKGeodesicPolyline polylineWithCoordinates:&pointsArc[0] count:2];
    [self.mapView addOverlay:geodesic];
}


//CURRENT LOCATION CODE
-(void)startUpdatingCurrentLocation
{
    if(!self.locationManager)
    {
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        self.locationManager.distanceFilter=2;
    }
    [self.locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
   // NSDate *eventDate = location.timestamp;
    // NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    NSLog(@"%@ location",location);
    //    currentLat = location.coordinate.latitude;
    ////    currentLng = location.coordinate.longitude;
    locationCoordinate = location.coordinate;
    
    [self updateLocationView];
    [self stopUpdatingCurrentLocation];
}

-(void)stopUpdatingCurrentLocation
{
    [self.locationManager stopUpdatingLocation];
}

-(void)updateLocationView
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = locationCoordinate.latitude;
    zoomLocation.longitude = locationCoordinate.longitude;
    
    
    //
    NSLog(@"CURRENT LAT %f",locationCoordinate.latitude);
    NSLog(@"CURRENT LNG %f",locationCoordinate.longitude);
    //
    //    //DEFAULT POSITION
    //    //zoomLocation.latitude = -27.476015;
    //    //zoomLocation.longitude = 153.028457;
    //
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 500, 500);
    [self.mapView setRegion:viewRegion animated:YES];
    [self.mapView regionThatFits:viewRegion];
    [self zoomToLocation];
    
    CLLocationCoordinate2D loc1 = {locationCoordinate.latitude, locationCoordinate.longitude};
    CLLocationCoordinate2D loc2 = {-27.477488,153.028461};
    CLLocationCoordinate2D pointsArc[] = {loc1,loc2};
    MKGeodesicPolyline *geodesic;
    geodesic = [MKGeodesicPolyline polylineWithCoordinates:&pointsArc[0] count:2];
    [self.mapView addOverlay:geodesic];
}

- (void)zoomToLocation
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = locationCoordinate.latitude;
    zoomLocation.longitude = locationCoordinate.longitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,800,800);
    [self.mapView setRegion:viewRegion animated:YES];
    [self.mapView regionThatFits:viewRegion];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
