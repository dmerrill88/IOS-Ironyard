//
//  MFCRootViewController.m
//  My first code App
//
//  Created by Daniel Merrill on 7/22/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "MFCRootViewController.h"

@interface MFCRootViewController () <UITextFieldDelegate>


//declare private properties and methods



@end

@implementation MFCRootViewController

{
}

+ (void)classMethod
{
    
}


- (BOOL)cleanToilet: (NSString *)tool
{
   
   // clean toilet
    
    // if toilet is clean
    return YES;
    
    //if toilet is not clean
    return NO;
    
}

-(void)doSomething
{
    [self cleanToilet:@"plunger"];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"init");
        
        
        self.view.backgroundColor = [UIColor colorWithRed:0.373f green:0.604f blue:0.667f alpha:1.0f];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    
    
    
    
    
    UIButton * resetButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, screenHeight - 120.0, screenWidth - 20.0, 50.0)];
    
    [resetButton setTitle:@"RESET" forState:UIControlStateNormal];
    
    
    
     resetButton.backgroundColor = [UIColor blackColor];
    
    resetButton.layer.cornerRadius = 10.0;
   
    
    [resetButton addTarget:self action:@selector(ResetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:resetButton];
    
    
    
    UIButton * loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, screenHeight - 60.0, screenWidth - 20.0, 50.0)];
    
    [loginButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    
    
    loginButton.backgroundColor = [UIColor colorWithRed:0.529f green:0.859f blue:0.957f alpha:1.0f];
    
    loginButton.titleLabel.textColor = [UIColor blackColor];
    
    loginButton.layer.cornerRadius = 10.0;
    
    [loginButton addTarget:self action:@selector(LoginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
    
    
    
    UITextField * usernameField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 30.0, screenWidth -20.0, 50.0)];
    
    usernameField.backgroundColor = [UIColor whiteColor];
    
    usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    usernameField.placeholder =@"username";

    usernameField.delegate = self;
    
    usernameField.layer.cornerRadius = 10.0;
    
    usernameField.textColor = [UIColor colorWithRed:0.529f green:0.859f blue:0.957f alpha:1.0f];

    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];
    paddingView.backgroundColor = [UIColor whiteColor];
    
    usernameField.leftView = paddingView;
    usernameField.leftViewMode = UITextFieldViewModeAlways;

    
    
    [self.view addSubview:usernameField];
    

    
    UITextField * passwordField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 90.0, screenWidth -20.0, 50.0)];
    
    passwordField.backgroundColor = [UIColor whiteColor];
    
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    passwordField.placeholder =@"Password";
    
    passwordField.layer.cornerRadius = 10.0;
    
    passwordField.textColor = [UIColor colorWithRed:0.529f green:0.859f blue:0.957f alpha:1.0f];

    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];

    passwordField.leftView = paddingView2;
    
    passwordField.leftViewMode = UITextFieldViewModeAlways;

    [passwordField setSecureTextEntry: YES];
    
    passwordField.delegate = self;
    
    [self.view addSubview:passwordField];

    
    
    
    UITextField * emailField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 150.0, screenWidth -20.0, 50.0)];
    
    emailField.backgroundColor = [UIColor whiteColor];
    
    emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    emailField.autocorrectionType = UITextAutocorrectionTypeNo;

    emailField.placeholder =@"Email";
    
    emailField.layer.cornerRadius = 10.0;
    
    emailField.textColor = [UIColor colorWithRed:0.529f green:0.859f blue:0.957f alpha:1.0f];
    
    emailField.keyboardType = UIKeyboardTypeEmailAddress;
    
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];

    emailField.leftView = paddingView3;
    
    emailField.leftViewMode = UITextFieldViewModeAlways;

    
    emailField.delegate = self;
    
    [self.view addSubview:emailField];
    
    
    
    UITextField * phoneField = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 210.0, screenWidth -20.0, 50.0)];
    
    phoneField.backgroundColor = [UIColor whiteColor];
    
    phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    phoneField.placeholder =@"Phone";
    
    phoneField.layer.cornerRadius = 10.0;
   
    phoneField.textColor = [UIColor colorWithRed:0.529f green:0.859f blue:0.957f alpha:1.0f];

    phoneField.keyboardType = UIKeyboardTypePhonePad;
    
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];
    
    phoneField.leftView = paddingView4;
    
    phoneField.leftViewMode = UITextFieldViewModeAlways;

    
    phoneField.delegate = self;
    
    [self.view addSubview:phoneField];

    
    
  
    
    
    
    
    UIButton * redButton = [[UIButton alloc] initWithFrame:CGRectMake(70.0, screenHeight - 210.0, 50.0, 50.0)];
    
    redButton.backgroundColor = [UIColor redColor];
    
    redButton.layer.cornerRadius = 25.0;
    
    [redButton addTarget:self action:@selector(GreenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:redButton];
    
    
    
    
    
    UIButton * yellowButton = [[UIButton alloc] initWithFrame:CGRectMake(125.0, screenHeight - 210.0, 50.0, 50.0)];
    
    yellowButton.backgroundColor = [UIColor yellowColor];
    
    yellowButton.layer.cornerRadius = 25.0;
    
    [yellowButton addTarget:self action:@selector(GreenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:yellowButton];
    
    
    
    
    UIButton * purpleButton = [[UIButton alloc] initWithFrame:CGRectMake(235.0, screenHeight - 210.0, 50.0, 50.0)];
    
    purpleButton.backgroundColor = [UIColor purpleColor];
    
    purpleButton.layer.cornerRadius = 25.0;
    
    [purpleButton addTarget:self action:@selector(GreenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:purpleButton];
    
    
    
    UIButton * orangeButton = [[UIButton alloc] initWithFrame:CGRectMake(180.0, screenHeight - 210.0, 50.0, 50.0)];
    
    orangeButton.backgroundColor = [UIColor orangeColor];
    
    orangeButton.layer.cornerRadius = 25.0;
    
    [orangeButton addTarget:self action:@selector(GreenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:orangeButton];
    
    
    
    UIButton * greenButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0, screenHeight - 210.0, 50.0, 50.0)];
    
    greenButton.backgroundColor = [UIColor greenColor];
    
    greenButton.layer.cornerRadius = 25.0;
    
    [greenButton addTarget:self action:@selector(GreenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:greenButton];
    
    
    
    NSLog(@"view did load");
    // this through below comment
   
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    NSLog(@"text field should return");
    [textField resignFirstResponder];
    return YES;
    // this retracts text bar on phone app
    
    
}



- (void)LoginButtonClicked
{
    
    NSLog(@"button was clicked");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)ResetButtonClicked
{
    NSLog(@"button was clicked");

}

- (void)GreenButtonClicked
{
    NSLog(@"button was clicked");
    
}


- (void)RedButtonClicked
{
    NSLog(@"button was clicked");
    
}





- (void)PurpleButtonClicked
{
    NSLog(@"button was clicked");
    
}









- (void)OrangeButtonClicked
{
    NSLog(@"button was clicked");
    
}







- (void)YellowButtonClicked
{
    NSLog(@"button was clicked");
    
}




@end
