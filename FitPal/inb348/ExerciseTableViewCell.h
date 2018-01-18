//
//  ExerciseTableViewCell.h
//  Arfan Rehab

#import <UIKit/UIKit.h>

@interface ExerciseTableViewCell : UITableViewCell

@property(nonatomic,weak)IBOutlet UILabel *nameStr;
@property(nonatomic,weak)IBOutlet UILabel *instructionStr;
@property(nonatomic,weak)IBOutlet UIImageView *coverImageView;

@end
