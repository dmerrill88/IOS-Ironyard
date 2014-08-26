//
//  TLATweetCell.m
//  Tweet Like
//
//  Created by Daniel Merrill on 8/11/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "TLATweetCell.h"


#import <Parse/Parse.h>
@implementation TLATweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        

    }
    return self;
}

/*
 Storyboards control multiple ViewControllers (i.e. views)
 and Nibs (Zibs Xibs) control a single ViewController (i.e. view)
 */

- (void)awakeFromNib
{
    // Initialization code
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




- (IBAction)heartButton:(id)sender
{
    int newValue = [self.heartCountLabel.text intValue] + 1;
    self.heartCountLabel.text = [NSString stringWithFormat:@"%d", newValue];
    self.tweet[@"hearts"] = @(newValue);
    [self.delegate updateHeartCount:newValue];
    [self.tweet saveInBackground];
    
}



@end
