//
//  SCRSlideView.m
//  Scribbles
//
//  Created by Daniel Merrill on 8/4/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "SCRSlideView.h"

@implementation SCRSlideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        // Initialization code
        
        
        self.maxWidth = 20;
        
        self.minWidth = 1;

        self.currentWidth = 1;
        
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.linecolior set];
    
    float minY = 0;
    
    float maxY  = rect.size.height;
    
    
    
    CGContextMoveToPoint(context, rect.size.width / 2.0, minY);
    CGContextAddLineToPoint(context, rect.size.width / 2.0, maxY);
    
    CGContextStrokePath(context);
    
    
    float currentY = maxY - (self.currentWidth / self.maxWidth) * maxY;
    
    
    NSLog(@"%f", currentY);
    
    CGContextFillEllipseInRect(context, CGRectMake((rect.size.width - 10)/ 2, currentY, 10, 10));
    
    CGContextSetBlendMode(context, kCGBlendModeClear);
    
    CGContextFillEllipseInRect(context, CGRectMake((rect.size.width - 8)/ 2, currentY + 1, 8, 8));
  
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
                               
                               {
                                   [self changeWidthWithTouches:touches];
                               }
                               
                               
                               
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event


{
    [self changeWidthWithTouches:touches];

}


- (void)changeWidthWithTouches: (NSSet *)touches

{
    UITouch * touch = [touches allObjects] [0];
    CGPoint location = [touch locationInView:self];
    
    
    
    
    self.currentWidth = self.maxWidth - (location.y / self.frame.size.height * self.maxWidth);
    
    if (self.currentWidth < self.minWidth) self.currentWidth = self.minWidth;
    
    if (self.currentWidth > self.maxWidth) self.currentWidth = self.maxWidth;
    
    [self.delegate updateLineWidth:self.currentWidth];
    
    [self setNeedsDisplay];
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
