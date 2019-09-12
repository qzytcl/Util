//
//  CommentContentCell.h
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/11.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CommentContentCell;

@protocol CommentContentCellDelegate <NSObject>

-(void)clickUpSub:(CommentContentCell *)cell;
-(void)clickReplySub:(CommentContentCell *)cell;
@end

@interface CommentContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *contentText;
@property (weak, nonatomic) IBOutlet UILabel *upText;
@property (weak, nonatomic) IBOutlet UILabel *replyText;
@property (weak, nonatomic) IBOutlet UILabel *timeText;
@property (weak, nonatomic) IBOutlet UIImageView *upIcon;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (nonatomic,weak) id<CommentContentCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
