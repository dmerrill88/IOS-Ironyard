//
//  MSARequest.h
//  Mayorships
//
//  Created by Daniel Merrill on 8/19/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@interface MSARequest : NSObject

+ (void)findMayorshipsWithLocation:(CLLocation *)location completion:(void (^)(NSArray * mayors)) completion;

+ (void)findVenuesWithLocation:(CLLocation *)location completion:(void(^)(NSArray * venues))completion;

@end
