//
//  ResultViewController.m
//  Quiz
//
//  Created by Mac User on 2013/11/30.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController{
    
    //各種ラベル
    IBOutlet UILabel *percentageLabel;
    IBOutlet UILabel *levelLabel;
    
    //一般常識レベルの画像を扱うImage View
    IBOutlet UIImageView *levelImage;
    
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
    //正答率に応じて「一般常識レベル」の位と画像を設定
    if (_correctPercentage < 30) {
        levelLabel.text = @"猿レベル";
        levelImage.image = [UIImage imageNamed:@"monkey.png"];
    } else if (_correctPercentage >= 30 && _correctPercentage < 90) {
        levelLabel.text = @"一般人レベル";
        levelImage.image = [UIImage imageNamed:@"human.png"];
    } else if (_correctPercentage >= 90){
        levelLabel.text = @"神レベル";
        levelImage.image = [UIImage imageNamed:@"god.png"];
    }
    
    //実際の正答率を表示
    percentageLabel.text = [NSString stringWithFormat:@"%d %%", _correctPercentage];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
