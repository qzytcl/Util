//
//  CommentContentTopCell.h
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/11.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CommentContentTopCell;

@protocol CommentContentTopCellDeleagte <NSObject>

-(void)clickUp:(CommentContentTopCell *)cell;
-(void)clickReply:(CommentContentTopCell *)cell;
-(void)clickFollow:(CommentContentTopCell*)cell;
@end
@interface CommentContentTopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *follow;

@property (weak, nonatomic) IBOutlet UILabel *contentText;
@property (weak, nonatomic) IBOutlet UILabel *timeText;
@property (weak, nonatomic) IBOutlet UILabel *replyText;
@property (weak, nonatomic) IBOutlet UIImageView *upIcon;
@property (weak, nonatomic) IBOutlet UILabel *upText;
@property (nonatomic,weak) id<CommentContentTopCellDeleagte> delegate;
@end

NS_ASSUME_NONNULL_END
