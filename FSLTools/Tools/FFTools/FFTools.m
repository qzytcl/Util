
//
//  FFTools.m
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/10.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "FFTools.h"

@implementation FFTools
+(void)wkWebViewAdapter:(WKWebView *)webView Finished:(void (^)(CGFloat, CGFloat))block {
    dispatch_group_t group = dispatch_group_create();
    __block CGFloat tW = 0.0,tH = 0.0;
    dispatch_group_enter(group);
    //scrollHeight scrollWidth
    [webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        tH = [result floatValue];
        dispatch_group_leave(group);
    }];
    dispatch_group_enter(group);
    [webView evaluateJavaScript:@"document.body.offsetWidth" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
        tW = [result floatValue];
        dispatch_group_leave(group);
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (block) {
            block(tW,tH);
        }
    });
}
+(void)wkWebViewAdapterScreenWidth:(WKWebView *)webView Finished:(void (^)(CGFloat, CGFloat))block {
    [FFTools wkWebViewAdapterScreenWidth:webView Finished:^(CGFloat width, CGFloat height) {
        if (block) {
            CGFloat ScreenWidth = [UIScreen mainScreen].bounds.size.width;
            CGFloat scale = ScreenWidth/width;
            block(ScreenWidth,height*scale);
        }
    }];
}
@end