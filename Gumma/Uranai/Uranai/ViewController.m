//
//  ViewController.m
//  Uranai
//
//  Created by Mac User on 2013/10/12.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    //背景
    IBOutlet UIImageView *imgBackgraund;
    //今日の運勢ボタン
    IBOutlet UIButton *btnUnsei;
    //占い結果画面
    IBOutlet UIImageView *imgKekka;
    //戻るボタン
    IBOutlet UIButton *btnModoru;
}

- (IBAction)UranaiPushed:(id)sender {
    
    //配列に占い結果を格納する
    NSArray *gazouitiran = @[@"daikiti.png",@"daikyo.png",@"kiti.png",@"kyo.png",@"suekiti.png",@"syokiti.png",@"tyukiti.png"];
  
    //乱数を設定(0〜6の値をランダムに設定する)
    int r = arc4random() % 7;
    
    //結果表示画面に占い結果を設定する
    imgKekka.image = [UIImage imageNamed:gazouitiran[r]];
    
    //表示設定
    imgBackgraund.hidden = YES;
    btnUnsei.hidden = YES;
    imgKekka.hidden = NO;
    btnModoru.hidden = NO;

    //アニメーション対象オブジェクトの設定
    imgKekka.alpha = 0.0;
    btnModoru.alpha = 0.0;
    
    //アニメーション設定
    [UIView beginAnimations:nil context:nil];
    
    //アニメーションの時間（秒）
    [UIView setAnimationDuration:5];
    
    //アニメーション対象オブジェクトの設定
    imgKekka.alpha = 1.0;
    btnModoru.alpha = 1.0;
    
    //アニメーション開始
    [UIView commitAnimations];
    
}

//戻るボタンを押したときの動作
- (IBAction)Modoru:(id)sender {
    
    //表示設定
    imgBackgraund.hidden = NO;
    btnUnsei.hidden = NO;
    imgKekka.hidden =YES;
    btnModoru.hidden = YES;
 
}



//起動時に実行される命令(メソッド)
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //表示設定
    imgBackgraund.hidden = NO;
    btnUnsei.hidden = NO;
    imgKekka.hidden =YES;
    btnModoru.hidden = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
