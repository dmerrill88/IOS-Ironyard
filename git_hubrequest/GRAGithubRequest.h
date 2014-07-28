//
//  GRAGithubRequest.h
//  git_hubrequest
//
//  Created by Daniel Merrill on 7/28/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRAGithubRequest : NSObject

+ (NSDictionary *) requestUserinfo: (NSString *)username;


@end
