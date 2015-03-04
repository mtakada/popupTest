//
//  PopupViewController.m
//  popupTest
//
//  Created by takada on 2015/01/20.
//  Copyright (c) 2015年 jp.ne.interspace. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController ()

@property(strong, nonatomic) UIButton *button;
@property(strong, nonatomic) CustomInterstitialVideoView *adView;
@property(strong, nonatomic) UILabel *label;

@end

@implementation PopupViewController :UIViewController

@synthesize button;
@synthesize adView;

- (void)viewDidLoad {
    [super viewDidLoad];    
    // ボタン作成
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(self.view.frame.size.width / 2 - 50,
                                   self.view.frame.size.height / 2 - 50,
                                   100,
                                   100);
    self.button.backgroundColor = [UIColor grayColor];
    self.button.enabled = NO;
    [self.button setTitle:@"動画起動" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(onTapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    // ラベルの作成
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 250)];
    [self.label setText:@"完了後に何か挟む場合はここへ"];
    [self.label setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [self.label setTextColor:[UIColor whiteColor]];
    
    // viewの初期化
    self.adView = [[CustomInterstitialVideoView alloc] init:@"1a477b9b660bf6fca1faddb7d3b2f006"];
    self.adView.delegate = self;
    
    // 動画広告の読み込み
    [self.adView preload:@"istest1"];
}

- (void)readyToPlay:(CustomInterstitialVideoView *)view
{
    NSLog(@"動画広告の読み込み完了");
    self.button.backgroundColor = [UIColor blueColor];
    self.button.enabled = YES;
}

- (void)avDidFailedToPlayAd:(CustomInterstitialVideoView *)view
{
    NSLog(@"動画の読み込み失敗");
}

- (void)onTapButton:(id)sender
{
    NSLog(@"ボタンクリック");
    [self.adView play];
    self.button.backgroundColor = [UIColor grayColor];
    self.button.enabled = NO;
}

- (void)avDidCompletePlayAd:(CustomInterstitialVideoView *)view
{
    NSLog(@"完了後に何か挟む場合はここへ処理を書く");
    [self fitLabelToVideo:view];
    [view addSubview:self.label];
    
}

- (void)avDidCloseAd:(CustomInterstitialVideoView *)view
{
    // ここで色々なリソースを開放するとよい
    NSLog(@"閉じたよ！");
    [self.label removeFromSuperview];
//    [self.adView preload:@"istest1"];
}

- (void)avDidOrientation:(CustomInterstitialVideoView *)view
{
    NSLog(@"画面の向きが変わったよ！");
    [self fitLabelToVideo:view];
}

- (void)fitLabelToVideo:(CustomInterstitialVideoView *)view {
    int x = 0;
    int y = 0;
    
    UIInterfaceOrientation orientation = (UIInterfaceOrientation)[[UIDevice currentDevice] orientation];
    if (orientation == UIInterfaceOrientationLandscapeLeft
        || orientation == UIInterfaceOrientationLandscapeRight) {
        x = view.frame.size.height / 2 - self.label.frame.size.width / 2;
        y = view.frame.size.width / 2 - self.label.frame.size.height / 2;
    } else {
        x = view.frame.size.width / 2 - self.label.frame.size.width / 2;
        y = view.frame.size.height / 2 - self.label.frame.size.height / 2;
    }
    
    self.label.frame = CGRectMake(x, y, self.label.frame.size.width, self.label.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
