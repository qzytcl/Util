//
//  ViewController.m
//  FSLTools
//
//  Created by 付顺龙 on 2019/1/17.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "ViewController.h"
#import "Views/TestDrawView.h"
#import "FFListView.h"
#import "CommentListView.h"
//#import "NSString+FSLString.h"
//#include <netdb.h>
//#include <ifaddrs.h>
//#include <arpa/inet.h>
//#include <netdb.h>
//#include <sys/socket.h>
//
//#include <resolv.h>
//#include <dns.h>
//
//#import <sys/sysctl.h>
//#import <netinet/in.h>
//#include <net/route.h>

#import <objc/runtime.h>
#define kWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<FFListViewDataSource,FFListViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UILabel *lbl2;
@property (weak, nonatomic) IBOutlet UILabel *lbl1;

@property (nonatomic,strong) FFListView *listView;

@property (nonatomic,strong) NSArray *arr;
@property (nonatomic,strong) CommentListView *commentView;
@end

@implementation ViewController
-(CommentListView *)commentView {
    if (!_commentView) {
        _commentView = [CommentListView new];
    }
    return _commentView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
}
-(void)createViews {
    self.listView = [FFListView new];
    self.listView.delegate = self;
    self.listView.datasource = self;
    [self.view addSubview:self.listView];
    self.listView.frame = CGRectMake(0, 100, kWidth, 500);
    
    self.arr = @[@"",@"",@""];
    [self.listView reloadList];
    [[NSBundle mainBundle] localizedStringForKey:@"" value:@"" table:nil];
}
-(NSInteger)viewCount {
    return self.arr.count;
}
-(UIView *)viewforRow:(NSInteger)row {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    return view;
}
-(void)clickViewForRow:(NSInteger)row {
    [self.commentView show];
}
-(void)logViews:(UIView *)view {
    
    if (view.subviews.count == 0) {
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *lbl = (UILabel *)view;
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:lbl.text];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, lbl.text.length)];
            lbl.attributedText = str;
            
        }
        NSLog(@"%@",[view class]);
    }else {
        for (UIView *t in view.subviews) {
            [self logViews:t];
        }
    }

}
@end
