//
//  GFATableViewCell.m
//  githubfriends
//
//  Created by Daniel Merrill on 7/24/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "GFATableViewCell.h"

#import "GFAViewController.h"

@implementation GFATableViewCell
{
    UILabel * friendLocation;
    UILabel * friendName;
    UIImageView * friendaImage;
    
    UIButton * directionButton;
    UILabel * numberbutton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        friendName = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 200, 40)];
        
        [self.contentView addSubview:friendName];
        
        friendName.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:22];
        
        friendName.textColor = [UIColor colorWithWhite:0.662 alpha:1.000];

        
        friendaImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 115, 115)];
        
        friendaImage.backgroundColor = [UIColor colorWithRed:0.746 green:0.716 blue:0.706 alpha:1.000];
        
        friendaImage.layer.masksToBounds = YES;
        
        [self.contentView addSubview:friendaImage];
        friendLocation = [[UILabel alloc] initWithFrame:CGRectMake(130, 29, 200, 40)];
        [self.contentView addSubview:friendLocation];
        friendLocation.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        friendLocation.textColor = [UIColor grayColor];
        
        
        UIButton * gistbutton = [[UIButton alloc] initWithFrame:CGRectMake(235.0, 80.0, 68.0, 24.0)];
        [gistbutton setTitle:@"GISTS" forState:UIControlStateNormal];
        gistbutton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        gistbutton.titleLabel.textColor = [UIColor whiteColor];
        gistbutton.layer.cornerRadius = 10.0;
        gistbutton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        gistbutton.layer.borderColor = [UIColor whiteColor].CGColor;
        gistbutton.layer.borderWidth = 0.8;
       //gist.github.com/username;
        [self.contentView addSubview:gistbutton];
        
        UIButton * linkbutton = [[UIButton alloc] initWithFrame:CGRectMake(285.0, 10.0, 28.0, 28.0)];
        // [linkbutton setTitle:@">" forState:UIControlStateNormal];
        linkbutton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        linkbutton.titleLabel.textColor = [UIColor blackColor];
        linkbutton.layer.cornerRadius = 14.0;
        linkbutton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        linkbutton.layer.borderColor = [UIColor whiteColor].CGColor;
        
        linkbutton.layer.borderWidth = 0.8;

        [linkbutton addTarget:self action:@selector(showProfile) forControlEvents:UIControlEventTouchUpInside];

        [linkbutton setBackgroundImage:[UIImage imageNamed:@"profileArrow"] forState:UIControlStateNormal];
        
        
        
        [self.contentView addSubview:linkbutton];
        
        
        
        
        self.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        
        
        
        
        
        numberbutton = [[UILabel alloc] initWithFrame:CGRectMake(145.0, 78.0, 28.0, 28.0)];
        
        //[numberbutton setTitle:@"8" forState:UIControlStateNormal];
        
        
        numberbutton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        
        numberbutton.textColor = [UIColor blackColor];
        
        numberbutton.layer.cornerRadius = 14.0;
        
        numberbutton.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        numberbutton.textAlignment = NSTextAlignmentCenter;
        
        numberbutton.layer.borderColor = [UIColor whiteColor].CGColor;
        
        numberbutton.layer.borderWidth = 0.8;

        
        [self.contentView addSubview:numberbutton];
    
        
        self.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];

        
        
        
        
        
        directionButton = [[UIButton alloc] initWithFrame:CGRectMake(120.0, 78.0, 28.0, 28.0)];
        
       // [directionButton setTitle:@"^><" forState:UIControlStateNormal];
        
        
        directionButton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        
        directionButton.titleLabel.textColor = [UIColor blackColor];
        
        directionButton.layer.cornerRadius = 14.0;
        
        directionButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        
        
        directionButton.layer.borderColor = [UIColor whiteColor].CGColor;
        
        directionButton.layer.borderWidth = 0.8;

        
        [self.contentView addSubview:directionButton];

        
        self.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];

        
        
        
        
        UIButton * gistnumberbutton = [[UIButton alloc] initWithFrame:CGRectMake(215.0, 78.0, 28.0, 28.0)];
        
        [gistnumberbutton setTitle:@"^" forState:UIControlStateNormal];
        
        
        gistnumberbutton.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];
        
        gistnumberbutton.titleLabel.textColor = [UIColor blackColor];
        
        gistnumberbutton.layer.cornerRadius = 14.0;
        
        gistnumberbutton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        
        
        gistnumberbutton.layer.borderColor = [UIColor whiteColor].CGColor;
        
        gistnumberbutton.layer.borderWidth = 0.8;
    
        
        [self.contentView addSubview:gistnumberbutton];
    
        
        self.backgroundColor = [UIColor colorWithRed:0.227f green:0.227f blue:0.227f alpha:1.0f];

        
        
        
        
    }
    return self;
}

- (void)showProfile
{
    
    GFAViewController * profileview = [[GFAViewController alloc] init];
    
    profileview.view.backgroundColor = [UIColor colorWithRed:0.264 green:0.271 blue:0.281 alpha:1.000];
    
    [self.navigationController pushViewController:profileview animated:YES];
    
    profileview.friendinfo =self.friendInfo;
}

//@"login": @"dmerrill88",
//@"id": @8224723,
//"avatar_url": "https://avatars.githubusercontent.com/u/1536630?",

- (void) setFriendInfo:(NSDictionary *)friendInfo
{
    _friendInfo = friendInfo;
 
    
    NSURL * url = [NSURL URLWithString:friendInfo[@"avatar_url"]];
    
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    friendaImage.image = [UIImage imageWithData:data];
    friendLocation.text =friendInfo[@"location"];
    friendName.text = friendInfo[@"name"];
    
    
    int numberFriendFollowers = [friendInfo[@"followers"] intValue];
    int numberFriendFollowing = [friendInfo[@"following"] intValue];
    
    
    
    if (numberFriendFollowers > numberFriendFollowing)
    {
        // make the direction button have an up arrow
        // make the number button have the number = (followers - following)
        // Last word label must say LEADER
        
        [directionButton setBackgroundImage:[UIImage imageNamed:@"upArrow"] forState:UIControlStateNormal];
        numberbutton.textColor = [UIColor greenColor];
        
        int difference = numberFriendFollowers - numberFriendFollowing;
        numberbutton.text = [NSString stringWithFormat:@"%d", difference];
    }
    else if (numberFriendFollowers < numberFriendFollowing)
    {
        // make the direction button have an down arrow
        // make the number button have the number = (following - followers)
        // Last word label must say FOLLOWER
        [directionButton setBackgroundImage:[UIImage imageNamed:@"downArrow"] forState:UIControlStateNormal];
        numberbutton.textColor = [UIColor redColor];
        int difference = numberFriendFollowing - numberFriendFollowers;
        numberbutton.text = [NSString stringWithFormat:@"%d", difference];
    

    }
    else
    {
    
        // make the direction button have no imageb (just gray bground)
        // make the number button have the number 0
        // Last word label must say Just Friends
        [directionButton setBackgroundColor:[UIColor grayColor]];
        numberbutton.textColor = [UIColor grayColor];
        numberbutton.text = @"0";
    }
    
    
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
