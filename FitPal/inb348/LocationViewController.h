//
//  LocationViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationCoordinate2D locationCoordinate;
}
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *startPoint;
@property (assign, nonatomic) CLLocationDistance distanceFromStart;
@property (strong,nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)returnCurrent:(id)sender;

@end
