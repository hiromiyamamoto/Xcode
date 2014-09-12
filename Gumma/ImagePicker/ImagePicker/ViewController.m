//
//  ViewController.m
//  ImagePicker
//
//  Created by Mac User on 2013/11/23.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//イメージピッカーコントローラを初期化する
- (IBAction)selectPhoto:(UIBarButtonItem *)sender
{
    //フォトライブラリを利用できるかどうかチェックする
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        //イメージピッカーコントローラを作る
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        //UIImagePickerControllerDelegateのデリゲートになる
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        //フォトライブラリから画像を取り込む設定にする
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //フォトライブラリから画像を選ぶ
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

//「Use」ボタンのデリゲートメソッド
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	//編集済み画像
	UIImage *editedImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
    //イラスト画像
    UIImage * sunImage = [UIImage imageNamed:@"santa.png"];
    //サイズ
    
    CGSize theSize = CGSizeMake(640, 640);
    CGRect theRect = CGRectMake(0,0,640,640);
    float posx = (theSize.width - editedImage.size.width)/2;
    float posy = (theSize.height - editedImage.size.height)/2;
    
    //合成開始
    UIGraphicsBeginImageContext(theSize);
    
    //背景の描画
    CGContextRef context = UIGraphicsGetCurrentContext();//コンテキストを取得
    CGContextStrokeRect(context, theRect);// 四角形の描画
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);//黒
    CGContextFillRect(context, theRect);//塗りつぶす
    
    //編集済み画像の合成
    [editedImage drawInRect:CGRectMake(posx, posy, editedImage.size.width, editedImage.size.height)];
    
    //イラスト画像の合成
    [sunImage drawInRect:CGRectMake(0, 0, sunImage.size.width, sunImage.size.height)];
    //合成画像の取得
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    //合成終了
    UIGraphicsEndImageContext();
    
    //合成画像をカメラロールに保存する
    UIImageWriteToSavedPhotosAlbum(resultImage, nil, nil, nil);
    //最初の画面のイメージビューに編集済み画像を表示する
    _myImageView.image = editedImage;
    
    //最初の画面に戻る
    [self dismissViewControllerAnimated:YES completion:nil];
}


//「Cancel」ボタンのデリゲートメソッド
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //最初の画面に戻る
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
