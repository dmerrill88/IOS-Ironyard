//
//  GFATableViewController.m
//  githubfriends
//
//  Created by Daniel Merrill on 7/24/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "GFATableViewController.h"

#import "GFATableViewCell.h"

#import "GFAViewController.h"

#import "GRAGithubRequest.h"


@interface GFATableViewController ()



//token ID for github: 5a8a9a902c79cd30e2eba6e2904bf1ec32cc353c


@end

@implementation GFATableViewController

{
    UITextField * search;
    
    
    
    NSMutableArray * githubFriends;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
        githubFriends = [@[] mutableCopy];
        
        NSArray * loadedUsers = [GRAGithubRequest loadUsers];
        
        
        if (loadedUsers)
        {
            githubFriends = [loadedUsers mutableCopy];
        }
        
        
        self.tableView.rowHeight = 100;
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        
        
        
        
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    
    
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 90)];
    
    self.tableView.tableHeaderView =headerView;
    
    
    search = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 30.0,  250.0, 40.0)];
    
    
    search.backgroundColor = [UIColor whiteColor];
    
    
    
    search.borderStyle = UITextBorderStyleLine;
    
    [headerView addSubview:search];
    
    CGRect sepFrame = CGRectMake(0, headerView.frame.size.height-1, 320, 1);
    UIView * seperatorView = [[UIView alloc] initWithFrame:sepFrame];
    seperatorView.backgroundColor = [UIColor colorWithWhite:224.0/255.0 alpha:1.0];
    [headerView addSubview:seperatorView];
    
    
    
    headerView.backgroundColor = [UIColor colorWithRed:0.961f green:0.094f blue:0.322f alpha:1.0f];
    
    
    
    
    UIButton * searchiconbutton = [[UIButton alloc] initWithFrame:CGRectMake(270.0,  30.0, 40.0, 40.0)];
    
    searchiconbutton.backgroundColor = [UIColor whiteColor];
    
    searchiconbutton.layer.cornerRadius = 20;
    
    [searchiconbutton addTarget:self action:@selector(addUser) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    [headerView addSubview:searchiconbutton];
    
    
    
    
    
    
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)addUser
{
    NSLog(@"searchbuttonclicked");
    
    NSDictionary * userInfo = [GRAGithubRequest requestUserinfo:search.text];
    
    //[githubFriends addObject:userInfo];
    
    [githubFriends insertObject:userInfo atIndex:0];
    
    [self.tableView reloadData];
    
    [GRAGithubRequest saveUsers:githubFriends];
}



-(void)dismissKeyboard
{
    [search resignFirstResponder];
}



#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 115;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section


{
    // Return the number of rows in the section.
    return githubFriends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (cell == nil)
    {
        cell = [[GFATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    cell.friendInfo = githubFriends [indexPath.row];
    
    cell.navigationController = self.navigationController;
    
    // Configure the cell...
    
    
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [githubFriends removeObjectAtIndex:indexPath.row];
        
        [GRAGithubRequest saveUsers:githubFriends];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    
}
//        -(void)dismissKeyboard
//        {
//            [searchTextbox resignFirstResponder];
//        }
//
//        - (void)viewDidLoad
//        {
//
//
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//
//            [self.view addGestureRecognizer:tap];
//            [tap setCancelsTouchesInView:NO];
//    }
//}

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



@end
