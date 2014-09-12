//
//  Problem.m
//  Quiz
//
//  Created by Mac User on 2013/11/30.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "Problem.h"

@implementation Problem{
    //問題文
    NSString *question;
    //答え（「○」なら「0」、「×」なら「1」）
    int answer;
}

//初期化処理
+ (id)initProblem {
    return [[self alloc] init];
}

//問題文と答えを格納
- (void)setQ:(NSString *)q withA:(int)a {
    question = q;
    answer = a;
}

//問題文を読み出し
- (NSString *)getQ {
    return question;
}

//答えを読み出し
- (int)getA {
    return answer;
}


@end
