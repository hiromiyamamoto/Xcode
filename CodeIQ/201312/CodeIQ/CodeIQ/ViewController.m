//
//  ViewController.m
//  CodeIQ
//
//  Created by Mac User on 2013/12/18.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [myTextField resignFirstResponder];
    myLabel.text = myTextField.text;
    
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //TextFieldの設定
    myTextField = [[UITextField alloc] initWithFrame:CGRectMake(35, 160, 250, 60)];
    [[myTextField layer] setMasksToBounds:YES];
    [[myTextField layer] setCornerRadius:10.0f];
    [[myTextField layer] setBorderWidth:3.0f];
    [[myTextField layer] setBorderColor:[UIColor blackColor].CGColor];
    myTextField.delegate = self;
    myTextField.keyboardType = UIKeyboardTypeDefault;
    myTextField.textColor = [UIColor blueColor];
    myTextField.clearButtonMode = UITextFieldViewModeAlways;
    myTextField.placeholder = @"文字を入力してください";
    myTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:myTextField];

    //Labelの設定
    myLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 50, 250, 60)];
    [[myLabel layer] setMasksToBounds:YES];
    [[myLabel layer] setCornerRadius:10.0f];
    [[myLabel layer] setBorderWidth:3.0f];
    [[myLabel layer] setBorderColor:[UIColor redColor].CGColor];
    myLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:myLabel];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
