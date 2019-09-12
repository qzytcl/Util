//
//  CommentContentView.h
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/11.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "ShowHideBaseView.h"
#import "CommentListView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommentContentView : ShowHideBaseView
@property (nonatomic,strong) NSMutableArray *arr;
@property (nonatomic,strong) CommentListView *backview;
@end

NS_ASSUME_NONNULL_END
