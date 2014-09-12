//
//  FirstViewController.m
//  Otoasobi
//
//  Created by Mac User on 2013/10/12.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController{

    //AVAudioPlayerインスタンス
    AVAudioPlayer *oto1;
    AVAudioPlayer *oto2;
    AVAudioPlayer *oto3;
    AVAudioPlayer *oto4;
    AVAudioPlayer *oto5;
    AVAudioPlayer *oto6;
    AVAudioPlayer *oto7;
    AVAudioPlayer *oto8;
    AVAudioPlayer *oto9;
    AVAudioPlayer *oto10;
    AVAudioPlayer *oto11;
    AVAudioPlayer *oto12;
    AVAudioPlayer *oto13;
    AVAudioPlayer *oto14;
    AVAudioPlayer *oto15;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ファイル名作成
    NSString *Poto1 = [[NSBundle mainBundle] pathForResource:@"do" ofType:@"wav"];
    NSString *Poto2 = [[NSBundle mainBundle] pathForResource:@"re" ofType:@"wav"];
    NSString *Poto3 = [[NSBundle mainBundle] pathForResource:@"mi" ofType:@"wav"];
    NSString *Poto4 = [[NSBundle mainBundle] pathForResource:@"fa" ofType:@"wav"];
    NSString *Poto5 = [[NSBundle mainBundle] pathForResource:@"so" ofType:@"wav"];
    NSString *Poto6 = [[NSBundle mainBundle] pathForResource:@"ra" ofType:@"wav"];
    NSString *Poto7 = [[NSBundle mainBundle] pathForResource:@"si" ofType:@"wav"];
    NSString *Poto8 = [[NSBundle mainBundle] pathForResource:@"do1" ofType:@"wav"];
    NSString *Poto9 = [[NSBundle mainBundle] pathForResource:@"re1" ofType:@"wav"];
    NSString *Poto10 = [[NSBundle mainBundle] pathForResource:@"mi1" ofType:@"wav"];
    NSString *Poto11 = [[NSBundle mainBundle] pathForResource:@"fa1" ofType:@"wav"];
    NSString *Poto12 = [[NSBundle mainBundle] pathForResource:@"so1" ofType:@"wav"];
    NSString *Poto13= [[NSBundle mainBundle] pathForResource:@"ra1" ofType:@"wav"];
    NSString *Poto14 = [[NSBundle mainBundle] pathForResource:@"si1" ofType:@"wav"];
    NSString *Poto15= [[NSBundle mainBundle] pathForResource:@"do2" ofType:@"wav"];
    
    //ファイルパス生成
    NSURL *url1 = [NSURL fileURLWithPath:Poto1];
    NSURL *url2 = [NSURL fileURLWithPath:Poto2];
    NSURL *url3 = [NSURL fileURLWithPath:Poto3];
    NSURL *url4 = [NSURL fileURLWithPath:Poto4];
    NSURL *url5 = [NSURL fileURLWithPath:Poto5];
    NSURL *url6 = [NSURL fileURLWithPath:Poto6];
    NSURL *url7 = [NSURL fileURLWithPath:Poto7];
    NSURL *url8 = [NSURL fileURLWithPath:Poto8];
    NSURL *url9 = [NSURL fileURLWithPath:Poto9];
    NSURL *url10 = [NSURL fileURLWithPath:Poto10];
    NSURL *url11 = [NSURL fileURLWithPath:Poto11];
    NSURL *url12 = [NSURL fileURLWithPath:Poto12];
    NSURL *url13 = [NSURL fileURLWithPath:Poto13];
    NSURL *url14 = [NSURL fileURLWithPath:Poto14];
    NSURL *url15 = [NSURL fileURLWithPath:Poto15];
    
    //インスタンス(oto1～oto15)代入
    oto1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url1 error:NULL];
    oto2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:NULL];
    oto3 = [[AVAudioPlayer alloc] initWithContentsOfURL:url3 error:NULL];
    oto4 = [[AVAudioPlayer alloc] initWithContentsOfURL:url4 error:NULL];
    oto5 = [[AVAudioPlayer alloc] initWithContentsOfURL:url5 error:NULL];
    oto6 = [[AVAudioPlayer alloc] initWithContentsOfURL:url6 error:NULL];
    oto7 = [[AVAudioPlayer alloc] initWithContentsOfURL:url7 error:NULL];
    oto8 = [[AVAudioPlayer alloc] initWithContentsOfURL:url8 error:NULL];
    oto9 = [[AVAudioPlayer alloc] initWithContentsOfURL:url9 error:NULL];
    oto10 = [[AVAudioPlayer alloc] initWithContentsOfURL:url10 error:NULL];
    oto11 = [[AVAudioPlayer alloc] initWithContentsOfURL:url11 error:NULL];
    oto12 = [[AVAudioPlayer alloc] initWithContentsOfURL:url12 error:NULL];
    oto13 = [[AVAudioPlayer alloc] initWithContentsOfURL:url13 error:NULL];
    oto14 = [[AVAudioPlayer alloc] initWithContentsOfURL:url14 error:NULL];
    oto15 = [[AVAudioPlayer alloc] initWithContentsOfURL:url15 error:NULL];
    
}

//baibu
-(IBAction)playSoundBaibu:(id)sender{
    //バイブ
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}


//oto1
-(IBAction)playSound1:(id)sender{
    [oto1 play];
}

//oto2
-(IBAction)playSound2:(id)sender{
    [oto2 play];
}

//oto3
-(IBAction)playSound3:(id)sender{
    [oto3 play];
}

//oto4
-(IBAction)playSound4:(id)sender{
    [oto4 play];
}

//oto5
-(IBAction)playSound5:(id)sender{
    [oto5 play];
}

//oto6
-(IBAction)playSound6:(id)sender{
    [oto6 play];
}

//oto7
-(IBAction)playSound7:(id)sender{
    [oto7 play];
}

//oto8
-(IBAction)playSound8:(id)sender{
    [oto8 play];
}

//oto9
-(IBAction)playSound9:(id)sender{
    [oto9 play];
}

//oto10
-(IBAction)playSound10:(id)sender{
    [oto10 play];
}

//oto11
-(IBAction)playSound11:(id)sender{
    [oto11 play];
}

//oto12
-(IBAction)playSound12:(id)sender{
    [oto12 play];
}

//oto13
-(IBAction)playSound13:(id)sender{
    [oto13 play];
}

//oto14
-(IBAction)playSound14:(id)sender{
    [oto14 play];
}

//oto15
-(IBAction)playSound15:(id)sender{
    [oto15 play];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
