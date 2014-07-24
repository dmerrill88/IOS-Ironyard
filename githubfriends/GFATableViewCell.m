//
//  GFATableViewCell.m
//  githubfriends
//
//  Created by Daniel Merrill on 7/24/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "GFATableViewCell.h"

@implementation GFATableViewCell
{
    UILabel * friendName;
    
    UIImageView * friendaImage;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        friendName = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 40)];
        
        [self.contentView addSubview:friendName];
        
        
        
        friendaImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        
        [self.contentView addSubview:friendaImage];
        
        
        
        
    }
    return self;
}


//@"login": @"dmerrill88",
//@"id": @8224723,
//"avatar_url": "https://avatars.githubusercontent.com/u/1536630?",

- (void) setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
 
    
    NSURL * url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    UIImage * image = [UIImage imageWithData:data];
    
    
    
    friendaImage.image =  image;
    
    
    
    
    friendName.text = friendInfo[@"login"];
    
    
    NSLog(@"%@",friendInfo);
    
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
