//
//  ImagePicker.m
//  XiaoQiHui
//
//  Created by 付顺龙 on 2019/1/7.
//  Copyright © 2019 XiaoQiHui. All rights reserved.
//

#import "ImagePicker.h"
#import <Photos/Photos.h>

@interface ImagePicker()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end
@implementation ImagePicker
-(void)camerPicker {
    [self choosePicFromCamera];
}
- (void)albumPicker {
    [self choosePicFromAlbum];
}
- (void)videoPicker {
    
}
- (void)createVideoPicker {
    
}
- (void)chooseVideo {
    
}
- (void)choosePicFromCamera {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = (id)self;
        picker.sourceType = sourceType;
        picker.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
        if (self.vc) {
            [self.vc presentViewController:picker animated:YES completion:nil];
        }
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}
- (void)choosePicFromAlbum {
    PHAuthorizationStatus authorStatus = [PHPhotoLibrary authorizationStatus];
    if (authorStatus == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
            }
        }];
    } else if (authorStatus == PHAuthorizationStatusDenied) {
        [self alertAactionMessage:@"是否打开访问相机权限"];
    } else if (authorStatus == PHAuthorizationStatusAuthorized) {

        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = _isCanEdit;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        if (self.vc) {
            [self.vc presentViewController:imagePickerController animated:YES completion:nil];
        }
    };
}
- (void)alertAactionMessage:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSURL *settingUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:settingUrl]) {
            [[UIApplication sharedApplication] openURL:settingUrl options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES} completionHandler:nil];
        }
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
    }]];
    if (self.vc) {
        [self.vc presentViewController:alertController animated:alertController completion:nil];
    }
    
}
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    image = [ImagePicker compressImage:image toTargetWidth:image.size.width / 2];
    NSData *tempData = UIImageJPEGRepresentation(image, 0.1);
    
    [picker dismissViewControllerAnimated:YES completion:^{
        if ([self.delegate respondsToSelector:@selector(clickedImagePicker:ImageData:)]) {
            [self.delegate clickedImagePicker:self ImageData:tempData];
        }
    }];
}
/**
 *  图片缩小
 *
 *  @param sourceImage 图片
 *  @param targetWidth 宽度
 *
 *  @return 图片
 */

+ (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth
{
    CGSize imageSize = sourceImage.size;
    
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetHeight = (targetWidth / width) * height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
