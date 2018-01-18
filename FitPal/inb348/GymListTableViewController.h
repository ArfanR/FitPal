//
//  GymListTableViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import "GymListTableViewCell.h"
#import "RouteViewController.h"

@interface GymListTableViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *gymList;
@property (strong,nonatomic) NSMutableArray *myArray;
@property (strong,nonatomic) NSMutableArray *gymDistance;
@property (strong,nonatomic) NSNumber *testDistance;
@property (nonatomic,assign) NSUInteger *selectedRow;
- (IBAction)btnTest:(id)sender;
@end
