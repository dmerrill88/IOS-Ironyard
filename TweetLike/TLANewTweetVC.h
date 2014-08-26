//
//  TLANewTweetVC.h
//  Tweet Like
//
//  Created by Daniel Merrill on 8/11/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TLANewTweetVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@property (weak, nonatomic) IBOutlet UIButton * swipeButton;

@property (nonatomic) NSMutableArray * tweets;

@property (weak, nonatomic) IBOutlet UIView *greenCircle;

@property (weak, nonatomic) IBOutlet UIView *redCircle;

- (IBAction)saveTweet:(id)sender;

@end
