//
//  AsobiViewController.m
//  CompanyHomepage
//
//  Created by Mac User on 13/09/06.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "AsobiViewController.h"

@interface AsobiViewController ()

@end

@implementation AsobiViewController{

    //URL(文字列)を格納する為のインスタンス
    NSString *selectedURL;
    NSString *selectedTitle;


}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//群馬のクイズボタンが押されたときに実行
- (IBAction)KuizuButtonPushed:(id)sender {
    
    selectedTitle = @"群馬のクイズ";
    selectedURL = @"http://www.gunmachan-navi.pref.gunma.jp/quiz/";
    
    [self performSegueWithIdentifier:@"ToAsobi01" sender:self];
    
}

//群馬の食ボタンが押されたときに実行
- (IBAction)GummanosyokuButtonPushed:(id)sender {
    
    selectedTitle = @"群馬の食";
    selectedURL = @"http://www.gunmachan-navi.pref.gunma.jp/food/index.php";
    
    [self performSegueWithIdentifier:@"ToAsobi01" sender:self];
}

//群馬のお買い物ボタンが押されたときに実行
- (IBAction)OkaimonoButtonPushed:(id)sender {
    
    selectedTitle = @"群馬のお買い物";
    selectedURL = @"http://www.gunmachan-navi.pref.gunma.jp/room/goods.php";
    
    [self performSegueWithIdentifier:@"ToAsobi01" sender:self];
    
}


//Segue発動時に画面遷移先へ渡したいオブジェクトや値があればこのメソッド内で記載する。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //セグエのidentiferが「toWebView」の時
    if ([[segue identifier] isEqualToString:@"ToAsobi01"]) {
        
        Asobi01ViewController *Asobi01VC = (Asobi01ViewController*)[segue destinationViewController];
        
        Asobi01VC.strURL = selectedURL;
        Asobi01VC.strTitle = selectedTitle;
    }
}





- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
