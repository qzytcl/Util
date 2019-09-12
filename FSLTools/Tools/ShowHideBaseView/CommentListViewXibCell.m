//
//  CommentListViewXibCell.m
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/11.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "CommentListViewXibCell.h"
#import "UIView+Gesture.h"
@implementation CommentListViewXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userIcon.layer.cornerRadius = 29.0/2;
    self.userIcon.backgroundColor = [UIColor redColor];
    self.userIcon.layer.masksToBounds = YES;
    
    [self.upIcon addTarget:self Gesture:@"upAction"];
    [self.upText addTarget:self Gesture:@"upAction"];
    [self.replyText addTarget:self Gesture:@"replyAction"];
}
-(void)upAction {
    if ([_delegate respondsToSelector:@selector(clickUp:)]) {
        [_delegate clickUp:self];
    }
}
-(void)replyAction {
    if ([_delegate respondsToSelector:@selector(clickReply:)]) {
        [_delegate clickReply:self];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
