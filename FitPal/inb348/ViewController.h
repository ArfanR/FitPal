//
//  ViewController.h
//  Arfan Rehab

#import <UIKit/UIKit.h>
#import "Exercises.h"
#import "IntroductionViewContoller.h"
#import "ExerciseTableViewCell.h"
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UITableViewController<UIAlertViewDelegate, FBLoginViewDelegate>

@property NSMutableArray *exercise;
@property Exercises *selectedExercise;
@property (nonatomic) NSNumber *userID;
@property (nonatomic) NSString *userName;
//@property NSArray *array;
@property NSString *string;
@property NSString *stringRandom;
//@property NSArray *selectedWorkout;
@end
