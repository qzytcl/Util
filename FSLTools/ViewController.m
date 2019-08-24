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
}
@end
