//
//  ProViewController.m
//  CompanyHomepage
//
//  Created by Mac User on 13/09/06.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ProViewController.h"

@interface ProViewController ()

@end

@implementation ProViewController{
    
    //UINavigationItem
    IBOutlet UINavigationItem *NaviTiltle;
    
    IBOutlet UIImageView *imagegnnma;
    
    //名前
    IBOutlet UILabel *label01;
    //年齢
    IBOutlet UILabel *label02;
    //生年月日
    IBOutlet UILabel *label03;
    
    //解答
    IBOutlet UILabel *labelans;
    
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

    //ナビゲーションバーのタイトルを設定
    NaviTiltle.title = @"プロフィール";
    
    //タッチイベント有効化
    label01.userInteractionEnabled = YES;
    label02.userInteractionEnabled = YES;
    label03.userInteractionEnabled = YES;

    label01.tag = 100;
    label02.tag = 101;
    label03.tag = 102;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    
    switch (touch.view.tag) {
        //
        case 100:
            labelans.text = @"僕の名前は「ぐんまちゃん」";
            imagegnnma.image = [UIImage imageNamed:@"gunmachan_03.png"];
            break;
        case 101:
            labelans.text = @"年齢は「７歳」です。";
            imagegnnma.image = [UIImage imageNamed:@"gunmachan_06.png"];
            break;
        case 102:
            labelans.text = @"誕生日は「2月22日（うお座）」";
            imagegnnma.image = [UIImage imageNamed:@"gunmachan_10.png"];
            break;
    }
    
}


-(IBAction)goBackHome{
    //画面を閉じる（※iOS6から「completion:nil」）
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
