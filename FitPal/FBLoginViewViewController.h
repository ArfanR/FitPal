//
//  FBLoginViewViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "ViewController.h"

@interface FBLoginViewViewController : UIViewController <FBLoginViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblWelcome;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;
@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *btnContinue;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@end
