//
//  SIGRootViewController.m
//  signatures2
//
//  Created by Daniel Merrill on 8/14/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "SIGRootViewController.h"
#import "SIGListTableViewController.h"
#import "SIGDrawViewController.h"


@interface SIGRootViewController ()

@end

@implementation SIGRootViewController
{
    UIButton* saveButton;
    
    UIButton* cancelButton;
    
    SIGDrawViewController * drawVC;
    
    SIGListTableViewController * listVC;
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
    

    drawVC = [[SIGDrawViewController alloc] init];
    
    drawVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    
    [self.view addSubview:drawVC.view];
    
    listVC = [[SIGListTableViewController alloc] init];
    
    listVC.tableView.frame = CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT - 200);
    
    [self.view addSubview:listVC.tableView];

    [self addChildViewController:drawVC];
    [self addChildViewController:listVC];
    
    
    
    saveButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 150, 100, 30)];
    [saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    saveButton.backgroundColor = [UIColor colorWithRed:0.148 green:0.928 blue:0.222 alpha:1.000];
    saveButton.titleLabel.textColor = [UIColor whiteColor];
    saveButton.layer.cornerRadius = 15;
    saveButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    saveButton.layer.borderColor = [UIColor colorWithRed:1.000 green:0.235 blue:0.241 alpha:1.000].CGColor;
    [saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    saveButton.layer.borderWidth = 0.8;
    [self.view addSubview:saveButton];
    
    
    
    
    cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 150, 100, 30)];
    [cancelButton setTitle:@"CANCEL" forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor colorWithRed:0.960 green:0.138 blue:0.060 alpha:1.000];
    cancelButton.titleLabel.textColor = [UIColor whiteColor];
    cancelButton.layer.cornerRadius = 15;
    cancelButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    cancelButton.layer.borderColor = [UIColor colorWithRed:1.000 green:0.235 blue:0.241 alpha:1.000].CGColor;
    [cancelButton addTarget:drawVC action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.layer.borderWidth = 0.8;
    [self.view addSubview:cancelButton];
    


    // Do any additional setup after loading the view.
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

-(void) saveButtonClicked
{
    UIImage * image = [drawVC getSignature];
    
    [listVC.signatures addObject:image];
    [listVC.tableView reloadData];
}



@end
