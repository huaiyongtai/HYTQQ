//
//  GroupHeader.h
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupHeader, GroupCard;

@protocol GroupHeaderDelegate <NSObject>

@optional
- (void)groupHeaderView:(GroupHeader *)groupHeader didSelectedCardGroup:(GroupCard *)groupCard;

@end

@interface GroupHeader : UITableViewHeaderFooterView

+ (instancetype)groupHeaderWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) GroupCard *groupCard;

@property (nonatomic, weak) id <GroupHeaderDelegate> delegate;

@end
