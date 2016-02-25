//
//  GroupHeader.m
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//

#import "GroupCard.h"

@implementation GroupCard

+ (instancetype)groupCardWithDict:(NSDictionary *)dict {
    
    GroupCard *groupCard = [[self alloc] init];
    
    groupCard.idStr = dict[@"idStr"];
    groupCard.name = dict[@"name"];

    NSMutableArray *cards = [NSMutableArray array];
    
    for (id idCard in dict[@"members"]) {
        [cards addObject:[Card cardWithDict:idCard]];
    }
    groupCard.cards = cards;
    
    return groupCard;
}


@end
