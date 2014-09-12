//
//  gameViewController.m
//  Smartball
//
//  Created by Mac User on 2013/11/23.
//  Copyright (c) 2013年 HiromiYamamoto. All rights reserved.
//

#import "gameViewController.h"

//　加速度センサから値を取得する間隔
#define kAccelerometerFrequency 20.0f
//　加速度センサの感度を制限する
#define kFilteringFactor 0.2f
//　加速度センサの感度を制限する
#define kFilteringFactor 0.2f
//　タイマーの間隔
#define kTimerInterval 0.01f
//　あたり判定用の玉の半径
#define kRadius 26.0f
//　壁反射の度合い
#define kWallRefPower 0.8f

@interface gameViewController ()

@end

@implementation gameViewController

{
    //Labelインスタンス（場所）
    IBOutlet UILabel *labelGoal;
    
    //Labelインスタンス（タイム）
    IBOutlet UILabel *labelTime;
    
    //ImageViewインスタンス(ゴール)
    IBOutlet UIImageView *imgGoal;
    
    //ImageViewインスタンス(ボール)
    IBOutlet UIImageView *imgBoll;
    
    //変数（小数点）（タイマー用）
    float timerCount;
    
    // あそびを付けた各軸座標の値
    UIAccelerationValue accelX, accelY, accelZ;
    
    // 玉の加速度
    CGSize vec;
    
    // タイマー
    NSTimer *aTimer;
    
    //NSMutableArrayインスタンス(出題問題用配列)
    NSMutableArray *feeds;
    
    //変数intQuestionCnt(現在の問題数用）
    int intQuestionCnt;
    
    //変数intTotalQuestionCnt(総問題数用）
    int intTotalQuestionCnt;
    
    //加速度センサー（MotionManager）オブジェクト
    CMMotionManager *motionManager;
    
}

//
////　加速度に変化が起こったときに呼ばれるメソッド
//- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
//{
//    // 取得した加速度の値に制限を加えて「あそび」をつくる（x,y,z軸それぞれ）
//    accelX = (accelX * kFilteringFactor) + ([acceleration x] * (1.0f - kFilteringFactor));
//    accelY = (accelY * kFilteringFactor) + ([acceleration y] * (1.0f - kFilteringFactor));
//    accelZ = (accelZ * kFilteringFactor) + ([acceleration z] * (1.0f - kFilteringFactor));
//    //　加速度により玉を動かすための座標を生成する
//    vec = CGSizeMake(vec.width+accelX, vec.height-accelY);
//
//}

- (void)didAccelerateWithData:(CMAccelerometerData *)accelerometerData
{
    // 取得した加速度の値に制限を加えて「あそび」をつくる（x,y,z軸それぞれ）
    accelX = (accelX * kFilteringFactor) + (accelerometerData.acceleration.x * (1.0f - 0.2f));
    accelY = (accelY * kFilteringFactor) + (accelerometerData.acceleration.y * (1.0f - 0.2f));
    accelZ = (accelZ * kFilteringFactor) + (accelerometerData.acceleration.z * (1.0f - 0.2f));
    //　加速度により玉を動かすための座標を生成する
    vec = CGSizeMake(vec.width+accelX, vec.height-accelY);
}

//　加速度センサを終了するメソッド
-(void)stopAccelerometer {
    
    
    //加速度停止
     [motionManager stopAccelerometerUpdates];
    
//    // 加速度センサを利用するために読み込む
//    UIAccelerometer *theAccelerometer = [UIAccelerometer sharedAccelerometer];
//    //　加速度センサのデリゲートに何もセットせず、値を取得しない処理
//    [theAccelerometer setDelegate:nil];

}

////　加速度センサを開始するメソッド
//-(void)startAccelerometer {
//    //　加速度センサを利用するために読み込む
//    UIAccelerometer *theAccelerometer = [UIAccelerometer sharedAccelerometer];
//    //　加速度センサを読み込む間隔を設定
//    [theAccelerometer setUpdateInterval:(1.0f / kAccelerometerFrequency)];
//    //　自分自身をデリゲートにセットして加速度センサを利用する
//    [theAccelerometer setDelegate:self];
//}

// タイマーを使って玉を動かすメソッド
- (void)tick:(NSTimer *)theTimer {
    
    timerCount = timerCount + 0.01;
    labelTime.text =[NSString stringWithFormat:@"%.2f",timerCount];
    
    //　ボールの中心点のx座標に加速度で取得した値を加算する
    CGFloat x = [imgBoll center].x+vec.width;
    //　ボールの中心点y座標に加速度で取得した値を加算する
    CGFloat y = [imgBoll center].y+vec.height;
    // もし、移動先の座標（ボールの半径も加味）が320よりも大きい時
    if ( (x+kRadius) > 320 ) {
        // 反射させるための座標を設定
        vec.width = fabs(vec.width)*(-1) * kWallRefPower;
        //　玉を移動させる先の座標
        x = [imgBoll center].x+vec.width;
    }
    if ( (x-kRadius) < 0 ) {
        vec.width = fabs(vec.width)*kWallRefPower;
        x = [imgBoll center].x+vec.width;
    }
    //画面サイズ（縦の幅）を取得（iPhone5も考慮して端末の画面サイズを取得）
    int screenSizeHeight =[[UIScreen mainScreen]bounds].size.height;
    if ( (y+kRadius) > screenSizeHeight ) {
        vec.height = fabs(vec.height)*(-1) * kWallRefPower;
        y = [imgBoll center].y+vec.height;
    }
    if ( (y-kRadius) < 0 ) {
        vec.height = fabs(vec.height)* kWallRefPower;
        y = [imgBoll center].y+vec.height;
    }
    //　玉の中心座標を指定する
    [imgBoll setCenter:CGPointMake(x,y)];
    
    [self checkGoal];
}


//セグエの発動時に実行するメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //発動したセグエ名(toKekkaView)の判定
    if ([[segue identifier] isEqualToString:@"toResultView"]) {

        //解答数を「ResultViewControllerのKekkaVCプロパティ(変数)へ格納」
        ResultViewController *ResultVC =
        (ResultViewController*)[segue destinationViewController];
        
        //結果代入
        ResultVC.timerCountG = timerCount;
    }
}


//判定メソッド
-(void)checkGoal {
    
    //旗の距離を計算する
    CGFloat dx = ([imgGoal center].x - [imgBoll center].x);
    CGFloat dy = ([imgGoal center].y - [imgBoll center].y);
    
    
    //　もし、ゴールと玉の距離が一定距離以下になったら（平方根計算）
    if ( sqrt(dx*dx+dy*dy) < 30 ) {
        
        if (  intQuestionCnt >= intTotalQuestionCnt ){
            
            //タイマー停止
            [aTimer invalidate];
            
            //加速度センサー停止
            [self stopAccelerometer];
            
            //セグエの発動
            [self performSegueWithIdentifier:@"toResultView" sender:self];
            
            return;
            
        }
        
        NSString *intString = [feeds[intQuestionCnt] objectForKey:@"iti"];
        labelGoal.text = [NSString stringWithFormat:@"%@",intString];
        
        float loc_x = [[feeds[intQuestionCnt] objectForKey:@"x"]floatValue];
        float loc_y = [[feeds[intQuestionCnt] objectForKey:@"y"]floatValue];
        
        imgGoal.center = CGPointMake(loc_x, loc_y);
        
        intQuestionCnt ++;
    }
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

    //ファイル名(qasetting.plist)を取得する
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Tizu" ofType:@"plist"];
    
    //配列(feeds)を生成する
    feeds = [NSArray arrayWithContentsOfFile:path];
    
    
    //総問題数(intTotalQuestionCnt)設定
    intTotalQuestionCnt = (int)[feeds count];
    
    //現在の問題数(intQuestionCnt)初期設定
    intQuestionCnt =0;

    //タイマーカウントへ0を代入
    timerCount = 0;
    
    //加速度センサー（MotionManager）開始
    motionManager = [[CMMotionManager alloc] init];
    [motionManager setAccelerometerUpdateInterval:1.0f / kAccelerometerFrequency];
    [motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
                                        withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                            dispatch_sync(dispatch_get_main_queue(), ^{
                                                [self didAccelerateWithData:accelerometerData];
                                            });
                                        }];
//    //加速度センサーを有効にする
//    [self startAccelerometer];
    
    [self startTimer];
    
}

// タイマーをストップさせるメソッド
-(void)stopTimer {
    //　もしタイマーが存在するとき
    if ( aTimer ) {
        //　タイマーを無効にする
        [aTimer invalidate];
        //　タイマーに何もセットしない
        aTimer = nil;
    }
}


// タイマーを開始するメソッド
-(void)startTimer {
    //　もしタイマーが存在するなら
    if ( aTimer ){
        //タイマーを終了させるメソッドを呼ぶ
        [self stopTimer];
    }
    
    //タイマーをセットする
    aTimer = [NSTimer scheduledTimerWithTimeInterval:
              kTimerInterval target:self selector:@selector(tick:)
                                            userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
