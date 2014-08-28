//
//  SCRSlideView.h
//  Scribbles
//
//  Created by Daniel Merrill on 8/4/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCRSlideViewDelegate;

@interface SCRSlideView : UIView

@property (nonatomic) float maxWidth;

@property (nonatomic) float minWidth;

@property (nonatomic) float currentWidth;



//potentially will use to change slider color
@property (nonatomic) UIColor * linecolior;

@property (nonatomic, assign) id <SCRSlideViewDelegate> delegate;

@end

@protocol  SCRSlideViewDelegate <NSObject>

- (void)updateLineWidth:(float)lineWidth;






@end