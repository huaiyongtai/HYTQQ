//
//  HYTCardController.h
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 16/1/19.
//  Copyright (c) 2016年 HelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HYTCardControllerShowType) {
    HYTCardControllerShowTypeListCard,  //列表显示名票
    HYTCardControllerShowTypeGroupCard, //分组显示名片
    HYTCardControllerShowTypeDefalut = HYTCardControllerShowTypeListCard   //默认为列表显示
};

@interface HYTCardController : UITableViewController
//
//+ showCardTypeWith
//- (void)setCards:(NSArray *)cards
@property (nonatomic, assign) HYTCardControllerShowType showType;
/** 原始的名片模型数组 */
@property (nonatomic, strong) NSArray *cards;
@end
