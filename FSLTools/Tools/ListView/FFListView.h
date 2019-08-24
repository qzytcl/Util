//
//  FFListView.h
//  FSLTools
//
//  Created by 付顺龙 on 2019/8/24.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FFListViewDelegate <NSObject>
@optional
-(void)clickViewForRow:(NSInteger)row;
@end

@protocol FFListViewDataSource <NSObject>
@optional
-(UIView *)viewforRow:(NSInteger)row;
-(NSInteger)viewCount;
-(NSInteger)viewRowCount;
-(CGFloat)viewMarginLeft;
-(CGFloat)viewMarginTop;
-(CGFloat)viewWidth;
-(CGFloat)viewHeight;

@end

@interface FFListView : UIView

@property (nonatomic,weak) id<FFListViewDelegate> delegate;
@property (nonatomic,weak) id<FFListViewDataSource> datasource;
-(void)reloadList;

@end

NS_ASSUME_NONNULL_END
