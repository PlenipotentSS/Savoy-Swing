//
//  SSC-SBTableViewController.m
//  Savoy Swing
//
//  Created by Steven Stevenson on 11/17/13.
//  Copyright (c) 2013 Steven Stevenson. All rights reserved.
//

#import "SSC-SBTableViewController.h"
#import "SWRevealViewController.h"
#import "SSCAppDelegate.h"

@interface SSC_SBTableViewController ()

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation SSC_SBTableViewController

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
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.4f];
    
    _menuItems = @[@"menu_title",@"news",@"about",@"calendar",@"classes",@"get-involved",@"blank",@"account",@"membership",@"logout"];
    
    //NSLog(@"%@",_menuItems);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    [tableView cellForRowAtIndexPath:indexPath].backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"menu" ofType:@"png"];
    UIImage *theImage = [[UIImage alloc] initWithContentsOfFile:filePath];
    
    destViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:theImage style:UIBarButtonItemStylePlain target:self.revealViewController action:@selector(revealToggle:)];
    if (![[segue identifier] isEqualToString:@"showNews"]) {
         [destViewController.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            //setup header title
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:22.0];
            label.textAlignment = NSTextAlignmentCenter;
            // ^-Use UITextAlignmentCenter for older SDKs.
            label.textColor = [UIColor whiteColor];
            
            NSString *theTitle = destViewController.title;
            label.text = NSLocalizedString(theTitle, @"");
            [label sizeToFit];
            destViewController.navigationItem.titleView = label;
            
            destViewController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
    
}

@end