//
//  STANewGroupViewConrtoller.m
//  Simple Tasks
//
//  Created by Daniel Merrill on 7/30/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "STANewGroupViewConrtoller.h"

@interface STANewGroupViewConrtoller () <UITextFieldDelegate>

@end

@implementation STANewGroupViewConrtoller

{
    UITextField * groupNameField;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView * fieldbar = [[UIView alloc] initWithFrame:CGRectMake(20, 60,SCREEN_WIDTH - 40, 1)];
    fieldbar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:fieldbar];
    
    
    groupNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH -40, 40)];
    [self.view addSubview:groupNameField];
    groupNameField.delegate = self;
    [groupNameField becomeFirstResponder];
    
    
    UIButton * cancelGroup = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2- 110, 80, 100, 100)];
    
    [cancelGroup setImage:[UIImage imageNamed:@"group_close"] forState:UIControlStateNormal];
    
    [cancelGroup addTarget:self action:@selector(cancelGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    
    cancelGroup.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:cancelGroup];
    
    
    UIButton * saveGroup = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 +10 , 80, 100, 100)];
    
    [saveGroup setImage:[UIImage imageNamed:@"group_save"] forState:UIControlStateNormal];
    
    [saveGroup addTarget:self action:@selector(saveGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    
    saveGroup.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:saveGroup];
    
    
    
    
    // Do any additional setup after loading the view.
    
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




- (void)cancelGroupClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveGroupClicked
{
    [self.groups addObject:[@{
                              @"name":groupNameField.text,
                              @"items":[@[] mutableCopy]
                              
                              } mutableCopy]];
    
    [self cancelGroupClicked];
    
}

@end
