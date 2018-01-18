//
//  TodayDetailViewController.m
//  Arfan Rehab

#import "TodayDetailViewController.h"
#import "AppDelegate.h"
#import "TodayDetail.h"
@interface TodayDetailViewController ()<UITextFieldDelegate>
@end

NSString *exerciseName;

@implementation TodayDetailViewController
@synthesize nameLabel;
@synthesize kgTextField;
@synthesize repsTextField;
@synthesize setsTextField;
@synthesize managedObjectContext;

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
    AppDelegate* appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    self.managedObjectContext = appDelegate.managedObjectContext;
    self.kgTextField.delegate = self;
    self.repsTextField.delegate = self;
    self.setsTextField.delegate = self;
    self.nameLabel.text = self.selectedExercise;
    NSLog(@"TODAYS WORKOUT %@", self.selectedExercise);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.kgTextField resignFirstResponder];
    [self.repsTextField resignFirstResponder];
    [self.setsTextField resignFirstResponder];
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

- (IBAction)logButton:(id)sender
{
    TodayDetail * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"TodayDetail"
                                                      inManagedObjectContext:self.managedObjectContext];
    newEntry.name = self.nameLabel.text;
    newEntry.kg = self.kgTextField.text;
    newEntry.reps = self.repsTextField.text;
    newEntry.sets = self.setsTextField.text;
    
    NSError *error;
    if (![self.managedObjectContext save:&error])
    {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    self.kgTextField.text = @"";
    self.repsTextField.text = @"";
    self.setsTextField.text = @"";
    
    [self.view endEditing:YES];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TodayDetail"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (TodayDetail *tdetail in fetchedObjects) {
        NSLog(@"Name: %@ kg: %@ reps: %@ sets: %@", tdetail.name, tdetail.kg, tdetail.reps, tdetail.sets);
    }
}
@end
