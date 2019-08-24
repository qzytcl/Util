//
//  CallTool.m
//  XiaoQiHui
//
//  Created by 付顺龙 on 2019/4/22.
//  Copyright © 2019 XiaoQiHui. All rights reserved.
//

#import "CallTool.h"

@implementation CallTool
+(void)viewController:(UIViewController*)vc callPhone:(NSString *)phone {
    NSString *deviceType = [UIDevice currentDevice].model;
    if([deviceType  isEqualToString:@"iPod touch"]||[deviceType  isEqualToString:@"iPad"]||[deviceType  isEqualToString:@"iPhone Simulator"]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的设备不能打电话" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [vc presentViewController:alert animated:YES completion:nil];
    }else{
        NSString *cleanedString = [[phone componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
        NSString *escapedPhoneNumber = [cleanedString stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
        NSString *phoneURLString = [NSString stringWithFormat:@"telprompt:%@", escapedPhoneNumber];
        NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
        if ([[UIApplication sharedApplication] canOpenURL:phoneURL]) {
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
                //设备系统为IOS 10.0或者以上的
                [[UIApplication sharedApplication] openURL:phoneURL options:@{} completionHandler:nil];
            }else{
                //设备系统为IOS 10.0以下的
                [[UIApplication sharedApplication] openURL:phoneURL];
            }
        }
    }
}
@end
