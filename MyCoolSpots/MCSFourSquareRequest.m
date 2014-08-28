//
//  MCSFourSquareRequest.m
//  MyCoolSpots
//
//  Created by Daniel Merrill on 8/18/14.
//  Copyright (c) 2014 Heidi Proske. All rights reserved.
//

#import "MCSFourSquareRequest.h"

//https://api.foursquare.com/v2/venues/explore?oauth_token=JBCMC5XOA5GEDN4GBDCRH32HATBDUN0W4SSEBYDLGMU1YAFP&v=20140818&ll=40.759211,-73.984638

@implementation MCSFourSquareRequest

///////////////////////////////////////////////////////////////////////////////////////////////////////////

//+ (NSDictionary *) requestVenueinfo: (NSString *)venueName
//{
//    
//    NSString * urlString = [NSString stringWithFormat: @"https://api.foursquare.com/v2/venues/explore?oauth_token=JBCMC5XOA5GEDN4GBDCRH32HATBDUN0W4SSEBYDLGMU1YAFP&v=20140818&ll=40.759211,-73.984638"];
//    
//
//    NSURL * url = [NSURL URLWithString:urlString];
//    
//    NSURLRequest * request = [NSURLRequest requestWithURL:url];
//    
//    
//    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:url];
//    
//    [mutableRequest setHTTPMethod:@"GET"];
//    
//    //mutableRequest.HTTPMethod = @"POST";
//
//    
//    NSURLResponse * response = nil;
//    
//    NSError * error = nil;
//    
//    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    NSDictionary * venueInfo= [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
//    
//    
//    
//    
//    
//    NSLog(@"response data = %@",venueInfo);
//    
//    return venueInfo;
//
//    
//
//}
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////


@end
