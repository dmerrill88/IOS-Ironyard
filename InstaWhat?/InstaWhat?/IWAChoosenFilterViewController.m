//
//  IWAFilterPictureViewController.m
//  InstaWhat?
//
//  Created by Daniel Merrill on 8/25/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import "IWAChoosenFilterViewController.h"

#import <Parse/Parse.h>

@interface IWAFilterPictureViewController () <UITextViewDelegate>

@end

@implementation IWAFilterPictureViewController
{
    UIView * captionHolder;
    
    UITextView * captionView;
    
    UIImageView  * imageView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        
               imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        
                imageView.contentMode = UIViewContentModeScaleAspectFit;
        
                [self.view addSubview:imageView];
 
        
        captionHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 310, 320, [UIScreen mainScreen].bounds.size.height - 310)];
        
        captionHolder.backgroundColor = [UIColor lightGrayColor];
        
        captionHolder.layer.borderWidth = 10;
        
        captionHolder.layer.borderColor = [UIColor whiteColor].CGColor;
        
        [self.view addSubview:captionHolder];
        
        captionView = [[UITextView alloc] initWithFrame:CGRectMake(20, 20, 280, captionHolder.frame.size.height - 70)];
        
        captionView.delegate = self;
        
        [captionHolder addSubview:captionView];
        
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(20, captionHolder.frame.size.height - 60, 280, 40)];
        
        submitButton.backgroundColor = [UIColor orangeColor];
        
        [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
        
        [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [submitButton addTarget:self action:@selector(saveFace) forControlEvents:UIControlEventTouchUpInside];
        
        [captionHolder addSubview:submitButton];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
        
        
        //ui textview captionview; captionview.delegete = self
        //
        
        
        
        
        // add subview to everything
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return self;
}

-(void)saveFace
{
    PFObject * face = [PFObject objectWithClassName:@"Faces"];
    
    [face setObject:captionView.text forKey:@"text"];
    
    NSData * data = UIImagePNGRepresentation(imageView.image);
    
    PFFile * file = [PFFile fileWithData:data];
    
    [face setObject:file forKey:@"image"];
    
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        NSNotificationCenter * nc =[NSNotificationCenter defaultCenter];
        
        [nc postNotificationName:@"facesaved" object:nil];
        
    }];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        
        captionHolder.center = CGPointMake(captionHolder.center.x, captionHolder.center.y - 216);
        
    }];
}





-(void) setFilteredImage:(UIImage *) filteredImage
{
//    _filteredImage = filteredImage;
//    
//    imageView.image = filteredImage;
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

@end