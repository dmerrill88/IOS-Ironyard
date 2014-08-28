//
//  UIEditItemViewController.m
//  Simple Tasks
//
//  Created by Daniel Merrill on 7/30/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "STAEditItemViewController.h"

@interface STAEditItemViewController () <UITextFieldDelegate>

@end

@implementation STAEditItemViewController
{
    UITextField * itemNameField;
    UIButton *dragItemButton;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        self.view.backgroundColor = [UIColor colorWithRed:0.922f green:0.376f blue:0.122f alpha:1.0f];
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    UIView * fieldbar = [[UIView alloc] initWithFrame:CGRectMake(20, 60,SCREEN_WIDTH - 40, 1)];
    
    fieldbar.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:fieldbar];
    
    
    itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH -40, 40)];
    
    
    [self.view addSubview:itemNameField];
    
    itemNameField.delegate = self;
    
    [itemNameField becomeFirstResponder];
    
    
    UIButton * cancelItem = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2- 110, 80, 100, 100)];
    [cancelItem setImage:[UIImage imageNamed:@"item_close"] forState:UIControlStateNormal];
    [cancelItem addTarget:self action:@selector(cancelItemClicked) forControlEvents:UIControlEventTouchUpInside];
    cancelItem.adjustsImageWhenHighlighted = NO;
    [self.view addSubview:cancelItem];
    
    
    UIButton * saveItem = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 +10 , 80, 100, 100)];
    
    [saveItem setImage:[UIImage imageNamed:@"item_save"] forState:UIControlStateNormal];
    
    [saveItem addTarget:self action:@selector(saveItemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    saveItem.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:saveItem];
   
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //UIButton * dragItemButton;
    dragItemButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 10, 60, 60)];
    
   // [dragItemButton setImage:[UIImage imageNamed:@"Xkiaa"] forState:UIControlStateNormal];
    
    dragItemButton.backgroundColor = [UIColor blackColor];
    
    //[dragButton addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
    dragItemButton.adjustsImageWhenHighlighted = NO;
    [self.view addSubview:dragItemButton];
    

////////////////////////////////////////////////////////////////////////////////////////////////////////
    itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH -40, 40)];
    
    
    itemNameField.text = self.itemInfo [@"name"];
    //////
    NSLog(@"dump, %@",itemNameField.text);
   ///////
    [self.view addSubview:itemNameField];
    
    
    // Do any additional setup after loading the view.
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)cancelItemClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveItemClicked
{
    
    NSLog(@"dump %@",itemNameField.text);
    
    
    [self.items addObject:[@{
                              @"name":itemNameField.text,
                              @"priority":@0
                              
                              } mutableCopy]];
    
//    self.itemInfo[@"name"] = itemNameField.text;
//    self.itemInfo[@"name"] = @0;
    
    
    [self cancelItemClicked];
    
    
    
    
}







///////////////////////////////////////////////////////////////////////////////////////////////////////////






- (void) setItemInfo:(NSMutableDictionary *)itemInfo
{
    _itemInfo = itemInfo;
    
 itemNameField= [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH -40, 40)];
   
    itemNameField.text = itemInfo[@"name"];
    itemNameField.delegate = self;
    
    [self.view addSubview:itemNameField];
    
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField

    {
       self.itemInfo[@"name"] = textField.text;
        
        [textField resignFirstResponder];
        
        return YES;
    }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self.view];
    float priority = location.y / SCREEN_HEIGHT *360;
    self.itemInfo[@"priority"] = @(priority);
    NSLog(@"y=%f,", priority/60);
    float priorityHue = priority / 360;
    self.view.backgroundColor =[UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    [self changeColorWithLocation:location];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self.view];
    [self changeColorWithLocation:location];
   // CGPoint location = [touch locationInView:dragItemButton];
    dragItemButton.center = location;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////////////////////////////////////////


-(void)changeColorWithLocation: (CGPoint) location

{
    
    float priority = location.y / SCREEN_HEIGHT *360;
    
    self.itemInfo[@"priority"] = @(priority);
    
    NSLog(@"y=%f,", priority/60);
    
    float priorityHue = priority / 360;
    
    
    self.view.backgroundColor =[UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
}


-(BOOL) prefersStatusBarHidden { return YES; }


@end