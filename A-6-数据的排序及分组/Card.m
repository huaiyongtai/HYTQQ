//
//  Card.m
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//

#import "Card.h"

@implementation Card

+ (instancetype)cardWithDict:(NSDictionary *)dict {
    
    
    Card *card = [[Card alloc] init];
    
    card.groupId = dict[@"groupId"];
    card.groupName = dict[@"groupName"];
    card.name = dict[@"name"];
    card.organization = dict[@"organization"];
    card.phoneNum = dict[@"phoneNum"];
    card.rank = dict[@"rank"];
    card.iconURL = dict[@"iconURL"];
    
    return card;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Card_Name = %@", self.name];
    
}

@end
