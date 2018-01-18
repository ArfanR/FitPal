//
//  MapViewAnnotation.m
//  Arfan Rehab

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation
@synthesize coordinate=_coordinate;
@synthesize title=_title;
-(id) initWithTitle:(NSString *) title AndCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    _title = title;
    _coordinate = coordinate;
    return self;
}
@end
