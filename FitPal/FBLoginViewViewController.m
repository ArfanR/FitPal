//
//  FBLoginViewViewController.m
//  Arfan Rehab

#import "FBLoginViewViewController.h"
NSString *userName;
NSNumber *userID;

@interface FBLoginViewViewController ()
-(void)toggleHiddenState:(BOOL)shouldHide;
@end

@implementation FBLoginViewViewController

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
    //self.lblWelcome.hidden = NO;
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    self.loginButton.readPermissions = @[@"public_profile"];
    self.loginButton.delegate = self;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"shell.jpg"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toggleHiddenState:(BOOL)shouldHide
{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
    //self.btnContinue.hidden = YES;
    //self.lblWelcome.hidden = YES;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    //self.lblLoginStatus.text = @"%@", userName;
    NSLog(@"%@",userName);
    [self toggleHiddenState:NO];
    self.myImage.hidden = YES;
    self.lblWelcome.hidden=YES;
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"%@", user);
    self.profilePicture.profileID = user.objectID;
    userID = [user objectForKey:@"id"];
    userName = [user objectForKey:@"first_name"];
    self.btnContinue.hidden = NO;
    [_lblLoginStatus setText:[NSString stringWithFormat:@"Welcome to FitMate, %@", user.name]];
    ViewController *view = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    view.userName = @"%@Yes";
    [self.navigationController pushViewController:view animated:YES];
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    self.myImage.hidden = NO;
    self.lblWelcome.hidden = NO;
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
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

@end
