//
//  TestDrawView.m
//  FSLTools
//
//  Created by 付顺龙 on 2019/2/28.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "TestDrawView.h"

@implementation TestDrawView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    CGContextSetLineWidth(context, 1.0);
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, 0 );
    
    CGContextAddLineToPoint(context, 0, 100);
    
    CGContextAddLineToPoint(context, 100, 200);
    
    CGContextAddLineToPoint(context, 0, 0);
    
    CGContextStrokePath(context);
}
/*
 @property (nonatomic,strong) UILabel *label;
 @property (nonatomic,strong) TestDrawView *tView;
 @property (nonatomic,strong) UITextField *text;
 //    [self.view addSubview:self.label];
 //    [self.view addSubview:self.text];
 //    CALayer *redLayer = [CALayer layer];
 //    redLayer.frame = CGRectMake(50, 50, 100, 100);
 //    redLayer.backgroundColor = [UIColor redColor].CGColor;
 //    [self.layerView.layer addSublayer:redLayer];
 //    self.tView = [[TestDrawView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
 //    [self.view addSubview:self.tView];
 //    NSString *content = @"askdfjakjshdfahs";
 //    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:content];
 //    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, str.length)];
 //    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width*3/5.0, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
 //    rect.size.width = rect.size.width+1.5;
 //    rect.size.height = rect.size.height>30?rect.size.height:30;
 //    NSLog(@"width :::: %.2f",rect.size.width);
 //    NSLog(@"height :: %.2f",rect.size.height);
 //
 //    NSLog(@"###############");
 //    CGSize size =  [content measureWithFont:[UIFont systemFontOfSize:15] Width:[UIScreen mainScreen].bounds.size.width*3/5.0];
 //    CGSize size =  [content measureSizeWithFont:[UIFont systemFontOfSize:15] Width:[UIScreen mainScreen].bounds.size.width*3/5.0];
 //    NSLog(@"my :: %.2f",size.width);
 //    NSLog(@"my :: %.2f",size.height);
 
 //    _textMessageLabelSize = rect.size;
 //    _messageCellHeight += _textMessageLabelSize.height + [OcssMessageBubbleView appearance].textSendInsets.top + [OcssMessageBubbleView appearance].textSendInsets.bottom;
 //    self.view.backgroundColor = [UIColor blackColor];
 //    UIView *view = [UIView new];
 //    view.frame =CGRectMake(100, 100, 100, 100);
 ////    view.backgroundColor = [UIColor whiteColor];
 //    [self.view addSubview:view];
 //    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
 //    lbl.text = @"123123123123123";
 ////    lbl.textColor = [UIColor whiteColor];
 //    lbl.backgroundColor = [UIColor whiteColor];
 ////    lbl.textColor = [UIColor blackColor];
 //    [self.view addSubview:lbl];
 //}
 -(UITextField *)text {
 if (!_text) {
 _text =[[UITextField alloc] init];
 _text.delegate = self;
 //        _text.frame = CGRectMake(100, 300, LableW, 44);
 _text.backgroundColor = [UIColor yellowColor];
 }
 return _text;
 }
 -(UILabel *)label {
 if (!_label) {
 _label = [[UILabel alloc] init];
 _label.font = [UIFont systemFontOfSize:15];
 _label.numberOfLines = 0;
 _label.backgroundColor = [UIColor orangeColor];
 }
 return _label;
 }
 -(BOOL)textFieldShouldReturn:(UITextField *)textField {
 [textField resignFirstResponder];
 NSString *content = textField.text;
 self.label.text = textField.text;
 //    CGSize s = [content measureSizeWithFont:[UIFont systemFontOfSize:15] Width:LableW];
 NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:content];
 [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, str.length)];
 CGRect s = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width*3/5.0, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
 
 CGRect rect = CGRectMake(100, 100, s.size.width, s.size.height>30?s.size.height:30);
 if (s.size.width > LableW) {
 rect.size.width = LableW;
 }
 NSLog(@"%.2f %.2f",s.size.width,s.size.height);
 self.label.frame = rect;
 return YES;
 }
 */


@end
