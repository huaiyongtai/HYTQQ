//
//  HYTSortArrayTool.m
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 16/1/20.
//  Copyright (c) 2016年 HelloWorld. All rights reserved.
//

#import "HYTSortArrayTool.h"
#import "pinyin.h"

#define GB18030_ENCODING CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)

@interface Person : NSObject
@property(nonatomic, copy) NSString *name;
@end

@implementation Person
@end

@implementation HYTSortArrayTool

+ (NSArray *)sortArrayOfFirstLetter:(NSArray *)cmpArray forCmpValueKeyPath:(NSString *)keyPath {
    
    return [cmpArray sortedArrayUsingComparator:^NSComparisonResult(id cmp1, id cmp2) {
        
        NSString *cmp1Str = [cmp1 valueForKeyPath:keyPath];
        NSString *cmp2Str = [cmp2 valueForKeyPath:keyPath];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z]+"];
        
        //确定是否为英文字符
        BOOL isEnCmp1 = [predicate evaluateWithObject:cmp1Str];
        BOOL isEnCmp2 = [predicate evaluateWithObject:cmp2Str];
        
        BOOL isSameType = (isEnCmp1 == isEnCmp2);
        if (isSameType) {   //类型相同（都是中文、或者都是英文）
            //重新编码
            NSString *recodeCmp1 = [cmp1Str stringByAddingPercentEscapesUsingEncoding:GB18030_ENCODING];
            NSString *recodeCmp2 = [cmp2Str stringByAddingPercentEscapesUsingEncoding:GB18030_ENCODING];
            return [recodeCmp1 compare:recodeCmp2 options:NSCaseInsensitiveSearch];
        }
        
        NSString *cnCmpStr = isEnCmp1 ? cmp2Str : cmp1Str;   //取出非英文
        NSString *fristCNCmpStr = [[NSString stringWithFormat:@"%c", pinyinFirstLetter([cnCmpStr characterAtIndex:0])] uppercaseString];
        
        NSString *enCmpStr = isEnCmp1 ? cmp1Str : cmp2Str;  //取出英文
        return [fristCNCmpStr compare:enCmpStr options:NSCaseInsensitiveSearch];
    }];
    
    //原始的方法
    /**
     //    return [cards sortedArrayUsingComparator:^NSComparisonResult(Card *card1, Card *card2) {
     //
     //        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z]+"];
     //        BOOL isEnglishOfCard1 = [predicate evaluateWithObject:card1.name];
     //        BOOL isEnglishOfCard2 = [predicate evaluateWithObject:card2.name];
     //        BOOL isSameType = (isEnglishOfCard1 == isEnglishOfCard2);
     //        if (isSameType) {   //类型相同（都是中文、或者都是英文）
     //            NSString *cardName1 = [card1.name stringByAddingPercentEscapesUsingEncoding:GB18030_ENCODING];
     //            NSString *cardName2 = [card2.name stringByAddingPercentEscapesUsingEncoding:GB18030_ENCODING];
     //            return [cardName1 compare:cardName2 options:NSCaseInsensitiveSearch];
     //        }
     //
     //        Card *nameChineseOfCard = isEnglishOfCard1 ? card2 : card1;
     //        Card *nameEnglishOfCard = isEnglishOfCard1 ? card1 : card2;
     //        NSString *fristSpellOfChinese = [[NSString stringWithFormat:@"%c",pinyinFirstLetter([nameChineseOfCard.name characterAtIndex:0])] uppercaseString];
     //        return [fristSpellOfChinese compare:nameEnglishOfCard.name options:NSCaseInsensitiveSearch];
     //    }];
     
     */
}

+ (void)insertToObjGroups:(NSMutableArray *)objGroups
           atValueKeyPath:(NSString *)keyPath
                  withObj:(id)obj
          usingRegulation:(BOOL (^)(id objGroup))regulation
     failureToNewObjGroup:(id(^)(void))newObjGroup {
    
    BOOL isAddNewGroup = YES;   //标记是否新建分组
    for (id objGroup in objGroups) {
        if (regulation && regulation(objGroup)) {   //找到对应分组

            [[objGroup valueForKeyPath:keyPath] addObject:obj];
            isAddNewGroup = NO;
            break;
        }
    }
    
    //新建组
    if (!isAddNewGroup) return;
    
    if (newObjGroup) {
        id objGroup = newObjGroup();
        
        NSMutableArray *objs = [NSMutableArray array];
        [objs addObject:obj];
        [objGroup setValue:objs forKeyPath:keyPath];
        [objGroups addObject:objGroup];
    }
    //原始方法
    /** 将 名片模型 issert 到 对应 名片组模型数组 中 */
    //- (void)insertCard:(Card *)card toCardGroups:(NSMutableArray *)groupsCard {
    //
    //    NSString *fisrtSpell = ({
    //        NSString *fisrtSpell = [card.name substringToIndex:1];
    //        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z]+"];
    //        if ([predicate evaluateWithObject:fisrtSpell]) {
    //            fisrtSpell = [fisrtSpell uppercaseString];
    //        } else {
    //            fisrtSpell = [[NSString stringWithFormat:@"%c",pinyinFirstLetter([fisrtSpell characterAtIndex:0])] uppercaseString];
    //        }
    //        fisrtSpell;
    //    });
    //
    //    BOOL isAddNewGroup = YES;   //标记是否新建分组
    //    for (GroupCard *carsGroup in groupsCard) {
    //        if ([carsGroup.name isEqualToString:fisrtSpell]) {   //找到对应分组
    //            [carsGroup.cards addObject:card];
    //            isAddNewGroup = NO;
    //            break;
    //        }
    //    }
    //
    //    //新建组
    //    if (isAddNewGroup) {
    //        GroupCard *carsGroup = [[GroupCard alloc] init];
    //
    //        carsGroup.name = fisrtSpell;
    //        carsGroup.idStr = card.groupId;
    //
    //        NSMutableArray *cards = [NSMutableArray array];
    //        [cards addObject:card];
    //        carsGroup.cards = cards;
    //        
    //        [groupsCard addObject:carsGroup];
    //    }
    //}
    
}


/** 分组排序
 *  UILocalizedIndexedCollation的分组排序是建立在对对象的操作上的
 *  UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
 *      它会根据不同国家的语言初始化出不同的结果。如中文和英文的得到的就是A~Z和#，日语的就是A~Z，あ, か, さ, た, な, は, ま, や, ら, わ和#。
 *
 */
+ (NSArray *)sortSectionsFromArray:(NSArray *)array
                      sortSelector:(SEL)sortSelector
              insertToValueKeyPath:(NSString *)keyPath
                   usingRegulation:(BOOL (^)(id objSection, id obj, NSString *objTitle))regulation
                 usingSectionBlock:(id(^)(id obj, NSString *objTitle, NSUInteger idx))block {
    
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    
    //所有模型排序
    NSArray *sortArray = [collation sortedArrayFromArray:array collationStringSelector:sortSelector];
    
    //分组模型数组
    NSMutableArray *newSections = [NSMutableArray array];
    
    //将每个人按name分到某个section下
    for (id obj in sortArray) {
        NSInteger sectionNumber = [collation sectionForObject:obj collationStringSelector:sortSelector];
        NSString *objTitle = [collation.sectionTitles objectAtIndex:sectionNumber];
        
        BOOL isAddNewSection = YES;   //标记是否新建分组
        for (id objSection in newSections) {
            
            if (regulation && regulation(objSection, obj, objTitle)) {   //找到对应分组
                
                [[objSection valueForKeyPath:keyPath] addObject:obj];
                isAddNewSection = NO;
                break;
            }
        }
        
        //新建组
        if (!isAddNewSection) continue;
        
        NSInteger idx = [sortArray indexOfObject:obj];
        
        if (block) {
            id objSection = block(obj, objTitle, idx);
            
            NSMutableArray *objs = [NSMutableArray array];
            [objs addObject:obj];
            
            [objSection setValue:objs forKeyPath:keyPath];
            [newSections addObject:objSection];
        }
    }
    return newSections;
}


- (void)test {
    
    NSArray *nameArray = @[@"林荣", @"林丹", @"周董", @"周树人", @"周杰伦", @"阿华"];
    NSMutableArray *srcArray = [NSMutableArray array];
    for (NSString *str in nameArray) {
        Person *p = [[Person alloc] init];
        p.name = str;
        [srcArray addObject:p];
    }
    
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    
    //得出collation索引的数量，这里是27个（26个字母和1个#）
    NSInteger sectionTitlesCount = [[collation sectionTitles] count];
    
    //初始化一个数组newSectionsArray用来存放最终的数据，我们最终要得到的数据模型应该形如@[@[以A开头的数据数组], @[以B开头的数据数组], @[以C开头的数据数组], ... @[以#(其它)开头的数据数组]]
    
    NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    
    //初始化27个空数组加入newSectionsArray
    for (NSInteger index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [newSectionsArray addObject:array];
    }
    
    //对每个section中的数组按照name属性排序
    NSArray *sortArray = [collation sortedArrayFromArray:srcArray collationStringSelector:@selector(name)];
    //将每个人按name分到某个section下
    for (Person *p in sortArray) {
        //获取name属性的值所在的位置，比如"林丹"，首字母是L，在A~Z中排第11（第一位是0），sectionNumber就为11
        NSInteger sectionNumber = [collation sectionForObject:p collationStringSelector:@selector(name)];
        //把name为“林丹”的p加入newSectionsArray中的第11个数组中去
        NSMutableArray *sectionNames = newSectionsArray[sectionNumber];
        [sectionNames addObject:p];
    }
}

@end


