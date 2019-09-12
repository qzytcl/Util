//
//  ShowHideBaseView.h
//  Dolife_iOS
//
//  Created by 付顺龙 on 2019/8/23.
//  Copyright © 2019 张志超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+Gesture.h"
//屏幕宽度
#define WIDTH  [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define ScaleX WIDTH/375.0
#define AdapX(x) ((x)*ScaleX)

NS_ASSUME_NONNULL_BEGIN

@interface ShowHideBaseView : UIView

@property (nonatomic,strong) UIView *content;

-(void)show;
-(void)hide;
@end

NS_ASSUME_NONNULL_END
