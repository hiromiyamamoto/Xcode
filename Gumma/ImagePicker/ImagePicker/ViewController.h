//
//  ViewController.h
//  ImagePicker
//
//  Created by Mac User on 2013/11/23.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property  IBOutlet UIImageView *myImageView;

@end
