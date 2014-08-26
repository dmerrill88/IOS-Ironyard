//
//  TLATweetCell.h
//  Tweet Like
//
//  Created by Daniel Merrill on 8/11/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFObject;

@protocol TLATweetCellDelegate;



@interface TLATweetCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *heartCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (nonatomic) PFObject * tweet;
@property (nonatomic, assign) id <TLATweetCellDelegate> delegate;


- (IBAction)heartButton:(id)sender;



@end


@protocol TLATweetCellDelegate <NSObject>

- (void)updateHeartCount:(int)heartCount;


@end
