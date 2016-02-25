//
//  CardCell.h
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat CardCellHeight;

@class Card, CardCell;

@protocol CardCellDelegate <NSObject>

@optional
- (void)cardCell:(CardCell *)cardCell didSelectedCallPhone:(Card *)card;
- (void)cardCell:(CardCell *)cardCell didSelectedShareCard:(Card *)card;

/** 滚动开始 */
- (void)cardCellBeginScrollOpen:(CardCell *)cardCell;

/** 滚动结束 */
- (void)cardCellEndScrollToOpen:(CardCell *)cardCell;

/** 取消滚动（识别为竖直滚动） */
- (void)cardCellCancelScrollToOpen:(CardCell *)cardCell;

/** 取消滚动（识别为竖直滚动） */
- (void)cardCell:(CardCell *)cell didScrollEndToOpen:(Card *)card;

@end

@interface CardCell : UITableViewCell

@property (nonatomic, strong) Card *card;

@property (nonatomic, weak) id <CardCellDelegate> delegate;

+ (instancetype)cardCellWidthTableView:(UITableView *)tableView;
+ (instancetype)cardCellWidthTableView:(UITableView *)tableView delegate:(id <CardCellDelegate>)delegate;


@end
