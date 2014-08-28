//
//  SIGRootViewController.m
//  Signature
//
//  Created by Daniel Merrill on 8/13/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "SIGRootViewController.h"
#import "SIGDrawViewController.h"
#import "SIGListTableViewController.h"

@interface SIGRootViewController ()

@end

@implementation SIGRootViewController
{
    UIButton * saveButton;
    UIButton * cancelButton;
}

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
    
    //SIGDrawViewController * drawView = [[SIGDrawViewController alloc] init];
    
    
    
    SIGListTableViewController * listView = [[SIGListTableViewController alloc] init];
    
    listView.tableView.frame = CGRectMake(0, 200, 300, 300);
    
    [self.view addSubview:listView.tableView];
    
    
    saveButton = [[UIButton alloc] initWithFrame:CGRectMake(235.0, 80.0, 120.0, 40.0)];
    [saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    saveButton.backgroundColor = [UIColor colorWithRed:0.148 green:0.928 blue:0.222 alpha:1.000];
    saveButton.titleLabel.textColor = [UIColor whiteColor];
    saveButton.layer.cornerRadius = 20.0;
    saveButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    saveButton.layer.borderColor = [UIColor colorWithRed:1.000 green:0.235 blue:0.241 alpha:1.000].CGColor;
    [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    saveButton.layer.borderWidth = 0.8;
    [self.view addSubview:saveButton];
    
    
    
    
    cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(135.0, 80.0, 120.0, 40.0)];
    [cancelButton setTitle:@"CANCEL" forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor colorWithRed:0.960 green:0.138 blue:0.060 alpha:1.000];
    cancelButton.titleLabel.textColor = [UIColor whiteColor];
    cancelButton.layer.cornerRadius = 20.0;
    cancelButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    cancelButton.layer.borderColor = [UIColor colorWithRed:1.000 green:0.235 blue:0.241 alpha:1.000].CGColor;
    [cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.layer.borderWidth = 0.8;
    [self.view addSubview:cancelButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) saveButtonClicked
{
    
}

-(void) cancelButtonClicked
{
    
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
