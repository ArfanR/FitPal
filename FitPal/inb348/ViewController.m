//
//  ViewController.m
//  Arfan Rehab

#import "ViewController.h"
#import "AppDelegate.h"
#import "FBLoginViewViewController.h"

@interface ViewController ()
{
    NSString *test;
    NSString *challenge;
    UIAlertView *testView;
    
    NSMutableArray *array;
    NSMutableArray *arrayChallenge;
    
    NSArray *exerciseFilter;
    NSArray *searchResults;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showDaily];

    _exercise = [[NSMutableArray alloc] init]; //allocate _exercise array into heap and initialise
    Exercises *exercise = [[Exercises alloc] init]; //create Exercise class object and allocate it in to heap. initialise it.
    
    //add data into exercise class object
    //=====================================================
    //                      EX 1
    //=====================================================
    exercise.name = @"Push Up";
    NSString *str1 = @"1: Lie prone on floor with hands slightly wider than shoulder width.";
    NSString *str2 = @"2: Raise body up off floor by extending arms with body straight.";
    NSString *str3 = @"3: Keeping body straight, lower body to floor by bending arms.";
    NSString *str4 = @"4: Push body up until arms are extended.";
    NSString *str5 = @"5: Repeat";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",str1,str2,str3,str4,str5];
    exercise.cover = [UIImage imageNamed:@"Pushups-1 (dragged).tiff"];
    [_exercise addObject:exercise]; //add the object to array
    exercise.animationArray = @[@"Pushups-1 (dragged).tiff", @"Pushups-2 (dragged).tiff", @"Pushups-3 (dragged).tiff", @"Pushups-4 (dragged).tiff", @"Pushups-5 (dragged).tiff", @"Pushups-6 (dragged).tiff", @"Pushups-7 (dragged).tiff", @"Pushups-8 (dragged).tiff", @"Pushups-9 (dragged).tiff", @"Pushups-10 (dragged).tiff", @"Pushups-11 (dragged).tiff", @"Pushups-12 (dragged).tiff", @"Pushups-13 (dragged).tiff", @"Pushups-14 (dragged).tiff", @"Pushups-15 (dragged).tiff", @"Pushups-16 (dragged).tiff", @"Pushups-17 (dragged).tiff"];

    
    //=====================================================
    //                      EX 2
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Sit Up";
    NSString *str6 = @"1: Hook feet under support and lie supine on floor or mat with hips and knees bent.";
    NSString *str7 = @"2: With both hands, hold plate on chest with forearms crossed or use no weight.";
    NSString *str8 = @"3: Raise torso from floor by bending waist and hips.";
    NSString *str9 = @"4: Return until back of shoulders contact with floor or mat.";
    NSString *str10 = @"5: Repeat.";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",str6,str7,str8,str9,str10];
    exercise.cover = [UIImage imageNamed:@"BWSitupNeck-1 (dragged).tiff"];
    [_exercise addObject:exercise]; // add the object to array
    exercise.animationArray = @[@"BWSitupNeck-1 (dragged).tiff", @"BWSitupNeck-2 (dragged).tiff", @"BWSitupNeck-3 (dragged).tiff", @"BWSitupNeck-4 (dragged).tiff", @"BWSitupNeck-5 (dragged).tiff", @"BWSitupNeck-6 (dragged).tiff", @"BWSitupNeck-7 (dragged).tiff", @"BWSitupNeck-8 (dragged).tiff", @"BWSitupNeck-9 (dragged).tiff", @"BWSitupNeck-10 (dragged).tiff", @"BWSitupNeck-11 (dragged).tiff", @"BWSitupNeck-12 (dragged).tiff", @"BWSitupNeck-13 (dragged).tiff", @"BWSitupNeck-14 (dragged).tiff", @"BWSitupNeck-15 (dragged).tiff", @"BWSitupNeck-16 (dragged).tiff", @"BWSitupNeck-17 (dragged).tiff", @"BWSitupNeck-18 (dragged).tiff", @"BWSitupNeck-19 (dragged).tiff", @"BWSitupNeck-20 (dragged).tiff", @"BWSitupNeck-21 (dragged).tiff", @"BWSitupNeck-22 (dragged).tiff", @"BWSitupNeck-23 (dragged).tiff", @"BWSitupNeck-24 (dragged).tiff", @"BWSitupNeck-25 (dragged).tiff", @"BWSitupNeck-26 (dragged).tiff", @"BWSitupNeck-27 (dragged).tiff", @"BWSitupNeck-28 (dragged).tiff", @"BWSitupNeck-29 (dragged).tiff", @"BWSitupNeck-30 (dragged).tiff", @"BWSitupNeck-31 (dragged).tiff", @"BWSitupNeck-32 (dragged).tiff", @"BWSitupNeck-33 (dragged).tiff", @"BWSitupNeck-34 (dragged).tiff", @"BWSitupNeck-35 (dragged).tiff", @"BWSitupNeck-36 (dragged).tiff"];    //=====================================================
    //                      EX 3
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Bench Press";
    NSString *str11 = @"1: Sit down on bench with dumbbells resting on lower thigh.";
    NSString *str12 = @"2: Kick weights to shoulder and lie back.";
    NSString *str13 = @"3: Position dumbbells to sides of chest with bent arm under each dumbbell.";
    NSString *str14 = @"4: Press dumbbells up with elbows to sides until arms are extended.";
    NSString *str15 = @"5: Lower weight to sides of upper chest until slight stretch is felt in chest or shoulder.";
    NSString *str16 = @"6: Repeat";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@",str11,str12,str13,str14,str15, str16];
    exercise.cover = [UIImage imageNamed:@"DBBenchPress-1 (dragged).tiff"];
    exercise.animationArray = @[@"DBBenchPress-1 (dragged).tiff", @"DBBenchPress-2 (dragged).tiff", @"DBBenchPress-3 (dragged).tiff", @"DBBenchPress-4 (dragged).tiff", @"DBBenchPress-5 (dragged).tiff", @"DBBenchPress-6 (dragged) 1.tiff", @"DBBenchPress-7 (dragged) 1.tiff", @"DBBenchPress-8 (dragged) 1.tiff", @"DBBenchPress-9 (dragged) 1.tiff", @"DBBenchPress-10 (dragged) 1.tiff", @"DBBenchPress-11 (dragged).tiff", @"DBBenchPress-12 (dragged).tiff", @"DBBenchPress-13 (dragged).tiff", @"DBBenchPress-14 (dragged).tiff", @"DBBenchPress-15 (dragged).tiff", @"DBBenchPress-16 (dragged).tiff", @"DBBenchPress-17 (dragged).tiff", @"DBBenchPress-18 (dragged).tiff", @"DBBenchPress-19 (dragged).tiff"];
    [_exercise addObject:exercise]; // add the object to array
    
    //=====================================================
    //                      EX 4
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Incline Bench Press";
    NSString *str17 = @"1: Lie supine on incline bench.";
    NSString *str18 = @"2: Dismount barbell from rack over upper chest using wide oblique overhand grip.";
    NSString *str19 = @"3: Lower weight to upper chest.";
    NSString *str20 = @"4: Press bar until arms are extended";
    NSString *str21 = @"5: Repeat.";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",str17,str18,str19,str20,str21];
    exercise.cover = [UIImage imageNamed:@"BBInclineBenchPress-1 (dragged).tiff"];
    exercise.animationArray = @[@"BBInclineBenchPress-1 (dragged).tiff", @"BBInclineBenchPress-2 (dragged).tiff", @"BBInclineBenchPress-3 (dragged).tiff", @"BBInclineBenchPress-4 (dragged).tiff", @"BBInclineBenchPress-5 (dragged).tiff", @"BBInclineBenchPress-6 (dragged).tiff", @"BBInclineBenchPress-7 (dragged).tiff", @"BBInclineBenchPress-8 (dragged).tiff", @"BBInclineBenchPress-9 (dragged).tiff", @"BBInclineBenchPress-10 (dragged).tiff", @"BBInclineBenchPress-11 (dragged).tiff", @"BBInclineBenchPress-12 (dragged).tiff", @"BBInclineBenchPress-13 (dragged).tiff", @"BBInclineBenchPress-14 (dragged).tiff", @"BBInclineBenchPress-15 (dragged).tiff", @"BBInclineBenchPress-16 (dragged).tiff", @"BBInclineBenchPress-17 (dragged).tiff", @"BBInclineBenchPress-18 (dragged).tiff", @"BBInclineBenchPress-19 (dragged).tiff"];

    [_exercise addObject:exercise]; // add the object to array
    
    //=====================================================
    //                      EX 5
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Decline Bench Press";
    NSString *str22 = @"1: Sit down on decline bench with feet under leg brace and dumbbells resting on thigh.";
    NSString *str23 = @"2: Lie back with barbell/dumbell.";
    NSString *str24 = @"3: Position dumbbells to sides of chest with bent arm under each dumbbell";
    NSString *str25 = @"4: Press dumbbells up with elbows to sides until arms are extended.";
    NSString *str26 = @"5: Lower weight to sides of chest until slight stretch is felt in chest or shoulder.";
    NSString *str27 = @"6: Repeat";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@",str22,str23,str24,str25,str26,str27];
    exercise.cover = [UIImage imageNamed:@"BBDeclineBenchPress-1 (dragged).tiff"];
    exercise.animationArray = @[@"BBDeclineBenchPress-1 (dragged).tiff", @"BBDeclineBenchPress-2 (dragged).tiff", @"BBDeclineBenchPress-3 (dragged).tiff", @"BBDeclineBenchPress-4 (dragged).tiff", @"BBDeclineBenchPress-5 (dragged).tiff", @"BBDeclineBenchPress-6 (dragged).tiff", @"BBDeclineBenchPress-7 (dragged).tiff", @"BBDeclineBenchPress-8 (dragged).tiff", @"BBDeclineBenchPress-9 (dragged).tiff", @"BBDeclineBenchPress-10 (dragged).tiff", @"BBDeclineBenchPress-11 (dragged).tiff", @"BBDeclineBenchPress-12 (dragged).tiff", @"BBDeclineBenchPress-13 (dragged).tiff", @"BBDeclineBenchPress-14 (dragged).tiff", @"BBDeclineBenchPress-15 (dragged).tiff", @"BBDeclineBenchPress-16 (dragged).tiff", @"BBDeclineBenchPress-17 (dragged).tiff", @"BBDeclineBenchPress-18 (dragged).tiff", @"BBDeclineBenchPress-19 (dragged).tiff", @"BBDeclineBenchPress-20 (dragged).tiff", @"BBDeclineBenchPress-21 (dragged).tiff", @"BBDeclineBenchPress-22 (dragged).tiff", @"BBDeclineBenchPress-23 (dragged).tiff"];
    [_exercise addObject:exercise]; // add the object to array
    
    //=====================================================
    //                      EX 6
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Leg Curls";
    NSString *str28 = @"1: Facing bench, stand between bench and lever pads.";
    NSString *str29 = @"2: Lie prone on bench with knees just beyond edge of bench and lower legs under lever pads.";
    NSString *str30 = @"3: Grasp handles.";
    NSString *str31 = @"4: Raise lever pad to back of thighs by flexing knees.";
    NSString *str32 = @"5: Lower lever pads until knees are straight.";
    NSString *str33 = @"6: Repeat";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@",str28,str29,str30,str31,str32,str33];
    exercise.cover = [UIImage imageNamed:@"LVLyingLegCurl-1 (dragged).tiff"];
    exercise.animationArray = @[@"LVLyingLegCurl-1 (dragged).tiff", @"LVLyingLegCurl-2 (dragged).tiff", @"LVLyingLegCurl-3 (dragged).tiff", @"LVLyingLegCurl-4 (dragged).tiff", @"LVLyingLegCurl-5 (dragged).tiff", @"LVLyingLegCurl-6 (dragged).tiff", @"LVLyingLegCurl-7 (dragged).tiff", @"LVLyingLegCurl-8 (dragged).tiff", @"LVLyingLegCurl-9 (dragged).tiff", @"LVLyingLegCurl-10 (dragged).tiff", @"LVLyingLegCurl-11 (dragged).tiff", @"LVLyingLegCurl-12 (dragged).tiff", @"LVLyingLegCurl-13 (dragged).tiff", @"LVLyingLegCurl-14 (dragged).tiff", @"LVLyingLegCurl-15 (dragged).tiff", @"LVLyingLegCurl-16 (dragged).tiff", @"LVLyingLegCurl-17 (dragged).tiff", @"LVLyingLegCurl-18 (dragged).tiff", @"LVLyingLegCurl-19 (dragged).tiff", @"LVLyingLegCurl-20 (dragged).tiff", @"LVLyingLegCurl-21 (dragged).tiff", @"LVLyingLegCurl-22 (dragged).tiff", @"LVLyingLegCurl-23 (dragged).tiff", @"LVLyingLegCurl-24 (dragged).tiff", @"LVLyingLegCurl-25 (dragged).tiff", @"LVLyingLegCurl-26 (dragged).tiff", @"LVLyingLegCurl-27 (dragged).tiff", @"LVLyingLegCurl-28 (dragged).tiff", @"LVLyingLegCurl-29 (dragged).tiff", @"LVLyingLegCurl-30 (dragged).tiff", @"LVLyingLegCurl-31 (dragged).tiff", @"LVLyingLegCurl-32 (dragged).tiff", @"LVLyingLegCurl-33 (dragged).tiff", @"LVLyingLegCurl-34 (dragged).tiff", @"LVLyingLegCurl-35 (dragged).tiff", @"LVLyingLegCurl-36 (dragged).tiff", @"LVLyingLegCurl-37 (dragged).tiff", @"LVLyingLegCurl-38 (dragged).tiff", @"LVLyingLegCurl-39 (dragged).tiff", @"LVLyingLegCurl-40 (dragged).tiff", @"LVLyingLegCurl-41 (dragged).tiff", @"LVLyingLegCurl-42 (dragged).tiff", @"LVLyingLegCurl-43 (dragged).tiff", @"LVLyingLegCurl-44 (dragged).tiff", @"LVLyingLegCurl-45 (dragged).tiff", @"LVLyingLegCurl-46 (dragged).tiff"];

    [_exercise addObject:exercise]; // add the object to array

    //=====================================================
    //                      EX 7
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Leg Extensions";
    NSString *str34 = @"1: Sit on apparatus with back against padded back support.";
    NSString *str35 = @"2: Place front of lower legs under padded lever. ";
    NSString *str36 = @"3: Position knee articulation at same axis as lever fulcrum.";
    NSString *str37 = @"4: Grasp handles to sides for support.";
    NSString *str38 = @"5: Move lever forward and upward by extending knees until legs are straight.";
    NSString *str39 = @"6: Return lever to original position by bending knees.";
    NSString *str40 = @"7: Repeat";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@",str34,str35,str36,str37,str38,str39,str40];
    exercise.cover = [UIImage imageNamed:@"LVLegExtension-1 (dragged).tiff"];
    exercise.animationArray = @[@"LVLegExtension-1 (dragged).tiff", @"LVLegExtension-2 (dragged).tiff", @"LVLegExtension-3 (dragged).tiff", @"LVLegExtension-4 (dragged).tiff", @"LVLegExtension-5 (dragged).tiff", @"LVLegExtension-6 (dragged).tiff", @"LVLegExtension-7 (dragged).tiff", @"LVLegExtension-8 (dragged).tiff", @"LVLegExtension-9 (dragged).tiff", @"LVLegExtension-10 (dragged).tiff", @"LVLegExtension-11 (dragged).tiff", @"LVLegExtension-12 (dragged).tiff", @"LVLegExtension-13 (dragged).tiff", @"LVLegExtension-14 (dragged).tiff", @"LVLegExtension-15 (dragged).tiff", @"LVLegExtension-16 (dragged).tiff", @"LVLegExtension-17 (dragged).tiff", @"LVLegExtension-18 (dragged).tiff", @"LVLegExtension-19 (dragged).tiff", @"LVLegExtension-20 (dragged).tiff", @"LVLegExtension-21 (dragged).tiff", @"LVLegExtension-22 (dragged).tiff", @"LVLegExtension-23 (dragged).tiff", @"LVLegExtension-24 (dragged).tiff", @"LVLegExtension-25 (dragged).tiff", @"LVLegExtension-26 (dragged).tiff", @"LVLegExtension-27 (dragged).tiff", @"LVLegExtension-28 (dragged).tiff", @"LVLegExtension-29 (dragged).tiff", @"LVLegExtension-30 (dragged).tiff", @"LVLegExtension-31 (dragged).tiff", @"LVLegExtension-32 (dragged).tiff", @"LVLegExtension-33 (dragged).tiff", @"LVLegExtension-34 (dragged).tiff", @"LVLegExtension-35 (dragged).tiff", @"LVLegExtension-36 (dragged).tiff", @"LVLegExtension-37 (dragged).tiff", @"LVLegExtension-38 (dragged).tiff", @"LVLegExtension-39 (dragged).tiff", @"LVLegExtension-40 (dragged).tiff", @"LVLegExtension-41 (dragged).tiff", @"LVLegExtension-42 (dragged).tiff", @"LVLegExtension-43 (dragged).tiff", @"LVLegExtension-44 (dragged).tiff", @"LVLegExtension-45 (dragged).tiff", @"LVLegExtension-46 (dragged).tiff", @"LVLegExtension-47 (dragged).tiff"];

    [_exercise addObject:exercise]; // add the object to array
    
    //=====================================================
    //                      EX 8
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Dead Lifts";
    NSString *str41 = @"1: For each rep start in a low squat position and grab the bar with an overhand grip.";
    NSString *str42 = @"2: Sit back in your hips, push through your heels, ascend upward, and raise your torso until you’re in a full stand.";
    NSString *str43 = @"3: maintain a tight core and straight back throughout the motion.";
    NSString *str44 = @"4: Slowly lower under control by dropping your torso and hips down until the bar touches the floor.";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",str41,str42,str43,str44];

    exercise.cover = [UIImage imageNamed:@"BBDeadlift-1 (dragged).tiff"];
    exercise.animationArray = @[@"BBDeadlift-1 (dragged).tiff", @"BBDeadlift-2 (dragged).tiff", @"BBDeadlift-3 (dragged).tiff", @"BBDeadlift-4 (dragged).tiff", @"BBDeadlift-5 (dragged).tiff", @"BBDeadlift-6 (dragged).tiff", @"BBDeadlift-7 (dragged).tiff", @"BBDeadlift-8 (dragged).tiff", @"BBDeadlift-9 (dragged).tiff", @"BBDeadlift-10 (dragged).tiff", @"BBDeadlift-11 (dragged).tiff", @"BBDeadlift-12 (dragged).tiff", @"BBDeadlift-13 (dragged).tiff", @"BBDeadlift-14 (dragged).tiff", @"BBDeadlift-15 (dragged).tiff", @"BBDeadlift-16 (dragged).tiff", @"BBDeadlift-17 (dragged).tiff", @"BBDeadlift-18 (dragged).tiff", @"BBDeadlift-19 (dragged).tiff", @"BBDeadlift-20 (dragged).tiff", @"BBDeadlift-21 (dragged).tiff"];

    [_exercise addObject:exercise]; // add the object to array
   
    //=====================================================
    //                      EX 9
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Bent Over Barbell Row";
    NSString *str45 = @"1: Hold a barbell in front of your body with an overhand grip slightly wider than shoulder width";
    NSString *str46 = @"2: Tighten your core, straighten your back, and drop your torso down to 60º.";
    NSString *str47 = @"3: Powerfully contract your back and biceps, and pull the barbell upwards into the top of your core. Hold for 1s and return down to a full extension.";
    NSString *str48 = @"4: Repeat.";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",str45,str46,str47,str48];
    exercise.cover = [UIImage imageNamed:@"BBBentOverRow-1 (dragged).tiff"];
    exercise.animationArray = @[@"BBBentOverRow-1 (dragged).tiff", @"BBBentOverRow-2 (dragged).tiff", @"BBBentOverRow-3 (dragged).tiff", @"BBBentOverRow-4 (dragged).tiff", @"BBBentOverRow-5 (dragged).tiff", @"BBBentOverRow-6 (dragged).tiff", @"BBBentOverRow-7 (dragged).tiff", @"BBBentOverRow-8 (dragged).tiff", @"BBBentOverRow-9 (dragged).tiff", @"BBBentOverRow-10 (dragged).tiff", @"BBBentOverRow-11 (dragged).tiff", @"BBBentOverRow-12 (dragged).tiff", @"BBBentOverRow-13 (dragged).tiff", @"BBBentOverRow-14 (dragged).tiff", @"BBBentOverRow-15 (dragged).tiff", @"BBBentOverRow-16 (dragged).tiff", @"BBBentOverRow-17 (dragged).tiff", @"BBBentOverRow-18 (dragged).tiff", @"BBBentOverRow-19 (dragged).tiff", @"BBBentOverRow-20 (dragged).tiff", @"BBBentOverRow-21 (dragged).tiff", @"BBBentOverRow-22 (dragged).tiff", @"BBBentOverRow-23 (dragged).tiff", @"BBBentOverRow-24 (dragged).tiff", @"BBBentOverRow-25 (dragged).tiff", @"BBBentOverRow-26 (dragged).tiff", @"BBBentOverRow-27 (dragged).tiff", @"BBBentOverRow-28 (dragged).tiff", @"BBBentOverRow-29 (dragged).tiff", @"BBBentOverRow-30 (dragged).tiff", @"BBBentOverRow-31 (dragged).tiff", @"BBBentOverRow-32 (dragged).tiff", @"BBBentOverRow-33 (dragged).tiff", @"BBBentOverRow-34 (dragged).tiff", @"BBBentOverRow-35 (dragged).tiff", @"BBBentOverRow-36 (dragged).tiff"];

    [_exercise addObject:exercise]; // add the object to array
    
    //=====================================================
    //                      EX 10
    //=====================================================
    exercise = [[Exercises alloc] init]; //allocate in heap and initialise
    exercise.name = @"Bent Over One Arm Dumbell Rows";
    NSString *str49 = @"1: Place your left knee and left hand firmly anchored on a flat bench. Your left hand should serve as support for your body.";
    NSString *str50 = @"2: Maintain a tight core and flat back, contract your lats and biceps, and slowly row the dumbbell upwards until it’s above your torso.";
    NSString *str51 = @"3: Hold 1s and slowly lower the dumbbell to a full extension — you should feel a stretch throughout your upper backout.";
    NSString *str52 = @"4: Repeat.";
    exercise.instruction = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",str49,str50,str51,str52];
    exercise.cover = [UIImage imageNamed:@"DBBentoverRow-1 (dragged).tiff"];
    exercise.animationArray = @[@"DBBentoverRow-1 (dragged).tiff", @"DBBentoverRow-2 (dragged).tiff", @"DBBentoverRow-3 (dragged).tiff", @"DBBentoverRow-4 (dragged).tiff", @"DBBentoverRow-5 (dragged).tiff", @"DBBentoverRow-6 (dragged).tiff", @"DBBentoverRow-7 (dragged).tiff", @"DBBentoverRow-8 (dragged).tiff", @"DBBentoverRow-9 (dragged).tiff", @"DBBentoverRow-10 (dragged).tiff", @"DBBentoverRow-11 (dragged).tiff", @"DBBentoverRow-12 (dragged).tiff", @"DBBentoverRow-13 (dragged).tiff", @"DBBentoverRow-14 (dragged).tiff", @"DBBentoverRow-15 (dragged).tiff", @"DBBentoverRow-16 (dragged).tiff"];
    [_exercise addObject:exercise]; // add the object to array
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//FOR SHAKE EVENT
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake)
    {
        [self showAlert];
    }
}

-(IBAction)showAlert
{
    array = [[NSMutableArray alloc]initWithObjects:@"Dead Lifts",@"Push Ups",@"Bent Over One Arm Dumbell Rows",@"Bent Over Barbell Row",@"Leg Extensions",
       @"Leg Curls", @"Incline Bench Press", @"Decline Bench Press",@"Sit Ups", @"Bench Press", nil];
    int i = arc4random() % 10;
    NSLog(@"Exercise array has %lu", (unsigned long)[array count]);
    NSLog(@"Exercise random %@", array[i]);
    test = array[i];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Random Exercise" message:array[i] delegate:self cancelButtonTitle:@"Try it!" otherButtonTitles:nil];
    [alertView addButtonWithTitle:@"No, Thank You"];
    [alertView show];
}

-(IBAction)showDaily
{
    arrayChallenge = [[NSMutableArray alloc]initWithObjects:@"Do Push Ups for 50 times", @"Do Sit Ups for 50 times", @"Swimming for 1 hour", @"Jogging for 30 minutes",@"Cycling for 30 minutes",nil];
    int i = arc4random() % 5;
    test = arrayChallenge[i];
    NSLog(@"Random has %lu", arrayChallenge.count);
    NSLog(@"Random challenge is %@", arrayChallenge[i]);
    NSLog(@"Test is %@", test);

    UIAlertView *alertView2 = [[UIAlertView alloc] initWithTitle:@"Daily Challenge" message:arrayChallenge[i] delegate:self cancelButtonTitle:@"Try it!" otherButtonTitles:nil];
    [alertView2 addButtonWithTitle:@"No, Thank You"];
    [alertView2 show];}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        _string = test;
        //SAVE THE SELECTED EXERCISES INTO GLOBAL ARRAY
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        
        if([appDelegate.exerciseList containsObject:_string])
        {
            UIAlertView *notification =[[UIAlertView alloc]initWithTitle:@"Sorry!" message:@"You already registered this exercise" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
            [notification show];
        }
        else
        {
            UIAlertView *notification =[[UIAlertView alloc]initWithTitle:@"Great!" message:@"You had added this to today's exercise" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
            [notification show];
            [appDelegate.exerciseList addObject:[NSString stringWithFormat:@"%@",_string]];
            NSLog(@"%@",_string);

            NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
            NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"exercise.plist"];
            [appDelegate.exerciseList writeToFile:filePath atomically:YES];
        }
        
    }
    if(buttonIndex == 1)
    {
        NSLog(@"Not Today");
    }
}

-(void)dailyView:(UIAlertView *)dailyView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        NSLog(@"You pressed yES");
    }
    if(buttonIndex == 1)
    {
        NSLog(@"You press not today");
    }
}

//this method decide what cell will show on table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EXCell"];
    Exercises *exercise = [_exercise objectAtIndex:indexPath.row];

    cell.nameStr.text = exercise.name;
    cell.coverImageView.image = exercise.cover; //set cover image from exercise array to imageview in cell
    
    return cell;
}

//set number of row on table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_exercise count];
}

//this method manages what happens when a row is tapped
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //when a row is tapped, deselect highlighted row automatically.
    IntroductionViewContoller *introViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"IntroductionViewController"];
    //create navigationController object and initialise on "IntroViewController"
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:introViewController];
    [self presentViewController:navigationController animated:YES completion:nil]; //Current view will change to navigationController which is on "IntroductionViewController"
    introViewController.selectedExercise = [_exercise objectAtIndex:indexPath.row];
}

@end
