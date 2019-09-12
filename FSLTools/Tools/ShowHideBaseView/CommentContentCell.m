//
//  CommentContentCell.m
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/11.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "CommentContentCell.h"
#import "UIView+Gesture.h"
@implementation CommentContentCell

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
    if ([_delegate respondsToSelector:@selector(clickUpSub:)]) {
        [_delegate clickUpSub:self];
    }
}
-(void)replyAction {
    if ([_delegate respondsToSelector:@selector(clickReplySub:)]) {
        [_delegate clickReplySub:self];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
