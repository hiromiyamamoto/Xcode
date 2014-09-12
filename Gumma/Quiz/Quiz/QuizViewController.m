//
//  QuizViewController.m
//  Quiz
//
//  Created by Mac User on 2013/11/30.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
{
    //問題（Problemクラスのインスタンス）を格納する配列
    NSMutableArray *problemSet;
    //出題する問題数
    int totalProblems;
    //現在の進捗（出題済み問題数）を記録
    int currentProblem;
    //正答数
    int correctAnswers;
    //問題文を表示するText View
    IBOutlet UITextView *problemText;
}

//問題の読み込み
- (void)loadProblemSet {
    // ファイルの読み込み
    NSString* path = [[NSBundle mainBundle] pathForResource:@"quiz" ofType:@"csv"];
    NSError* error = nil;
    int enc = NSUTF8StringEncoding;
    NSString* text = [NSString stringWithContentsOfFile:path encoding:enc error:&error];
    // 行ごとに分割し、配列「lines」に格納
    NSArray* lines = [text componentsSeparatedByString:@"\n"];
    
    // 問題を格納する可変配列のproblemSetを初期化
    problemSet = [[NSMutableArray alloc] init];
    
    // 問題の数だけ繰り返し
    for(int i=0; i<[lines count]; i++){
        
        //問題をカンマで区切って、要素を配列「items」に格納
        NSArray* items = [[lines objectAtIndex:i] componentsSeparatedByString:@","];
        
        //Problemクラスのインスタンスを生成・初期化し、問題文と答えを格納
        Problem *p = [Problem initProblem];
        NSString *q = [items objectAtIndex:0];
        int a = [[items objectAtIndex:1] intValue];
        [p setQ:q withA:a];
        
        //新たに生成したProblemクラスのインスタンスをproblemSetに追加
        [problemSet addObject:p];
    }
    
}

//問題文をシャッフル
- (void)shuffleProblemSet {
    
    //problemSetに格納された全問題の数を取得
    int totalQuestions = (int)[problemSet count];
    //Fisher-Yatesアルゴリズム用のカウンターを取得
    int i = totalQuestions;
    
    //Fisher-Yatesアルゴリズムによって配列の要素をシャッフル
    while (i > 0) {
        //乱数を発生
        srand((unsigned int)time(0));
        int j = rand() % i;
        //要素を並び替え
        [problemSet exchangeObjectAtIndex:(i-1) withObjectAtIndex:j];
        //カウンターを減少させる
        i = i - 1;
    } 
}

//次の問題提示 or 全問時終わっていたら結果表画面へ
- (void)nextProblem {
    
    //currentProblemを繰り上げ
    currentProblem++;
    
    //これまで出題した問題が、提示問題数に達していない場合
    if (currentProblem < totalProblems) {
        //次の問題の問題文を提示
        problemText.text = [[problemSet objectAtIndex:currentProblem] getQ];
        
        //全問題解き終わった場合
    } else {
        
        //結果表示画面へのSegueを始動
        [self performSegueWithIdentifier:@"toResultView" sender:self];
    }
}

//結果表示画面へのSegueの発動
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //正答率を算出
    int percentage = (correctAnswers * 100 / totalProblems) ;
    
    //ResultViewController（RVC）のインスタンスを作成し、
    //RVCクラスのメンバー変数である「correctPercentage」に値を渡す
    if ([[segue identifier] isEqualToString:@"toResultView"]) {
        ResultViewController *rvc = (ResultViewController*)[segue destinationViewController];
        rvc.correctPercentage = percentage;
    }
}

//「○」ボタンが押された場合
- (IBAction)answerIsTrue:(id)sender {
    //答えを確認し、次の問題を提示
    if ([[problemSet objectAtIndex:currentProblem] getA] == 0) {
        correctAnswers++;
    }
    [self nextProblem];
}

//「×」ボタンが押された場合
- (IBAction)answerIsFalse:(id)sender {
    //答えを確認し、次の問題を提示
    if ([[problemSet objectAtIndex:currentProblem] getA] == 1) {
        correctAnswers++;
    }
    [self nextProblem];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //クイズ問題を読み込み
    [self loadProblemSet];
    //クイズ問題をランダムに並び替え（シャッフル）
    [self shuffleProblemSet];
    
    //提示問題数を10問とする
    totalProblems = 10;
    
    //現在の問題番号と正答数を0にする
    currentProblem = 0;
    correctAnswers = 0;
    
    //problemSetの最初の要素の問題文をクイズ画面にセット
    problemText.text = [[problemSet objectAtIndex:currentProblem] getQ];
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
