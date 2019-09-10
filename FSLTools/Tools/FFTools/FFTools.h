//
//  FFTools.h
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/10.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface FFTools : NSObject
+ (void)wkWebViewAdapter:(WKWebView *)webView Finished:(void(^)(CGFloat width,CGFloat height))block;
+ (void)wkWebViewAdapterScreenWidth:(WKWebView *)webView Finished:(void(^)(CGFloat width,CGFloat height))block;

@end

NS_ASSUME_NONNULL_END
