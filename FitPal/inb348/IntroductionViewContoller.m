//
//  IntroductionViewContoller.m
//  Arfan Rehab

#import "IntroductionViewContoller.h"
#import "AppDelegate.h"

@interface IntroductionViewContoller ()
@end

@implementation IntroductionViewContoller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameLabel.text = _selectedExercise.name;
    _instructionTextView.text = _selectedExercise.instruction;
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < _selectedExercise.animationArray.count; i++) {
        [images addObject:[UIImage imageNamed:[_selectedExercise.animationArray objectAtIndex:i]]];
    }
    
    // Normal Animation
    _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 120, 200, 133)];
    _coverView.animationImages = images;
    _coverView.animationDuration = 2;
    
    [self.view addSubview:_coverView];
    [_coverView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closeButtonTapped:(id)sender {
    //dismiss current view
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addButtonTapped:(id)sender {
    
    _string = _selectedExercise.name;
    _array = [[NSArray alloc]initWithObjects:_selectedExercise.name, nil];
 
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
    
        NSString *documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
        NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"exercise.plist"];
        [appDelegate.exerciseList writeToFile:filePath atomically:YES];
    }
}

@end
