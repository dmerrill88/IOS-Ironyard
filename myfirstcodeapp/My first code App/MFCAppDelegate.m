//
//  MFCAppDelegate.m
//  My first code App
//
//  Created by Daniel Merrill on 7/22/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "MFCAppDelegate.h"
#import "MFCRootViewController.h"

@implementation MFCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MFCRootViewController * rVC = [[MFCRootViewController alloc] init];
    
    //rVC.view.backgroundColor = [UIColor redColor];
    
    self.window.rootViewController = rVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
     //code will not work here
    
}

@end
