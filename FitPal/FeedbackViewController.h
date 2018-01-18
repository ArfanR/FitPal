//
//  FeedbackViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> 

@interface FeedbackViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)showEmail:(id)sender;

@end
