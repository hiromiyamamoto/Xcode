//
//  Asobi01ViewController.m
//  CompanyHomepage
//
//  Created by Mac User on 13/09/06.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "Asobi01ViewController.h"

@interface Asobi01ViewController ()

@end

@implementation Asobi01ViewController{

    IBOutlet UIWebView *WebViewGamen;
    IBOutlet UINavigationItem *NaviTiltle;

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
    NaviTiltle.title = self.strTitle;

    
    //指定したページを読み込む
    NSURL *url = [NSURL URLWithString:self.strURL];
    [WebViewGamen loadRequest:[NSURLRequest requestWithURL:url]];
    
    //ピンチイン／アウトの可否を設定する
    WebViewGamen.scalesPageToFit = YES;
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
