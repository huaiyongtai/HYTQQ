//
//  Card.h
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

/** 头像 */
@property (nonatomic, copy) NSString *iconURL;

/** 姓名 */
@property (nonatomic, copy) NSString *name;

/** 联系电话 */
@property (nonatomic, copy) NSString *phoneNum;

/** 公司名称 */
@property (nonatomic, copy) NSString *organization;

/** 职位 */
@property (nonatomic, copy) NSString *rank;

/** 所属分组id */
@property (nonatomic, copy) NSString *groupId;

/** 所属分组名称 */
@property (nonatomic, copy) NSString *groupName;

+ (instancetype)cardWithDict:(NSDictionary *)dict;

@end
