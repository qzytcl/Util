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

@property (nonatomic,strong) FFListView *listView;

@property (nonatomic,strong) NSArray *arr;
@end

@implementation ViewController

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
    NSLog(@"%@",@(row));
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"123" message:@"456" preferredStyle:UIAlertControllerStyleAlert];
    NSString *title = @"123";
    NSMutableAttributedString *titleAtt = [[NSMutableAttributedString alloc] initWithString:title];
    [titleAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, title.length)];//字体
    [titleAtt addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, title.length)];//颜色
    [controller setValue:titleAtt forKey:@"attributedTitle"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];

    [controller addAction:confirmAction];
    [controller addAction:cancelAction];
    
    [self logViews:controller.view];
    
    [self presentViewController:controller animated:YES completion:nil];
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
