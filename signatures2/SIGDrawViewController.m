//
//  SIGDrawViewController.m
//  signatures2
//
//  Created by Daniel Merrill on 8/14/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "SIGDrawViewController.h"

#import "SIGDrawView.h"

@interface SIGDrawViewController ()

@end

@implementation SIGDrawViewController
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.drawView = [[SIGDrawView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    
    [self.view addSubview:self.drawView];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void) cancelButtonClicked
{
    [self.drawView.scribbles removeAllObjects];
    [self.drawView setNeedsDisplay];
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.drawView];
    
    NSValue * pointValue = [NSValue valueWithCGPoint:location];
    
    self.drawView.currentScribbles = [@[pointValue] mutableCopy];
    
    [self.drawView.scribbles addObject:self.drawView.currentScribbles];

    
    [self.drawView setNeedsDisplay];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.drawView];
    
    NSValue * pointValue = [NSValue valueWithCGPoint:location];
    
    [self.drawView.currentScribbles addObject:pointValue];
    
    [self.drawView setNeedsDisplay];
    
}

-(UIImage *)getSignature
{
    UIImage * image = self.drawView.scribblesImage;
    
    [self cancelButtonClicked];
    
    return image;
}


@end
