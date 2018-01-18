//
//  TodayWorkoutViewControllerTableViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <Social/Social.h>
#import "TodayDetailViewController.h"

@interface TodayWorkoutViewControllerTableViewController : UITableViewController
@property (nonatomic,strong) NSMutableArray *exerciseHistory;
- (IBAction)postTwitter:(id)sender;
- (IBAction)postFacebook:(id)sender;
@end
