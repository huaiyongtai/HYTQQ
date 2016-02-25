//
//  HYTSortArrayTool.h
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 16/1/20.
//  Copyright (c) 2016年 HelloWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYTSortArrayTool : NSObject

/** 将所有模型按照keyPath名字来排序（中英文混排） */
+ (NSArray *)sortArrayOfFirstLetter:(NSArray *)cmpArray forCmpValueKeyPath:(NSString *)keyPath;

+ (void)insertToObjGroups:(NSMutableArray *)objGroups
           atValueKeyPath:(NSString *)keyPath
                  withObj:(id)obj
          usingRegulation:(BOOL (^)(id objGroup))regulation
     failureToNewObjGroup:(id(^)(void))newObjGroup;


//+ (NSArray *)sortSectionWillSortArray:(NSArray *)array
//                          objSelector:(SEL)objSelector
//              usingNewObjSectionBlock:(id(^)(id obj, NSString *sectionTitle, NSUInteger sectionIdx))block;
//
//+ (NSArray *)sortSectionsFromArray:(NSArray *)array
//                      sortSelector:(SEL)sortSelector
//              insertToValueKeyPath:(NSString *)keyPath
//                 usingSectionBlock:(id(^)(id obj, NSString *objTitle, NSUInteger idx))block;

/**
 *  讲一个不同的模型数组转化为分组模型数组
 *
 *  @param array        带分组的模型数组
 *  @param sortSelector 模型数组的选择器
 *  @param keyPath      对应的分组模型Value值
 *  @param regulation   比较规则
 *  @param block        当失败时使用此block
 *
 *  @return 分组模型数组
 */
+ (NSArray *)sortSectionsFromArray:(NSArray *)array
                      sortSelector:(SEL)sortSelector
              insertToValueKeyPath:(NSString *)keyPath
                   usingRegulation:(BOOL (^)(id objSection, id obj, NSString *objTitle))regulation
                 usingSectionBlock:(id(^)(id obj, NSString *objTitle, NSUInteger idx))block;
@end
