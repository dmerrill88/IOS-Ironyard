//
//  MFLTableViewController.m
//  List app
//
//  Created by Daniel Merrill on 7/23/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "MFLTableViewController.h"

@interface MFLTableViewController ()

@property (nonatomic) NSArray *listitems;


@end

@implementation MFLTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
      //  self.listitems = [[NSArray alloc] initWithObjects:@"Monday","Tuesday","Wednesday","Thursday", nil];
        
       // self.listitems =[NSArray arrayWithObjects:@"Monday","Tuesday","Wednesday","Thursday",nil];
      
        // [self setListitems: = @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday"]];

        
        self.listitems = @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday"];
        
        
        
        

        
    
        
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.listitems.count;
    
    
    
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    
    NSString * listItem = [self.listitems objectAtIndex:indexPath.row];
    
    NSLog(@"listItem = %@",listItem);
    
    
    listItem = self.listitems [indexPath.row];
    
    
    
    
    cell.textLabel.text = listItem;
    
    // Configure the cell...
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
