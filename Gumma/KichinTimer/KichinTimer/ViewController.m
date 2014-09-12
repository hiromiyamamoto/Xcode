//
//  ViewController.m
//  KichinTimer
//
//  Created by Mac User on 13/10/04.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{

    //UIパーツとの接続
    IBOutlet UILabel *minLabel; //分ラベル
    IBOutlet UILabel *secLabel; //秒ラベル
    IBOutlet UILabel *douLabel; //小数点以下ラベル
    IBOutlet UIButton *StartButton; //Startボタン
    IBOutlet UIButton *Button1; //1分ボタン
    IBOutlet UIButton *Button3; //3分ボタン
    IBOutlet UIButton *Button5; //5分ボタン
    IBOutlet UIButton *Button10; //10分ボタン
    
    //メモリーに一時的に保存する機能（変数(variable)）
    double CurrentCount; //現在の秒数
    int tmpCurrentCount; //計算用
    int minCount; //分
    int secCount; //秒
    int douCount; //小数点以下
    
    //クラス(設計図)から作られた実物（インスタンス）
    NSTimer *TimerObject; //時間を管理するオブジェクト
}


//1分のボタンが押されたときのメソッド
-(IBAction)PushedButton1:(id)sender{
    
    //CurrentCount変数に60秒を代入
    CurrentCount = 60;
    tmpCurrentCount = CurrentCount;
    minCount = CurrentCount / 60; //minCount変数へ60で割った値を代入
    secCount = tmpCurrentCount % 60; //secCount変数へ60で割ったあまりの値を代入
    douCount = (CurrentCount - tmpCurrentCount) * 100;
    
    minLabel.text = [NSString stringWithFormat:@"%02d",minCount];
    secLabel.text = [NSString stringWithFormat:@"%02d",secCount];
    douLabel.text = [NSString stringWithFormat:@"%02d",douCount];

}

//3分のボタンが押されたときのメソッド
-(IBAction)PushedButton3:(id)sender{
    
    //CurrentCount変数に180秒を代入
    CurrentCount = 180;

    [self LabelUpdate];
    
}

//5分のボタンが押されたときのメソッド
-(IBAction)PushedButton5:(id)sender{
    
    //CurrentCount変数に300秒を代入
    CurrentCount = 300;
    
    [self LabelUpdate];

    
}

//10分のボタンが押されたときのメソッド
-(IBAction)PushedButton10:(id)sender{
    
    //CurrentCount変数に600秒を代入
    CurrentCount = 600;
    
    
    [self LabelUpdate];
    
}


//ラベル更新用
-(void)LabelUpdate{
    
    tmpCurrentCount = CurrentCount;
    minCount = CurrentCount / 60; //minCount変数へ60で割った値を代入
    secCount = tmpCurrentCount % 60; //secCount変数へ60で割ったあまりの値を代入
    douCount = (CurrentCount - tmpCurrentCount) * 100;
    
    minLabel.text = [NSString stringWithFormat:@"%02d",minCount];
    secLabel.text = [NSString stringWithFormat:@"%02d",secCount];
    douLabel.text = [NSString stringWithFormat:@"%02d",douCount];
}

- (void)tick:(NSTimer *)theTimer {
    
    if(CurrentCount > 0){
        CurrentCount = CurrentCount - 0.01;
        [self LabelUpdate];
        
    }else{
        [TimerObject invalidate];
        
    }
}

- (IBAction)PushedButtonStart:(id)sender {

    // タイマーオブジェクトが動いているかを確認してBOOL変数へ代入(True or False)
    // （isValid はタイマーオブジェクトの存在有無を確認してくれるメソッド）
    BOOL b = [TimerObject isValid];
    
    if(b){
        
        //タイマーオブジェクトを止める
        [TimerObject invalidate];
        [StartButton setTitle:@"START" forState:UIControlStateNormal];
        Button1.userInteractionEnabled = YES;
        Button3.userInteractionEnabled = YES;
        Button5.userInteractionEnabled = YES;
    
    }else{
    
        //タイマーオブジェクトを開始
        TimerObject = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(tick:) userInfo:nil repeats:YES];
        
        [StartButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        Button1.userInteractionEnabled = NO;
        Button3.userInteractionEnabled = NO;
        Button5.userInteractionEnabled = NO;
    
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
