//
//  SecondViewController.m
//  Otoasobi
//
//  Created by Mac User on 2013/10/12.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController{

    //AVAudioRecorderインスタンス(録音)
    AVAudioRecorder *audioRecorder;
    
    //AVAudioPlayerインスタンス(再生)
    AVAudioPlayer *audioPlayer;
    
    //NSTimerインスタンス
    NSTimer *timer;
    
    //UIButtonインスタンス(録音ボタン)
    IBOutlet UIButton *btnRecord;
    //UIButtonインスタンス(再生ボタン)
    IBOutlet UIButton *btnPlay;
    //UIButtonインスタンス(停止ボタン)
    IBOutlet UIButton *btnStop;
    //UIButtonインスタンス(ラベル)
    IBOutlet UILabel *LabelStatus;
    //UIProgressViewインスタンス
    IBOutlet UIProgressView *audioProgress;


}

//起動時に実行されるメソッド
- (void)viewDidLoad
{
    [super viewDidLoad];

    //Audio Recording Setup
    NSURL *audioFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory()stringByAppendingString:@"audioRecording.m4a"]];
    
    // 録音の設定 AVNumberOfChannelsKey チャンネル数1
    NSDictionary *audioSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithFloat:44100],AVSampleRateKey,
                                   [NSNumber numberWithInt: kAudioFormatAppleLossless],AVFormatIDKey,
                                   [NSNumber numberWithInt: 1],AVNumberOfChannelsKey,
                                   [NSNumber numberWithInt:AVAudioQualityMedium],AVEncoderAudioQualityKey,nil];
    
    //初期設定
    audioRecorder = [[AVAudioRecorder alloc]
                     initWithURL:audioFileURL
                     settings:audioSettings
                     error:nil];
    
    //ラベルの表示設定
    LabelStatus.text = @"ボイスレコーダー";
    
    //ラベルサイズ自動調整
    LabelStatus.adjustsFontSizeToFitWidth = YES;


}

//録音ボタンが押された時
- (IBAction)recodingPushed:(id)sender {
    
    //タイマー停止
    [timer invalidate];
    
    //再生ボタン非表示
    btnPlay.hidden = YES;
    
    //録音ボタン非表示
    btnRecord.hidden = YES;
    
    //Progress View 非表示
    [audioProgress setHidden:YES];
    
    //ラベル設定
    LabelStatus.text = @"録音中";
    
    // 録音開始
    [audioRecorder record];
    
    
    
}
- (IBAction)StopPushed:(id)sender {
    
    //再生・録音を停止
    [audioPlayer stop];
    [audioRecorder stop];
    
    //初期設定
    NSURL *audioFileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"audioRecording.m4a"]];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileURL error:nil];
    
    //再生ボタン表示
    btnPlay.hidden = NO;
    
    //録音ボタン表示
    btnRecord.hidden = NO;
    
    //ラベル設定
    LabelStatus.text = @"完了";
    
}
- (IBAction)playPushed:(id)sender {
    
    //再生ボタン非表示
    btnPlay.hidden = YES;
    
    //録音ボタン非表示
    btnRecord.hidden = YES;
    
    //ラベル設定
    LabelStatus.text = @"再生中";
    
    //再生実行
    [audioPlayer play];
    
    
    //タイマースタート(Progress View 更新用)
    timer = [NSTimer scheduledTimerWithTimeInterval:0.25
                                             target:self
                                           selector:@selector(updateProgress)
                                           userInfo:nil
                                        repeats:YES];
    
    [audioProgress setHidden:NO];
    
}


//Progress View 更新用メソッド
- (void)updateProgress
{
    //duration=サウンド全体の長さ
    float timeLeft = audioPlayer.currentTime / audioPlayer.duration;
    
    //Progress View 更新
    audioProgress.progress= timeLeft;
    
    //再生完了判定(timeLeftが0に戻ったら完了)
    if (timeLeft == 0){
        
        //タイマーの停止
        [timer invalidate];
        
        //再生ボタン表示
        btnPlay.hidden = NO;
        //録音ボタン表示
        btnRecord.hidden = NO;
        
        //ラベル設定
        LabelStatus.text = @"完了";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
