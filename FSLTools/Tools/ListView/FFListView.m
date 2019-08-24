
//
//  FFListView.m
//  FSLTools
//
//  Created by 付顺龙 on 2019/8/24.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "FFListView.h"
#import "Masonry.h"
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kAdapterX(value) (value)*(kScreenWidth/375.0f)

@interface FFListView()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *icons;

@end

@implementation FFListView

-(instancetype)init {
    if (self = [super init]) {
        self.icons = [NSMutableArray array];
        self.scrollView = [UIScrollView new];
        [self addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
    }
    return self;
}
-(void)reloadList {
    for (UIView *tIcon in self.icons) {
        [tIcon removeFromSuperview];
    }
    [self.icons removeAllObjects];
    
    CGFloat marginTop = [self marginT],
    marginLeft = [self marginL],
    itemW = [self itemWidth],
    itemH = [self itemHeight];
    
    NSInteger allcount = [self allViewCount],
    row = [self rowCount];;
    
    UIView *lastView = self.scrollView;
    
    for (NSInteger i = 0; i < allcount; i++) {
        UIView *item = [self indexView:i];
        item.tag = i;
        item.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickItem:)];
        [item addGestureRecognizer:tap];
        [self.scrollView addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(itemH);
            make.width.mas_equalTo(itemW);
        }];
        if (i == 0) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastView).offset(marginLeft);
                make.top.offset(0);
            }];
        }else if (i%row == 0) {
            UIView *preview = self.icons[i - 1];
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(marginLeft);
                make.top.equalTo(preview.mas_bottom).offset(marginTop);
            }];
        }else if(i == allcount - 1){
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastView.mas_right).offset(marginLeft);
                make.centerY.equalTo(lastView);
                make.bottom.equalTo(self.scrollView).offset(0);
            }];
        }else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastView.mas_right).offset(marginLeft);
                make.centerY.equalTo(lastView);
            }];
        }
        lastView = item;
        [self.icons addObject:item];
    }
}

-(void)clickItem:(UIGestureRecognizer *)ges {
    NSInteger i = ges.view.tag;
    if ([_delegate respondsToSelector:@selector(clickViewForRow:)]) {
        [_delegate clickViewForRow:i];
    }
}
-(UIView *)indexView:(NSInteger)index {
    if ([_datasource respondsToSelector:@selector(viewforRow:)]) {
        return [_datasource viewforRow:index];
    }
    return [UIView new];
}
-(NSUInteger)allViewCount {
    if ([_datasource respondsToSelector:@selector(viewCount)]) {
        return [_datasource viewCount];
    }
    return 0;
}
-(NSInteger)rowCount {
    if ([_datasource respondsToSelector:@selector(viewRowCount)]) {
        return [_datasource viewRowCount];
    }
    return 5;
}
-(CGFloat)marginT {
    if ([_datasource respondsToSelector:@selector(viewMarginTop)]) {
        return [_datasource viewMarginTop];
    }
    return kAdapterX(20);
}
-(CGFloat)marginL {
    if ([_datasource respondsToSelector:@selector(viewMarginLeft)]) {
        return [_datasource viewMarginLeft];
    }
    return kAdapterX(20);
}
-(CGFloat)itemHeight {
    if ([_datasource respondsToSelector:@selector(viewHeight)]) {
        return [_datasource viewHeight];
    }
    return kAdapterX(44);
}
-(CGFloat)itemWidth {
    if ([_datasource respondsToSelector:@selector(viewWidth)]) {
        return [_datasource viewWidth];
    }
    return kAdapterX(44);
}
@end
