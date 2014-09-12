//
//  MAPViewController.m
//  CompanyHomepage
//
//  Created by Mac User on 13/09/02.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "MAPViewController.h"

@interface MAPViewController ()

@end

@implementation MAPViewController{

    IBOutlet MKMapView *map;

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
    
    // 表示位置を設定（ここでは東京都庁の経度緯度を例としています）
    CLLocationCoordinate2D co;
    co.latitude = 35.68664111; // 経度
    co.longitude = 139.6948839; // 緯度
    [map setCenterCoordinate:co animated:NO];
    
    // 縮尺を指定
    MKCoordinateRegion cr = map.region;
    cr.center = co;
    cr.span.latitudeDelta = 1.0;
    cr.span.longitudeDelta = 1.0;
    
    [map setRegion:cr animated:NO];
    
}

//メール送信ボタンが押されたときの処理
-(IBAction)sendMail:(id)sender {
    
    //件名と本文の内容
    NSString *subject = @"件名";
    NSString *message = [NSString stringWithFormat:@"内容"];
    //MFMailComposeViewControllerを生成
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    //MFMailComposeViewControllerからのDelegate通知を受け取り
    mailPicker.mailComposeDelegate = self;
    //件名を指定
    [mailPicker setSubject:subject];
    //本文を指定
    [mailPicker setMessageBody:message isHTML:false];
    //MailPicker（メール送信画面）を呼び出し
    [self presentViewController:mailPicker animated:YES completion:nil];
}

//メール送信画面終了時に呼び出される
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    //メール画面を閉じる
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
