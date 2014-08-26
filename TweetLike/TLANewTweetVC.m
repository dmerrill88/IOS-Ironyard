//
//  TLANewTweetVC.m
//  Tweet Like
//
//  Created by Daniel Merrill on 8/11/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "TLANewTweetVC.h"

#import <Parse/Parse.h>

@interface TLANewTweetVC () <UITextViewDelegate>

@end

@implementation TLANewTweetVC
{
    CGPoint swipeButtonOrigin;
    
    
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
    
    self.redCircle.layer.cornerRadius = 85;
    
    self.greenCircle.layer.cornerRadius = 85;
    
    //self.swipeButton.layer.cornerRadius = 10;

    
    self.tweetTextView.layer.cornerRadius = 25;
    self.tweetTextView.delegate = self;
    
    
    
    
    swipeButtonOrigin = self.swipeButton.center;
    
    
    // Do any additional setup after loading the view.
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    
    
    return YES;
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

- (IBAction)saveTweet:(id)sender
{
    
    
    [self.tweets addObject:[@{
                              @"hearts" : @0,
                              @"text" : self.tweetTextView.text
                              } mutableCopy]];
    
    
    [ self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL) isPoint: (CGPoint)point withInRadians:(int) radius ofPoint:(CGPoint) center
{
    CGFloat dx = center.x - point.x;
    
    CGFloat dy = center.y - point.y;
    
    CGFloat distance = sqrt(dx * dx + dy * dy);
    
    return (distance < radius);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    
    self.swipeButton.center = [touch locationInView:self.view];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    
      BOOL isOnRed = [self isPoint:[touch locationInView:self.view] withInRadians:self.redCircle.frame.size.width / 2 ofPoint:self.redCircle.center];
    
     BOOL isOnGreen = [self isPoint:[touch locationInView:self.view] withInRadians:self.greenCircle.frame.size.width / 2 ofPoint:self.greenCircle.center];
    
    
    
    if (isOnRed)
    {
       [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (isOnGreen)
    {
        PFObject * newTweetLike = [PFObject objectWithClassName: @"Tweet"];


        [newTweetLike setObject:@0 forKey:@"hearts"];
        [newTweetLike setObject:self.tweetTextView.text forKey:@"text"];
        [newTweetLike setObject:@(arc4random_uniform (1000000000)) forKey:@"id"];
        
        [self.tweets insertObject:newTweetLike atIndex:0];
        
        [newTweetLike saveInBackground];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
        
    }else{
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.swipeButton.center = swipeButtonOrigin;
        }];
    }
    
}








- (IBAction)swipeButton:(id)sender {
}

@end
