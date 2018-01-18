//
//  TodayDetailViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import "TodayWorkoutViewControllerTableViewController.h"

@interface TodayDetailViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *kgTextField;
@property (weak, nonatomic) IBOutlet UITextField *repsTextField;
@property (weak, nonatomic) IBOutlet UITextField *setsTextField;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,assign) NSString *selectedExercise;
- (IBAction)logButton:(id)sender;

@end
