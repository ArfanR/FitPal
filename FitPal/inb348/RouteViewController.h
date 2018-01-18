//
//  RouteViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "GymListTableViewCell.h"

@interface RouteViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationCoordinate2D locationCoordinate;
}
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,assign) NSUInteger *rowNumber;
@property (nonatomic,assign) NSString *rowTitle;
@end
