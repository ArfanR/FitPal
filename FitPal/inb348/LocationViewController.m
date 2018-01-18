//
//  LocationViewController.m
//  Arfan Rehab

#import "LocationViewController.h"
#import "MapViewAnnotation.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

//GLOBAL VARIABLE LAT AND LNG
double currentLat, currentLng;

@synthesize mapView;

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
    [self startUpdatingCurrentLocation];
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startUpdatingCurrentLocation
{
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startMonitoringSignificantLocationChanges];
        [self.locationManager startUpdatingLocation];
    }
}

- (void)zoomToLocation
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = locationCoordinate.latitude;
    zoomLocation.longitude = locationCoordinate.longitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,1500,1500);
    [self.mapView setRegion:viewRegion animated:YES];
    [self.mapView regionThatFits:viewRegion];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    locationCoordinate = newLocation.coordinate;
    
    if (self.startPoint == nil) {
        self.startPoint = newLocation;
        self.distanceFromStart = 0;
    } else {
        self.distanceFromStart = [newLocation distanceFromLocation:self.startPoint];
    }
    
    [self updateLocationView];
    [self stopUpdatingCurrentLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSString *errorType = nil;
    if (error.code == kCLErrorDenied)
        errorType = @"Access Denied";
    else
        errorType = @"Unknown Error";
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error getting Location"
                          message:errorType
                          delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles:nil];
    [alert show];
}

-(void)stopUpdatingCurrentLocation
{
    [self.locationManager stopUpdatingLocation];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //YOUR CURRENT POSITION CODE IS HERE
    //REMEMBER TO GET THE LAT AND LNG
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 1500, 1500);
    [self.mapView setRegion:[self.mapView regionThatFits:region]animated:YES];
    
    //ADDING ANNOTATION
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = userLocation.coordinate;
    
    //CURRENT USER LAT AND LNG
    currentLat = userLocation.coordinate.latitude;
    currentLng = userLocation.coordinate.longitude;

    point.title = @"Current Position";
    point.subtitle = @"You're here";
    
    [self.mapView removeAnnotations:mapView.annotations];
    [self createAnnotations];
    [self.mapView addAnnotation:point];
}

-(void)createAnnotations
{
    //Read locations details from plist
    NSString *path = [[NSBundle mainBundle]pathForResource:@"location" ofType:@"plist"];
    NSArray *locations = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *row in locations) {
        NSNumber *latitude = [row objectForKey:@"latitude"];
        NSNumber *longitude = [row objectForKey:@"longitude"];
        NSString *title = [row objectForKey:@"title"];
        //Create coordinates from the latitude and longitude values
        CLLocationCoordinate2D coord;
        coord.latitude = latitude.doubleValue;
        coord.longitude = longitude.doubleValue;
        MapViewAnnotation *annotation = [[MapViewAnnotation alloc] initWithTitle:title AndCoordinate:coord];
        [self.mapView addAnnotation:annotation];
    }
}

-(void)updateLocationView
{
    CLLocationCoordinate2D zoomLocation;
    //CURRENT POSITION
    zoomLocation.latitude = locationCoordinate.latitude;
    zoomLocation.longitude = locationCoordinate.longitude;
    
    NSLog(@"CURRENT LAT %f",locationCoordinate.latitude);
    NSLog(@"CURRENT LNG %f",locationCoordinate.longitude);
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1500, 1500);
    [self.mapView setRegion:viewRegion animated:YES];
    [self.mapView regionThatFits:viewRegion];
    
    CLLocation *location1 = [[CLLocation alloc]initWithLatitude:zoomLocation.latitude longitude:zoomLocation.longitude];
    CLLocation *location2 = [[CLLocation alloc]initWithLatitude:34.048929 longitude:-118.261614];
    CLLocation *location3 = [[CLLocation alloc]initWithLatitude:34.051774 longitude:-118.255182];
    CLLocation *location4 = [[CLLocation alloc]initWithLatitude:34.047758 longitude:-118.338586];
    CLLocation *location5 = [[CLLocation alloc]initWithLatitude:34.097511 longitude:-118.365181];
    CLLocation *location6 = [[CLLocation alloc]initWithLatitude:34.116171 longitude:-118.157313];
    
    //DISTANCE BETWEEN DEFAULT LOCATION AND QUT HEALTHSTREAM iN METERS
    NSLog(@"Distance between these two coordinates: %f",[location1 distanceFromLocation:location2]);
    NSInteger distance1 = [location1 distanceFromLocation:location2];
    NSInteger distance2 = [location1 distanceFromLocation:location3];
    NSInteger distance3 = [location1 distanceFromLocation:location4];
    NSInteger distance4 = [location1 distanceFromLocation:location5];
    NSInteger distance5 = [location1 distanceFromLocation:location6];

    //CREATING DISTANCEOBJECT CAUSE PLIST ONLY ACCEPTS NSNUMBER INSTEAD OF NSINTEGER
    NSNumber *distanceObject1 = [NSNumber numberWithInteger:distance1];
    NSNumber *distanceObject2 = [NSNumber numberWithInteger:distance2];
    NSNumber *distanceObject3 = [NSNumber numberWithInteger:distance3];
    NSNumber *distanceObject4 = [NSNumber numberWithInteger:distance4];
    NSNumber *distanceObject5 = [NSNumber numberWithInteger:distance5];
    
    //LOCATION OF PLIST
    NSString *path = [[NSBundle mainBundle]pathForResource:@"location" ofType:@"plist"];
    //CREATE ARRAY WITH CONTENTS OF PLIST
    NSMutableArray *plistArray = [[NSMutableArray alloc] initWithContentsOfFile: path];
    NSLog(@"plistArray before additon: %@", plistArray);
    for (NSMutableDictionary *dict in plistArray)
    {
        if ([[dict objectForKey:@"title"] isEqualToString:@"Gold's Gym"])
            [dict setObject:distanceObject1 forKey:@"distance"];
        if ([[dict objectForKey:@"title"]isEqualToString:@"Equinox"])
            [dict setObject:distanceObject2 forKey:@"distance"];
        if ([[dict objectForKey:@"title"]isEqualToString:@"Planet Fitness"])
            [dict setObject:distanceObject3 forKey:@"distance"];
        if ([[dict objectForKey:@"title"]isEqualToString:@"Crunch Fitness"])
            [dict setObject:distanceObject4 forKey:@"distance"];
        if ([[dict objectForKey:@"title"]isEqualToString:@"Snap Fitness"])
            [dict setObject:distanceObject5 forKey:@"distance"];
    }
    
    NSLog(@"plistArray after additon : %@", plistArray);
    [plistArray writeToFile:path atomically:YES];
    [self zoomToLocation];
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
- (IBAction)returnCurrent:(id)sender {
    CLLocationCoordinate2D zoomCurrent;
    zoomCurrent.latitude = locationCoordinate.latitude;
    zoomCurrent.longitude = locationCoordinate.longitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomCurrent, 1500, 1500);
    [self.mapView setRegion:viewRegion];
    [self.mapView regionThatFits:viewRegion];
}

@end
