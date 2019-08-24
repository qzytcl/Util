//
//  ImagePicker.h
//  XiaoQiHui
//
//  Created by 付顺龙 on 2019/1/7.
//  Copyright © 2019 XiaoQiHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class ImagePicker;
@protocol ImagePickerDelegate <NSObject>

- (void)clickedImagePicker:(ImagePicker *)picker ImageData:(NSData *)data;

@end
@interface ImagePicker : NSObject

@property (nonatomic, weak)id<ImagePickerDelegate> delegate;
@property (nonatomic,strong) UIViewController *vc;
@property BOOL isCanEdit;

-(void)camerPicker;

-(void)albumPicker;

@end

NS_ASSUME_NONNULL_END
