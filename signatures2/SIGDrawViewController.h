//
//  SIGDrawViewController.h
//  signatures2
//
//  Created by Daniel Merrill on 8/14/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SIGDrawView;

@interface SIGDrawViewController : UIViewController

@property (nonatomic) SIGDrawView * drawView;


- (void) cancelButtonClicked;

-(UIImage *)getSignature;

@end
