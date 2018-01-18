//
//  IntroductionViewContoller.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import "Exercises.h"

@interface IntroductionViewContoller : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *coverView;
@property (weak, nonatomic) IBOutlet UITextView *instructionTextView;

@property Exercises *selectedExercise;
@property NSArray *array;
@property NSString *string;
@end
