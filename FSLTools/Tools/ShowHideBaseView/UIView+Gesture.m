//
//  UIView+Gesture.m
//  Dolife_iOS
//
//  Created by 付顺龙 on 2019/8/2.
//  Copyright © 2019 张志超. All rights reserved.
//

#import "UIView+Gesture.h"

@implementation UIView (Gesture)
-(void)addTarget:(id)target Gesture:(NSString *)sel {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:NSSelectorFromString(sel)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

@end
