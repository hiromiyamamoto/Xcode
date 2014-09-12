//
//  ResultViewController.m
//  Smartball
//
//  Created by Mac User on 2013/11/23.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController{

    //結果時間表示するためのラベル
    IBOutlet UILabel *ResultLabel;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//画面表示時に動くメソッド
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ResultLabel.text = [NSString stringWithFormat:@"%.2f 秒",self.timerCountG];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
