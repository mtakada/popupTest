//
//  ViewController.m
//  popupTest
//
//  Created by takada on 2015/01/20.
//  Copyright (c) 2015年 jp.ne.interspace. All rights reserved.
//

#import "ViewController.h"
#import "PopupViewController.h"
#import "UIViewController+MJPopupViewController.h"

@interface ViewController ()

@end

@implementation ViewController :UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openPopup:(id)sender {
    PopupViewController *popupView = [[PopupViewController alloc] initWithNibName:@"sample" bundle:nil];
    [self presentPopupViewController:popupView animationType:MJPopupViewAnimationFade];
}

@end
