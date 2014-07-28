//
//  GRAGithubRequest.m
//  git_hubrequest
//
//  Created by Daniel Merrill on 7/28/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "GRAGithubRequest.h"

@implementation GRAGithubRequest

+ (NSDictionary *) requestUserinfo: (NSString *)username
{
    //take user name and call the github URL
    
    NSString * urlString = [NSString stringWithFormat: @"https://api.github.com/users/%@", username];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    /////////mutable request
    
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
    
    [mutableRequest setHTTPMethod:@"POST"];
    
    //mutableRequest.HTTPMethod = @"POST";
    
    
    /////////
    
    
    NSURLResponse * response = nil;
    
    NSError * error = nil;
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary * userInfo= [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    
    
    
    
    NSLog(@"response data = %@",userInfo);
    
    return userInfo;
    
    
    
}

+ (void)saveUsers: (NSArray *) users
{
    
   //path to what we are saving
    NSString * path = [GRAGithubRequest usersArchivePath];

    //then we archive
    NSData * userData = [NSKeyedArchiver archivedDataWithRootObject:users];

    
    //then we return the array
    [userData writeToFile:path options:NSDataWritingAtomic error:nil];
    
    
}

+ (NSArray *) loadUsers
{
    //path to what we are loading
    NSString * path = [GRAGithubRequest usersArchivePath];

    //then we unarchive
    NSArray * users = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    //then we return the array
    return users;
    
}

//returns array of directories
+ (NSString *) usersArchivePath
    {
        //grab first path from above
        NSArray * documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        //return path/users
        NSString * documentDirectory = documentDirectories[0];
        
        return [documentDirectory stringByAppendingPathComponent:@"users.data"];
        
        
        
        
    }


@end







