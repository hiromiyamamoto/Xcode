//
//  ViewController.m
//  Smartball
//
//  Created by Mac User on 2013/11/23.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{

    IBOutlet UIButton *btmtest;

}


-(IBAction)testbtm:(id)sender{

    SecondViewController *secondview;
    //ページを定義
    secondview = [[SecondViewController alloc]initWithNibName:@"SecondView" bundle:nil];
    
    //領域確保する→XIBファイルを開くための初期処理を実行
    [self presentViewController: secondview animated:YES completion: nil];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
