//
//  WebViewController.m
//  kankolist
//
//  Created by Mac User on 2013/11/09.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController{

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
    
    
    //指定したページを読み込む
    NSURL *url = [NSURL URLWithString:self.strURL];
    
    [WebViewGamen loadRequest:[NSURLRequest requestWithURL:url]];
}

// ページ読込開始時にインジケータをくるくるさせる
-(void)webViewDidStartLoad:(UIWebView*)webView{
    
    //ナビゲーションバーのタイトルを設定
    NaviTiltle.title = @"読み込み中";
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{

    //ナビゲーションバーのタイトルを設定
    NaviTiltle.title = self.strTitle;

//    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

}


//画面を閉じるボタン
-(IBAction)goBackHome{
    
    //画面を閉じる（※iOS6から「completion:nil」）
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//戻るボタン
-(IBAction)goBackButton{
    
    //前のページに戻る
    [WebViewGamen goBack];
    
}

//進むボタン
-(IBAction)goForwardButton{
    
    //次のページに進む
    [WebViewGamen goForward];
    
}

//リロードボタン
-(IBAction)reloadButton{
    
    //リロードする
    [WebViewGamen reload];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
