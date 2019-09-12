

//
//  ShowHideBaseView.m
//  Dolife_iOS
//
//  Created by 付顺龙 on 2019/8/23.
//  Copyright © 2019 张志超. All rights reserved.
//

#import "ShowHideBaseView.h"

@interface ShowHideBaseView ()

@property (nonatomic,strong) UIView *masking;


@end
@implementation ShowHideBaseView

-(instancetype)init {
    if (self = [super init]) {
        self.frame =CGRectMake(0, 0, WIDTH, HEIGHT);
        [self setUp];
    }
    return self;
}
-(void)setUp {
    [self addSubview:self.masking];
    [self addSubview:self.content];
    self.masking.frame = self.bounds;
//    [self.masking mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//    }];
}
- (UIView *)content {
    if (!_content) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        _content = view;
    }
    return _content;
}
-(UIView *)masking {
    if (!_masking) {
        _masking = [UIView new];
        _masking.backgroundColor = [UIColor blackColor];
        _masking.alpha = 0.09f;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        _masking.userInteractionEnabled = YES;
        [_masking addGestureRecognizer:tap];
    }
    return _masking;
}
#pragma mark action
-(void)show {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    NSArray *arr = window.subviews;
    if (arr.count > 0) {
        for (UIView*obj in arr) {
            if ([obj isKindOfClass:[ShowHideBaseView class]]) {
                [obj removeFromSuperview];
            }
        }
    }
    [window addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        self.center = CGPointMake(WIDTH/2, HEIGHT/2);
    } completion:^(BOOL finished) {
        
    }];
}
-(void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
