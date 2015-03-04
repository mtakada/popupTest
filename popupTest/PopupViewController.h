//
//  PopupViewController.h
//  popupTest
//
//  Created by takada on 2015/01/20.
//  Copyright (c) 2015年 jp.ne.interspace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ApvAdKit/CustomInterstitialVideoView.h>

@interface PopupViewController : UIViewController <CustomInterstitialVideoViewDelegate> {
@private
    UIButton *button;
    CustomInterstitialVideoView *adView;
}

@end

