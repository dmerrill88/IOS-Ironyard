//
//  MFLTableViewController.m
//  List app
//
//  Created by Daniel Merrill on 7/23/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "MFLTableViewController.h"

@interface MFLTableViewController ()

@property (nonatomic) NSArray *days;

@property (nonatomic) NSArray *liststudents;

@property (nonatomic) NSArray *listcolors;

@property (nonatomic) NSArray *listsizes;

@property (nonatomic) NSArray *info;

//create an array for students- NSStrings

// create an array for colors- UICOLORS

//create an array for sizes- NSNumbers


@end

@implementation MFLTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
        // Custom initialization
        

        // [self setListitems: = @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday"]];

        
        self.days =  @[@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
       
        self.liststudents =  @[@"Daniel",@"Jo",@"Jeff",@"Jack",@"John",@"Stacy",@"Ali"];
        
        self.listcolors =  @[[UIColor greenColor],[UIColor colorWithRed:0.079 green:0.193 blue:1.000 alpha:1.000],[UIColor colorWithRed:1.000 green:0.029 blue:0.018 alpha:1.000],[UIColor colorWithRed:1.000 green:0.037 blue:0.986 alpha:1.000],[UIColor colorWithRed:0.988 green:1.000 blue:0.019 alpha:1.000],[UIColor colorWithRed:1.000 green:0.513 blue:0.046 alpha:1.000],[UIColor colorWithRed:0.469 green:0.466 blue:0.473 alpha:1.000]];

        self.listsizes =  @[@23,@28,@33,@38,@32,@27,@24];
        
       
        
        
        //self.info =@[
                    // @{@"day":@"Monday", @"color":[UIColor redColor], @"name":@"Matt", @"size":@20},
                   //  @{@"day":@"Tuesday", @"color":[UIColor greenColor]}];
        

        
    
        
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
    return self.days.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    
    
   //NSDictionary * infoItem = self.info[indexPath.row];
    

 //  NSString * day = infoItem[@"day"]
    
    
    
    //NSString * listItem = [self.listitems objectAtIndex:indexPath.row];
    NSString * listItem = self.days [indexPath.row];
   
    NSLog(@"listItem = %@",listItem);
    
    cell.backgroundColor = self.listcolors [indexPath.row];

    NSString * studentname = self.liststudents [indexPath.row];

    NSNumber * size = self.listsizes [indexPath.row];

    
    
    //SET BACKGROUNG COLOR IN ARRAY
    
    //THERE IS A SUBTEXT OPTION THAT WILL BE SET BY STUDENT NAME
    
    // SET THE TEXT LABEL FONT SIZE TO A NUMBER FROM THE LAST ARRAY
    
    cell.textLabel.text = listItem;
    
    cell.detailTextLabel.text = studentname;
    
    cell.textLabel.font = [UIFont systemFontOfSize:[size intValue]];
    
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
