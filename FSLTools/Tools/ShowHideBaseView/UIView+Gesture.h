//
//  UIView+Gesture.h
//  Dolife_iOS
//
//  Created by 付顺龙 on 2019/8/2.
//  Copyright © 2019 张志超. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gesture)
-(void)addTarget:(id)target Gesture:(NSString *)sel;
@end

NS_ASSUME_NONNULL_END
