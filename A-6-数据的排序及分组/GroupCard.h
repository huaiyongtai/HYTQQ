//
//  GroupCard.h
//  MP_BusinessOpenDome
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface GroupCard : NSObject

/** 分组Id */
@property (nonatomic, copy) NSString *idStr;

/** 组名 */
@property (nonatomic, copy) NSString *name;

/** 组内成员 */
@property (nonatomic, strong) NSMutableArray *cards;

/** 是否展开 */
@property (nonatomic, assign, getter=isFold) BOOL fold;

+ (instancetype)groupCardWithDict:(NSDictionary *)dict;

@end
