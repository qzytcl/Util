
//
//  CommentContentView.m
//  FSLTools
//
//  Created by 付顺龙 on 2019/9/11.
//  Copyright © 2019 Bilos. All rights reserved.
//

#import "CommentContentView.h"
#import "CommentListViewXibCell.h"
#import "CommentContentTopCell.h"
#import "CommentContentCell.h"
@interface CommentContentView ()<UITableViewDelegate,UITableViewDataSource,CommentContentTopCellDeleagte,CommentContentCellDelegate> {
    UITextField *textFiled;
}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *titleLbl;
@property (nonatomic,strong) UIView *bottomView;

@end
@implementation CommentContentView

-(instancetype)init {
    if (self = [super init]) {
        self.arr =[NSMutableArray array];
        
        [self createViews];
        [self createTestData];
    }
    return self;
}
-(void)createTestData {
    for (NSInteger i = 0; i < 10; i++) {
        [self.arr addObject:@{@"username":@"张三",@"content":@"asdkjflsajflakjflaksjlfjlskjdflkajlfdjlskjflkssdkjflsajflakjflaksjlfjlskjdflkajlfdjlskjfsdkjflsajflakjflaksjlfjlskjdflkajlfdjlskjfsdkjflsajflakjflaksjlfjlskjdflkajlfdjlskjfsdkjflsajflakjflaksjlfjlskjdflkajlfdjlskjfsdkjflsajflakjflaksjlfjlskjdflkajlfdjlskjfsdkjflsajflakjflaksjlfjlskjdflkajlfdjlskjfjadlfksajlfkjaslkdjflasjdlfksajldkfjalkdjfklsajlkfdajl"}];
    }
    [self.tableView reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardHideShow:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [self.content addTarget:self Gesture:@"hideKKB"];
}
-(void)hideKKB {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect tF = CGRectMake(0, AdapX(449)-AdapX(50), WIDTH, AdapX(50));
        tF.origin.y -= keyboardRect.size.height;
        self.bottomView.frame = tF;
    }];
}

- (void)keyboardHideShow:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.frame = CGRectMake(0, AdapX(449)-AdapX(50), WIDTH, AdapX(50));
    }];
}
-(void)createViews {
    self.content.frame = CGRectMake(0, 0, AdapX(375), AdapX(449));
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.content.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(AdapX(5), AdapX(5))];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.content.layer.mask = shape;
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.offset(0);
        make.width.mas_equalTo(AdapX(375));
        make.height.mas_equalTo(AdapX(449));
    }];
    [self.content addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(AdapX(-50));
        make.top.offset(AdapX(44));
        make.left.right.offset(0);
    }];
    
    [self.content addSubview:self.titleLbl];
    self.titleLbl.text = @" ";
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.offset(0);
        make.height.mas_equalTo(AdapX(44));
    }];
    UIView *line = [UIView new];
    [self.content addSubview:line];
    line.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(1);
        make.top.offset(AdapX(44));
    }];
    UIView *line2 = [UIView new];
    [self.content addSubview:line2];
    line2.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(1);
        make.bottom.offset(AdapX(-50));
    }];
    [self.content addSubview:self.bottomView];
    UIImageView *close = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
    [close addTarget:self Gesture:@"hide"];
    [self.content addSubview:close];
    [close mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AdapX(14));
        make.centerY.equalTo(self.titleLbl);
        make.width.height.mas_equalTo(AdapX(14));
    }];
}
-(UILabel *)titleLbl {
    if (!_titleLbl) {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 1;
        label.font = [UIFont systemFontOfSize:AdapX(16)];
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _titleLbl = label;
    }
    return _titleLbl;
}
-(UIView *)bottomView {
    if (!_bottomView) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(0, AdapX(449)-AdapX(50), WIDTH, AdapX(50));
        
        UIView *contentView1 = [UIView new];
        contentView1.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
        contentView1.layer.cornerRadius = AdapX(16);
        contentView1.layer.masksToBounds = YES;
        [view addSubview:contentView1];
        [contentView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.offset(AdapX(14));
            make.height.mas_equalTo(AdapX(32));
            make.width.mas_equalTo(AdapX(300));
        }];
        UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Information_bottom_edit"]];
        [contentView1 addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.offset(AdapX(15));
            make.width.height.mas_equalTo(AdapX(13));
        }];
        UITextField *inputView = [[UITextField alloc] init];
        textFiled = inputView;
        inputView.placeholder = @"我也来说两句";
        inputView.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        [contentView1 addSubview:inputView];
        [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon.mas_right).offset(3);
            make.right.offset(-5);
            make.top.bottom.offset(0);
        }];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"发布" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitleColor:[UIColor colorWithRed:70/255.0 green:131/255.0 blue:238/255.0 alpha:1.0] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(AdapX(-17));
            make.centerY.offset(0);
        }];
        _bottomView = view;
    }
    return _bottomView;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, AdapX(40), WIDTH, AdapX(413)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = AdapX(100);
        [_tableView registerNib:[UINib nibWithNibName:@"CommentContentTopCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"topCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"CommentListViewXibCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"contentCell"];
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return AdapX(44);
    }
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view.frame =CGRectMake(0, 0, WIDTH, AdapX(44));
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 1;
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"全部评论" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        
        label.attributedText = string;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AdapX(12));
            make.centerY.offset(0);
        }];
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1.0];
        [view addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            make.height.mas_equalTo(1);
        }];
        return view;
    }else {
        return nil;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CommentContentTopCell *cell =[tableView dequeueReusableCellWithIdentifier:@"topCell" forIndexPath:indexPath];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSDictionary *dic = self.arr[indexPath.row];
        cell.username.text = dic[@"username"];
        cell.contentText.text = dic[@"content"];
        //
        if (dic[@"up"]) {
            //已赞
            cell.upIcon.image = [UIImage imageNamed:@"Information_bottom_isPraise"];
            cell.upText.text = @"99";
            cell.upText.textColor =[UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        }else {
            //未赞
            cell.upIcon.image = [UIImage imageNamed:@"Information_bottom_unPraise"];
            cell.upText.text = @"赞";
            cell.upText.textColor =[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        }
        if (dic[@"follow"]) {
            cell.follow.text = @"已关注";
            cell.follow.textColor =[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        }else {
            cell.follow.text = @"+关注";
            cell.follow.textColor =[UIColor colorWithRed:233/255.0 green:48/255.0 blue:48/255.0 alpha:1.0];
        }
        return cell;
    }else {
        CommentContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contentCell" forIndexPath:indexPath];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSDictionary *dic = self.arr[indexPath.row];
        cell.username.text = dic[@"username"];
        cell.contentText.text = dic[@"content"];
        //
        if (dic[@"up"]) {
            //已赞
            cell.upIcon.image = [UIImage imageNamed:@"Information_bottom_isPraise"];
        }else {
            //未赞
            cell.upIcon.image = [UIImage imageNamed:@"Information_bottom_unPraise"];
        }
    
        return cell;
    }

}
-(void)clickFollow:(CommentContentTopCell *)cell {
    
}
-(void)clickReply:(CommentListViewXibCell *)cell {
    //    NSInteger index = [self.tableView indexPathForCell:cell].row;
    
}
-(void)clickUp:(CommentListViewXibCell *)cell {
    //    NSInteger index = [self.tableView indexPathForCell:cell].row;
    
}
-(void)sendAction {
    //    NSString *content = textFiled.text;
    
}

-(void)clickUpSub:(CommentContentCell *)cell {
    //    NSInteger index = [self.tableView indexPathForCell:cell].row;
}
-(void)clickReplySub:(CommentContentCell *)cell {
    //    NSInteger index = [self.tableView indexPathForCell:cell].row;
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)hide {
    [super hide];
    if (self.backview) {
        [self.backview show];
    }
}
@end
