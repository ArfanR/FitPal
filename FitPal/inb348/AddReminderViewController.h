//
//  AddReminderViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>

@interface AddReminderViewController : UIViewController <UITextFieldDelegate>
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *itemText;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end
