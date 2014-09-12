//
//  ViewController.m
//  kankolist
//
//  Created by Mac User on 2013/11/09.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{


    //TableViewインスタンス
    IBOutlet UITableView *tableview;
    
    //NSMutableArrayインスタンス
    NSMutableArray *feeds;
    
    //URL(文字列)を格納する為のインスタンス
    NSString *selectedURL;
    NSString *selectedTitle;

}

//Table Viewのセクション数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//Table Viewのセルの数を指定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [feeds count];
}


//各セルにタイトルをセット
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //セルのスタイルを標準のものに指定
    static NSString *CellIdentifier = @"kankoListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //行を取得
    int gyo = [indexPath row];
    
    //タイトル設定
    cell.textLabel.text = [feeds[gyo] objectForKey:@"01"];
    
    //サブタイトル設定
    cell.detailTextLabel.text = [feeds[gyo] objectForKey:@"02"];
    //写真を取得
    NSString *ImageFileName = [feeds[gyo] objectForKey:@"03"];
    
    //セルのimageプロパティへ写真を設定
    cell.imageView.image = [UIImage imageNamed:ImageFileName];
    
    return cell;
}


//リスト中のお気に入りアイテムが選択された時の処理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int gyo = [indexPath row];
    selectedURL = [feeds[gyo] objectForKey:@"04"];
    selectedTitle = [feeds[gyo] objectForKey:@"01"];
    
    [self performSegueWithIdentifier:@"ToWebViewController" sender:self];
    
}

//Segue発動時に画面遷移先へ渡したいオブジェクトや値があればこのメソッド内で記載する。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //セグエのidentiferが「toWebView」の時、
    if ([[segue identifier] isEqualToString:@"ToWebViewController"]) {
        
        //ToWebViewControllerのインスタンス(TWVC)を作成し
        WebViewController *TWVC = (WebViewController*)[segue destinationViewController];
        
        //ToWebViewController(TWVC)のプロパティ（strURL）へselectedURLを代入
        TWVC.strURL = selectedURL;
        TWVC.strTitle = selectedTitle;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ファイル名(GunmaList.plist)を取得する
    NSString *path = [[NSBundle mainBundle]pathForResource:@"GunmaList" ofType:@"plist"];
    //配列(feeds)を生成する
    feeds = [NSArray arrayWithContentsOfFile:path];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
