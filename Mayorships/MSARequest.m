//
//  MSARequest.m
//  Mayorships
//
//  Created by Daniel Merrill on 8/19/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "MSARequest.h"

#define API @"https://api.foursquare.com/v2/"

#define CLIENT_ID @"152ZQL033YH2UZIQCPMNIBRIHEEVAINIDLY2YPLFJMZY0TDC"

#define CLIENT_SECRET @"UU4TUWHUBR1FAPZD1SZTSB0FN1ZXC3VVOPBM00GFPRY4PXHF"

//venues/search?
//ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD"

@implementation MSARequest


//+ (NSArray *)findMayorshipsWithLocation:(CLLocation *)location

+(void)findMayorshipsWithLocation:(CLLocation *)location completion:(void (^)(NSArray *mayors))completion
{
//    NSArray * venues = [MSARequest findVenuesWithLocation:location];
    
    
   [MSARequest findVenuesWithLocation:location completion:^(NSArray *venues) {
       
       NSMutableArray * mayors = [@[] mutableCopy];
       
       
       for (NSDictionary * venue in venues)
       {
           NSString * endpoint = [NSString stringWithFormat:@"venues/%@", venue[@"id"]];
           
           //NSDictionary * venueInfo = [MSARequest foursquareRequestWithEndpoint:endpoint andParameters:@{}];
           
           [MSARequest foursquareRequestWithEndpoint:endpoint andParameters:@{} completion:^(NSDictionary *responseInfo) {
               
               
               
               NSDictionary * mayor = responseInfo [@"response"][@"venue"][@"mayor"];
               
               if(mayor) [mayors addObject:mayor];
               
               if(completion) completion(mayors);

           }];
           
           
           
       }
       

       
   }];
    
    //return mayors;
}

+(void)findVenuesWithLocation:(CLLocation *)location completion:(void(^)(NSArray * venues))completion
{
    NSDictionary * parameters = @{
                                  @"ll" : [NSString stringWithFormat:@"%f,%f", location.coordinate.latitude,location.coordinate.longitude]
                                      };
    
    
    [MSARequest foursquareRequestWithEndpoint:@"venues/search" andParameters:parameters completion:^(NSDictionary *responseInfo) {
        
        
        if (completion) completion(responseInfo [@"response"][@"venues"]);
        
    }];
    
    
   // return [MSARequest foursquareRequestWithEndpoint:@"venues/search" andParameters:parameters][@"response"][@"venues"];
}

+ (void)foursquareRequestWithEndpoint:(NSString *)endpoint andParameters:(NSDictionary *)parameters completion:(void(^)(NSDictionary * responseInfo)) completion
{
   
    NSMutableString * requestString = [[API stringByAppendingString:endpoint] mutableCopy];
    
    // make v custom to current day
    
    [requestString appendString:[NSString stringWithFormat:@"?client_id=%@&client_secret=%@&v=20140819",CLIENT_ID,CLIENT_SECRET]];
    
    for (NSString *key in [parameters allKeys])
    {
            [requestString appendFormat:@"&%@=%@", key, [parameters objectForKey:key]];
    }
    
    //NSString * endpointURL = [API stringByAppendingString:endpoint];
    //NSURL * requestURL = [NSURL URLWithString:[API stringByAppendingString:endpointURL]];
    
    NSLog(@"%@", requestString);
    
    NSURL * requestURL = [NSURL URLWithString:requestString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
//    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary * responseInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if (completion) completion(responseInfo);
        
    }];
     
     
    
    
   // NSLog(@"%@", responseInfo);
    
   // return responseInfo;

    
    
}


//NSURL * url = [NSURL URLWithString:____ Info[@"avatar_url"]];
//
//NSData * data = [NSData dataWithContentsOfURL:url];
//
//mayorImage.image = [UIImage imageWithData:data];
//

@end
