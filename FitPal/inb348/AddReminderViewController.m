//
//  AddReminderViewController.m
//  Arfan Rehab

#import "AddReminderViewController.h"

@interface AddReminderViewController ()

@end

@implementation AddReminderViewController

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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"time5.jpg"]]];
    self.itemText.delegate = self;
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)save:(id)sender {
    [self.itemText resignFirstResponder];
    
    //GET THE CURRENT DATE
    NSDate *pickerDate = [self.datePicker date];
    
    //SCHEDULE THE NOTIFICATION
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.itemText.text;
    localNotification.alertAction = @"Show me the item";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication]applicationIconBadgeNumber]+1;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    //REQUEST TO RELOAD TABLE VIEW DATA
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadData" object:self];
    
    //DISMISS THE VIEW CONTROLLER
    UIAlertView *notification =[[UIAlertView alloc]initWithTitle:@"Great!" message:@"We'll remind you on time!" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [notification show];
}
@end
