//
//  MainViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface MainViewController : UIViewController <UIPageViewControllerDataSource>
- (IBAction)startWalkthrough:(id)sender;
@property (strong,nonatomic) UIPageViewController *pageViewController;
@property (strong,nonatomic) NSArray *pageTitles;
@property (strong,nonatomic) NSArray *pageImages;
@end
