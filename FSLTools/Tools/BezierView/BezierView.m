//
//  BezierView.m
//  AnimationDemo
//
//  Created by 付顺龙 on 2018/12/4.
//  Copyright © 2018 Bilos. All rights reserved.
//

#import "BezierView.h"
//[UIScreen mainScreen].bounds.size.width
#define widthM 182
#define bezierM 260
#define DOT_COUNT 3
#define ScreenWidth self.frame.size.width
#define ScreenHeight  self.frame.size.height
//[UIScreen mainScreen].bounds.size.height

@interface BezierView() {
    UIBezierPath *path;
    NSInteger index;
}

@property (nonatomic,strong) UIImageView *dot;

@property (nonatomic,strong) NSMutableArray <UIView *>*dots;

@end

@implementation BezierView

-(UIImageView *)dot {
    if (!_dot) {
        _dot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dot2"]];
        _dot.center = CGPointMake(cos(M_PI/4) * bezierM/2 + ScreenWidth - widthM, bezierM/2 - cos(M_PI/4) * bezierM/2);
    }
    return _dot;
}
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        index = 0;
        self.dots = [NSMutableArray array];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)createDots {
    for (UIView *tDot in self.dots) {
        [tDot removeFromSuperview];
    }
    self.dots = [NSMutableArray array];
    UIView *firstDot = [self createDot];
    firstDot.center = CGPointMake(cos(M_PI/4) * bezierM/2 + ScreenWidth - widthM, bezierM/2 - cos(M_PI/4) * bezierM/2);
    [self.dots addObject:firstDot];
    [self addSubview:firstDot];
    for (NSInteger i = 1; i< DOT_COUNT; i++) {
        UIView *tDot = [self createDot];
        tDot.center = CGPointMake(ScreenWidth - widthM + bezierM/2, 30 + 100 * i);
        [self addSubview:tDot];
        [self.dots addObject:tDot];
    }
}
- (UIView *)createDot {
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, 12, 12);
    view.backgroundColor = [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:1.0];
    view.layer.cornerRadius = 6;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.borderWidth = 2;
    view.clipsToBounds = YES;
    return view;
}
- (void)touchAction {
    if (index > DOT_COUNT - 1) {
        index = 0;
    }
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:self.dots[index].center];
    self.dots[index].backgroundColor = [UIColor colorWithRed:33/255.0 green:78/255.0 blue:247/255.0 alpha:1.0];
    UIView *tDot = self.dots[index];
    tDot.backgroundColor = [UIColor colorWithRed:33/255.0 green:78/255.0 blue:247/255.0 alpha:1.0];
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionTransitionNone animations:^{
        tDot.transform = CGAffineTransformMakeScale(1.4, 1.4);
    } completion:^(BOOL finished) {
        tDot.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
    [self.dots replaceObjectAtIndex:index withObject:tDot];
    CGFloat radiusF = bezierM/2;
    if (index == 0) {
        [path1 addArcWithCenter:CGPointMake(ScreenWidth - widthM, radiusF) radius:radiusF startAngle:M_PI/4*7 endAngle:M_PI*2 clockwise:YES];
    }else if(index == DOT_COUNT - 1){
        [path1 moveToPoint:self.dots.firstObject.center];
    }else {
        [path1 addLineToPoint:self.dots[index + 1].center];
    }
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path1.CGPath;
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO; //animation finished  remove from layer back start
    pathAnimation.duration = .5f;//动画时间
    pathAnimation.repeatCount = 1;
    
    [self.dot.layer addAnimation:pathAnimation forKey:nil];
    index ++;


}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawRect:(CGRect)rect {
    
    path = [UIBezierPath bezierPath];
    //start line
    [path moveToPoint:CGPointMake(0, 0)];
    //end
    [path addLineToPoint:CGPointMake(ScreenWidth - widthM, 0)];
    //circle
    CGFloat radiusF = bezierM/2;
    [path addArcWithCenter:CGPointMake(ScreenWidth - widthM, radiusF) radius:radiusF startAngle:M_PI/2*3 endAngle:M_PI*2 clockwise:YES];
    [path addLineToPoint:CGPointMake(ScreenWidth - widthM + radiusF, ScreenHeight)];
    [path addLineToPoint:CGPointMake(0, ScreenHeight+1)];
    [path addLineToPoint:CGPointMake(-1, 0)];
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.path = path.CGPath;
    
    shapelayer.lineWidth = 0.0f;
    shapelayer.frame = self.bounds;
    shapelayer.strokeColor = [UIColor redColor].CGColor;
    shapelayer.fillColor = [UIColor whiteColor].CGColor;

    [self.layer addSublayer:shapelayer];
    [self createDots];
    [self addSubview:self.dot];
}

@end
