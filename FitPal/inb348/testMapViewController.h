//
//  testMapViewController.h
//  inb348
//
//  Created by Clement Chwin Chiat Ng on 25/10/2014.
//  Copyright (c) 2014 Dongmin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface testMapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationCoordinate2D locationCoordinate;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
