//
//  MSAData.m
//  Mayorships
//
//  Created by Daniel Merrill on 8/19/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//


///////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                    HOMEWORK
//
//- Create singleton class named MSAData with singleton method mainData    √
//- Add two array properties to the singleton (VendorsWithMayors & VendorsWithoutMayors)      √
//- Add method to fill both arrays based on response from foursquare request      
//- Add a third view controller to Storyboard and make it a third tab
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////



#import "MSAData.h"

@implementation MSAData
{
    
}

+ (MSAData *)mainData;

{
    static dispatch_once_t create;
    
    static MSAData * singleton = nil;
    
    
    dispatch_once(&create, ^{
        
        singleton = [[MSAData alloc] init];
        
        
    });
    
    return singleton;
    
}



- (void)fillArrays
{
    
    // run MSARequest and fill arrays with return array
    
    
    
}



@end
