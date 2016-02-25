//
//  GroupHeader.m
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//

#import "GroupHeader.h"
#import "GroupCard.h"

CGFloat GroupHeaderHeight = 20;

@interface GroupHeader ()

/** 名称 */
@property (nonatomic, weak) UILabel *nameLabel;

/** 折叠按钮 */
@property (nonatomic, weak) UIButton *foldBtn;

/** 分割线 */
@property (nonatomic, weak) CALayer *separatorLine;

@end

@implementation GroupHeader

+ (instancetype)groupHeaderWithTableView:(UITableView *)tableView {
    
    static NSString *reuseId = @"GroupHeader";
    GroupHeader *groupHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
    if (!groupHeader) {
        groupHeader = [[GroupHeader alloc] initWithReuseIdentifier:reuseId];
    }
    return groupHeader;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self= [super initWithReuseIdentifier:reuseIdentifier]) {
        
        /** 名称*/
        UILabel *nameLabel = [[UILabel alloc] init];
        [nameLabel setTextAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** 折叠按钮 */
        UIButton *foldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [foldBtn setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        [foldBtn setImage:[UIImage imageNamed:@"arrow_right"] forState:UIControlStateSelected];
        [foldBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [foldBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [foldBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [foldBtn addTarget:self action:@selector(cardsFoldBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:foldBtn];
        self.foldBtn = foldBtn;
        
        /** 分割线 */
        CALayer *separatorLine = [[CALayer alloc] init];
        [separatorLine setBackgroundColor:[UIColor colorWithWhite:0.600 alpha:1.000].CGColor];
        [self.contentView.layer addSublayer:separatorLine];
        self.separatorLine = separatorLine;
    }
    return self;
}

- (void)setGroupCard:(GroupCard *)groupCard {
    
    
    GroupHeaderHeight = 40;
    _groupCard = groupCard;
    
    NSString *onlinePerson = [NSString stringWithFormat:@"%li人", groupCard.cards.count];
    [self.nameLabel setText:onlinePerson];

    [self.foldBtn setTitle:groupCard.name forState:UIControlStateNormal];
    self.foldBtn.selected = groupCard.isFold;
}
#pragma mark - 点击这点按钮
- (void)cardsFoldBtn:(UIButton *)flodBtn {
    
    flodBtn.selected = !flodBtn.selected;
    
    if ([self.delegate respondsToSelector:@selector(groupHeaderView:didSelectedCardGroup:)]) {
        [self.delegate groupHeaderView:self didSelectedCardGroup:self.groupCard];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat margin = 20;
    [self.foldBtn setFrame:CGRectMake(margin, 0, self.width, self.height)];
    [self.nameLabel setFrame:CGRectMake(margin, 0, SCREEN_WIDTH-2*margin, self.height)];
    [self.separatorLine setFrame:CGRectMake(0, self.height-0.5, SCREEN_WIDTH, 0.5)];
}




@end
