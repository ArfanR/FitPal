//
//  GymListTableViewController.m
//  Arfan Rehab

#import "GymListTableViewController.h"

@interface GymListTableViewController ()
@end

@implementation GymListTableViewController

//GLOBAL VARIABLE
int rowNo;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"location" ofType:@"plist"];
    self.gymList = [[NSMutableArray alloc]initWithContentsOfFile:path];
    
    UIAlertView *notification =[[UIAlertView alloc]initWithTitle:@"Calculating Distance!" message:@"Press the find button after a few seconds." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [notification show];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    //NSLog(@"%@",self.gymList[0]);
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RouteViewController *a= [self.storyboard instantiateViewControllerWithIdentifier:@"RouteViewController"];
    //a.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    NSDictionary *eachGym = [self.gymList objectAtIndex:indexPath.row];
    a.rowNumber = (NSUInteger*)indexPath.row;
    a.rowTitle = [eachGym objectForKey:@"title"];
    [self.navigationController pushViewController:a animated:YES];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.gymList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GymListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if(!cell)
    {
        cell = [[GymListTableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"myCell"];
    }
    NSDictionary *eachGym = [self.gymList objectAtIndex:indexPath.row];
    cell.myLabel.text = [eachGym objectForKey:@"title"];
    NSNumber *test = [eachGym objectForKey:@"distance"];
    NSString *distance = [test stringValue];
    cell.lblDistance.text = [distance stringByAppendingString:@" m"];
    
    return cell;
}

- (IBAction)btnTest:(id)sender {
    GymListTableViewCell *cell;
    cell.myLabel.text = @"TEST";
    
    if(!cell)
    {
        cell = [[GymListTableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"myCell"];
    }
    [self.tableView reloadData];
    
    NSLog(@"%@", self.gymList);
    NSLog(@"DISTANCE %@",self.gymDistance);
    //NSLog(@"TEST DISTANCE %@", self.testDistance);
}
@end

