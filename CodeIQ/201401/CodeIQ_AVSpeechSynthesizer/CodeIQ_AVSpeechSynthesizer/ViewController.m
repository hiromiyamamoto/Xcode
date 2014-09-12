//
//  ViewController.m
//  CodeIQ_AVSpeechSynthesizer
//
//  Created by Mac User on 2014/01/18.
//  Copyright (c) 2014年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(IBAction)Button1{
    [[AVSpeechSynthesizerManager sharedManager] playAVSpeechSynthesizer:@"100" LanNo:26];
}
-(IBAction)Button2{
    [[AVSpeechSynthesizerManager sharedManager] playAVSpeechSynthesizer:@"100" LanNo:31];
}
-(IBAction)Button3{
    [[AVSpeechSynthesizerManager sharedManager] playAVSpeechSynthesizer:@"100" LanNo:35];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
