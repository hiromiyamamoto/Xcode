//
//  ViewController.m
//  TimerArart
//
//  Created by Mac User on 13/04/23.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    IBOutlet UILabel *minLabel;
    IBOutlet UILabel *secLabel;
    IBOutlet UILabel *douLabel;
    IBOutlet UIButton *StartButton;
    IBOutlet UIButton *Button1;
    IBOutlet UIButton *Button3;
    IBOutlet UIButton *Button5;
    IBOutlet UIButton *Button10;
    
    double CurrentCount;
    int tmpCurrentCount;
    int minCount;
    int secCount;
    int douCount;
    NSString *StrlertView;
    
    NSTimer *TimerObject;
    
}

- (void)tick:(NSTimer *)theTimer {
    
    if(CurrentCount > 0){
        CurrentCount = CurrentCount - 0.01;
        [self LabelUpdate];
        
    }else{
        [TimerObject invalidate];
        
        //アラートビューの生成と設定
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"終了"
                              message:StrlertView
                              delegate:self
                              cancelButtonTitle:@"了解" otherButtonTitles:nil];
        alert.delegate = self;
        
        [alert show];
    }
}


// アラートのボタンが押された時に呼ばれるデリゲート例文
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    [StartButton setTitle:@"START" forState:UIControlStateNormal];
    Button1.userInteractionEnabled = YES;
    Button3.userInteractionEnabled = YES;
    Button5.userInteractionEnabled = YES;
    Button10.userInteractionEnabled = YES;
    
}


//ラベル更新用
-(void)LabelUpdate{
    tmpCurrentCount = CurrentCount;
    minCount = CurrentCount / 60;
    secCount =  tmpCurrentCount % 60;
    douCount = (CurrentCount - tmpCurrentCount) * 100;
    minLabel.text = [NSString stringWithFormat:@"%02d",minCount];
    secLabel.text = [NSString stringWithFormat:@"%02d",secCount];
    douLabel.text = [NSString stringWithFormat:@"%02d",douCount];
}

- (IBAction)PushedButton1:(id)sender {
    CurrentCount = 60;
    StrlertView = @"1分経ちました。";
    
    [self LabelUpdate];
}
- (IBAction)PushedButton3:(id)sender {
    CurrentCount = 180;
    StrlertView = @"3分経ちました。";
    
    [self LabelUpdate];

}

- (IBAction)PushedButton5:(id)sender {
    CurrentCount = 300;
    
    StrlertView = @"5分経ちました。";
    [self LabelUpdate];    
}

- (IBAction)PushedButton10:(id)sender {
    CurrentCount = 600;
    
    StrlertView = @"10分経ちました。";
    [self LabelUpdate];
}


- (IBAction)PushedButtonStart:(id)sender {

    BOOL b = [TimerObject isValid];
    
    if(b){
            [TimerObject invalidate];
            [StartButton setTitle:@"START" forState:UIControlStateNormal];
            Button1.userInteractionEnabled = YES;
            Button3.userInteractionEnabled = YES;
            Button5.userInteractionEnabled = YES;
            Button10.userInteractionEnabled = YES;
        
    }else{
    
        TimerObject = [NSTimer scheduledTimerWithTimeInterval:0.01f
                                                       target:self
                                                     selector:@selector(tick:)
                                                     userInfo:nil
                                                      repeats:YES];
        
        [StartButton setTitle:@"STOP" forState:UIControlStateNormal];
        Button1.userInteractionEnabled = NO;
        Button3.userInteractionEnabled = NO;
        Button5.userInteractionEnabled = NO;
        Button10.userInteractionEnabled = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CurrentCount = 0 ;
    [self LabelUpdate];
    
    [StartButton setTitle:@"START" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end