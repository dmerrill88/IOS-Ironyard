//
//  GFAViewController.m
//  githubfriends
//
//  Created by Daniel Merrill on 7/25/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "GFAViewController.h"

@interface GFAViewController ()

@end

@implementation GFAViewController
{
    UIWebView * webView;
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
    
    ////////////////call web urls
    
 webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    

    
    //////////////////////////////
}

-(void)setFriendinfo:(NSDictionary *)friendinfo
{
    _friendinfo = friendinfo;
    
    NSURL * url = [NSURL URLWithString:friendinfo[@"html_url"]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    
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

@end
