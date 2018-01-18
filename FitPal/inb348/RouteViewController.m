//
//  RouteViewController.m
//  Arfan Rehab

#import "RouteViewController.h"

@interface RouteViewController ()
@end
double currentLat, currentLng;

@implementation RouteViewController

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
    [self zoomToLocation];
    [self startUpdatingCurrentLocation];
   
    if([self.rowTitle isEqualToString:@"Gold's Gym"])
    {
        CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(34.048929,-118.261614);
        MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
        MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
        
        [self find:_srcItem];
        MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
        point.coordinate = _srcCoord;
        point.title = @"Gold's Gym";
        [self.mapView addAnnotation:point];
        [self.mapView setDelegate:self];
    }
    else if ([self.rowTitle isEqualToString:@"Equinox"])
    {
        CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(34.051774,-118.255182);
        MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
        MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
        
        [self find:_srcItem];
        MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
        point.coordinate = _srcCoord;
        point.title = @"Equinox";
        [self.mapView addAnnotation:point];
        [self.mapView setDelegate:self];
    }
    else if ([self.rowTitle isEqualToString:@"Planet Fitness"])
    {
        CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(34.047758,-118.338586);
        MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
        MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
        
        [self find:_srcItem];
        MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
        point.coordinate = _srcCoord;
        point.title = @"Planet Fitness";
        [self.mapView addAnnotation:point];
        [self.mapView setDelegate:self];
    }
    else if ([self.rowTitle isEqualToString:@"Crunch Fitness"])
    {
        CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(34.097511,-118.365181);
        MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
        MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
        
        [self find:_srcItem];
        MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
        point.coordinate = _srcCoord;
        point.title = @"Crunch Fitness";
        [self.mapView addAnnotation:point];
        [self.mapView setDelegate:self];
    }
    else if ([self.rowTitle isEqualToString:@"Snap Fitness"])
    {
        CLLocationCoordinate2D _srcCoord = CLLocationCoordinate2DMake(34.116171,-118.157313);
        MKPlacemark *_srcMark = [[MKPlacemark alloc] initWithCoordinate:_srcCoord addressDictionary:nil];
        MKMapItem *_srcItem = [[MKMapItem alloc] initWithPlacemark:_srcMark];
        
        [self find:_srcItem];
        MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
        point.coordinate = _srcCoord;
        point.title = @"Snap Fitness";
        [self.mapView addAnnotation:point];
        [self.mapView setDelegate:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)find:(MKMapItem *)destination
{
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:[MKMapItem mapItemForCurrentLocation]];
    [request setDestination:destination];
    [request setTransportType:MKDirectionsTransportTypeAny]; // This can be limited to automobile and walking directions.
    //[request setRequestsAlternateRoutes:YES]; // Gives you several route options.
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (!error) {
            for (MKRoute *route in [response routes]) {
                [self.mapView addOverlay:[route polyline] level:MKOverlayLevelAboveRoads]; // Draws the route above roads, but below labels.
                
                MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
                point.coordinate = locationCoordinate;
                point.title = @"Current Location";
                [self.mapView addAnnotation:point];
               
                // You can also get turn-by-turn steps, distance, advisory notices, ETA, etc by accessing various route properties.
            }
        }
    }];
}

- (void)findDirectionsFrom:(MKMapItem *)source
                        to:(MKMapItem *)destination
{
    //provide loading animation here
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = source;
    request.transportType = MKDirectionsTransportTypeAutomobile;
    request.destination = destination;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    //__block typeof(self) weakSelf = self;
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         //stop loading animation here
         if (error) {
             NSLog(@"Error is %@",error);
         } else {
             //do something about the response, like draw it on map
             MKRoute *route = [response.routes firstObject];
             [self.mapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
         }
     }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor orangeColor];
    renderer.lineWidth = 5.0;
    
    return renderer;
}

//CURRENT LOCATION CODE
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

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
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
    
    NSLog(@"CURRENT LAT %f",locationCoordinate.latitude);
    NSLog(@"CURRENT LNG %f",locationCoordinate.longitude);

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 500, 500);
    [self.mapView setRegion:viewRegion animated:YES];
    [self.mapView regionThatFits:viewRegion];
    [self zoomToLocation];
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
