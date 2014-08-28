//
//  MSAFirstViewController.m
//  Mayorships
//
//  Created by Daniel Merrill on 8/19/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "MSAFirstViewController.h"

#import "MSARequest.h"

#import <CoreLocation/CoreLocation.h>

@interface MSAFirstViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@end

@implementation MSAFirstViewController
{
    NSArray * mayorShips;
    
    CLLocationManager * locationManager;
    
    UIImageView * mayorImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    locationManager = [[CLLocationManager alloc] init];
   // locationManager.dataSource = self;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    
    self.mayorList.dataSource = self;
    self.mayorList.delegate = self;

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * location = locations[0];
    
    [locationManager stopUpdatingLocation];

    
    //mayorShips = [MSARequest findMayorshipsWithLocation:location];
    
    [MSARequest findMayorshipsWithLocation:location completion:^(NSArray * mayors) {
        
        mayorShips = mayors;
        [self.mayorList reloadData];
        
    }];
    
    [self.mayorList reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mayorShips.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.mayorList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSDictionary * mayor = mayorShips[indexPath.row];
    
    NSString * urlString = [NSString stringWithFormat:@"%@100x100%@",mayor[@"user"][@"photo"][@"prefix"],mayor[@"user"][@"photo"][@"suffix"]];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSString *documentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString * filePath = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",mayor[@"user"][@"id"]]];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    if (!fileExists)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            NSData * data = [NSData dataWithContentsOfURL:url];
            
            
            [data writeToFile:filePath atomically:YES];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                cell.imageView.image = [UIImage imageWithData:data];
                
            });
            
        });
        
        
    }
    else {
        
        cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];
        
    }
    
    
    cell.textLabel.text = mayor[@"user"][@"firstName"];
    
    
    
    
    
    return cell;
}










































//friendaImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 115, 115)];
//
//friendaImage.backgroundColor = [UIColor colorWithRed:0.746 green:0.716 blue:0.706 alpha:1.000];
//
//friendaImage.layer.masksToBounds = YES;
//
//NSURL * url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
//
//NSData * data = [NSData dataWithContentsOfURL:url];
//
//friendaImage.image = [UIImage imageWithData:data];
//
//
//@"login": @"dmerrill88",
//@"id": @8224723,
//"avatar_url": "https://avatars.githubusercontent.com/u/1536630?",
//
//- (void)showProfile
//{
//    
//    GFAViewController * profileview = [[GFAViewController alloc] init];
//    
//    profileview.view.backgroundColor = [UIColor colorWithRed:0.264 green:0.271 blue:0.281 alpha:1.000];
//    
//    [self.navigationController pushViewController:profileview animated:YES];
//    
//    profileview.friendinfo =self.friendInfo;


@end
