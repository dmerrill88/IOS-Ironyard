//
//  STAItemsTableViewController.m
//  Simple Tasks
//
//  Created by Daniel Merrill on 7/30/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "STAItemsTableViewController.h"
#import "STAEditItemViewController.h"

@interface STAItemsTableViewController () 

@end

@implementation STAItemsTableViewController
{
    NSMutableArray * groups;
    

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // Custom initialization
        
        NSLog(@"run with style");
        groups = [@[
                    
                    [@{@"name": @"Movies To Watch",
                       @"items": [@[
                                    @{@"name": @"Gaudians of the Galaxy",
                                      @"priority": @60
                                      },
                                    @{@"name": @"Expendables 3",
                                      @"priority": @40
                                      },
                                    @{@"name": @"TMNT",
                                      @"priority": @20
                                      },
                                    
                                    ] mutableCopy]
                       } mutableCopy],
                    
                    [@{@"name": @"Apps To Write",
                       @"items": [@[] mutableCopy]
                       } mutableCopy],
                    
                    ] mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    
    /////////////////////////////////////////////////////////////////////////////////////

    UIBarButtonItem * addNewItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItemClicked)];
    
    self.navigationItem.rightBarButtonItem = addNewItem;

    
    /////////////////////////////////////////////////////////////////////////////////////
    
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    
}


//////////////////////////////////////////////////////////////////////////////////////////
-(void) addNewItemClicked

{
    
    STAEditItemViewController * newItemVC = [[STAEditItemViewController alloc] init];

    newItemVC.items = self.groupInfo[@"items"];
    
    [self.navigationController presentViewController:newItemVC animated:YES completion:nil];

//    STANewGroupViewConrtoller * addNewItemVC = [[STANewGroupViewConrtoller alloc] init];
//    
//    
//    addNewItemVC.groups = groups;
//    
//    
//    [self.navigationController presentViewController:addNewItemVC animated:YES completion:nil];
}
    //////////////////////////////////////////////////////////////////////////////////////////


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
  
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in a section.
    NSMutableArray * items = self.groupInfo[@"items"];
    
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.groupInfo[@"items"] [indexPath.row] [@"name"];
    
    
    /* How to turn a string into a float
     NSString* myNumber = @"50.32343";
     float myFloat = [myNumber floatValue];
     */
    
    float priority = [self.groupInfo[@"items"] [indexPath.row] [@"priority"] floatValue];
    
    float priorityHue = priority / 360;
    
    
    cell.backgroundColor =[UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];

    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STAEditItemViewController * editItemVc = [[ STAEditItemViewController alloc]init];
    
    editItemVc.itemInfo = self.groupInfo[@"items"] [indexPath.row];
    
    [self.navigationController pushViewController:editItemVc  animated:YES];

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







////////////////////////////////////////////////////////////////////////////////////////////////////////






////////////////////////////////////////////////////////////////////////////////////////////////////////

















-(BOOL) prefersStatusBarHidden { return YES; }


@end