//
//  MFCViewController.h
//  MyFaceIsCool
//
//  Created by Daniel Merrill on 8/21/14.
//  Copyright (c) 2014 Daniel Merrill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFCViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController * picker;
    UIImagePickerController * picker2;
    UIImage * image;
}



@end
