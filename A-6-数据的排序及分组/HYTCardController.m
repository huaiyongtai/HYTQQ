//
//  HYTCardController.m
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 16/1/19.
//  Copyright (c) 2016年 HelloWorld. All rights reserved.
//

#import "HYTCardController.h"
#import "GroupHeader.h"
#import "CardCell.h"
#import "GroupCard.h"
#import "Card.h"
#import "HYTSortArrayTool.h"

@interface HYTCardController () <GroupHeaderDelegate, CardCellDelegate, UIGestureRecognizerDelegate>

/** 分组名片模型 数组 */
@property (nonatomic, strong) NSArray *groupsCard;

@end

@implementation HYTCardController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"永太Dome";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换显示"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(changeShowType)];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.groupsCard = [NSMutableArray array];
    [self loadCardDataWithType:HYTCardControllerShowTypeDefalut];
}

- (void)changeShowType {
    
    if (self.showType == HYTCardControllerShowTypeGroupCard) {
        self.showType = HYTCardControllerShowTypeDefalut;
    } else {
        self.showType = HYTCardControllerShowTypeGroupCard;
    }
}

- (void)setShowType:(HYTCardControllerShowType)showType {
    
    if (_showType == showType) return;
    
    _showType = showType;
    
    [self loadCardDataWithType:showType];
}
- (void)loadCardDataWithType:(HYTCardControllerShowType)showType {
    
    NSArray *groupsCard = nil;
    if (showType == HYTCardControllerShowTypeDefalut) {
        groupsCard = [HYTSortArrayTool sortSectionsFromArray:self.cards
                                                sortSelector:@selector(name)
                                        insertToValueKeyPath:@"cards"
                                             usingRegulation:^BOOL(GroupCard *objSection, Card *obj, NSString *objTitle) {
                                            
                                            return [objSection.name isEqualToString:objTitle];
                                            
                                        } usingSectionBlock:^id(Card *obj, NSString *objTitle, NSUInteger idx) {
                                            GroupCard *carsGroup = [[GroupCard alloc] init];
                                            carsGroup.name = objTitle;
                                            carsGroup.idStr = obj.groupId;
                                            return carsGroup;
                                        }];
        
    } else {
        groupsCard = [HYTSortArrayTool sortSectionsFromArray:self.cards
                                                sortSelector:@selector(name)
                                        insertToValueKeyPath:@"cards"
                                             usingRegulation:^BOOL(GroupCard *objSection, Card *obj, NSString *objTitle) {
                                            
                                            return [objSection.idStr isEqualToString:obj.groupId];;
                                            
                                        } usingSectionBlock:^id(Card *obj, NSString *objTitle, NSUInteger idx) {
    
                                            GroupCard *carsGroup = [[GroupCard alloc] init];
                                            carsGroup.name = obj.groupName;
                                            carsGroup.idStr = obj.groupId;
                                            return carsGroup;
                                        }];
    }
    self.groupsCard = groupsCard;
    [self.tableView reloadData];
}

- (NSArray *)test {
    
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    
    //得出collation索引的数量，这里是27个（26个字母和1个#）
    NSInteger sectionTitlesCount = [[collation sectionTitles] count];
    
    //初始化一个数组newSectionsArray用来存放最终的数据，我们最终要得到的数据模型应该形如@[@[以A开头的数据数组], @[以B开头的数据数组], @[以C开头的数据数组], ... @[以#(其它)开头的数据数组]]
    
    NSMutableArray *newSectionsArray = [NSMutableArray array];
    
    //初始化27个空数组加入newSectionsArray
    for (NSInteger index = 0; index < sectionTitlesCount; index++) {
        GroupCard *carsGroup = [[GroupCard alloc] init];
        carsGroup.name = collation.sectionTitles[index];
        carsGroup.cards = [NSMutableArray array];
        [newSectionsArray addObject:carsGroup];
    }
    
    NSArray *sortArray = [collation sortedArrayFromArray:self.cards collationStringSelector:@selector(name)];
    //将每个人按name分到某个section下
    for (Card *card in sortArray) {
        //获取name属性的值所在的位置，比如"林丹"，首字母是L，在A~Z中排第11（第一位是0），sectionNumber就为11
        NSInteger sectionNumber = [collation sectionForObject:card collationStringSelector:@selector(name)];
        //把name为“林丹”的p加入newSectionsArray中的第11个数组中去
        GroupCard *sectionNames = newSectionsArray[sectionNumber];
        [sectionNames.cards addObject:card];
    }
    
    return newSectionsArray;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupsCard.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    GroupCard *groupCard = self.groupsCard[section];
    if (self.showType == HYTCardControllerShowTypeGroupCard) {
        return groupCard.isFold ? 0 : groupCard.cards.count;
    }
    return groupCard.cards.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    if (self.showType == HYTCardControllerShowTypeGroupCard) return nil;
    GroupCard *groupCard = self.groupsCard[section];
    return groupCard.name;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GroupCard *groupCard = self.groupsCard[indexPath.section];
    Card *card = groupCard.cards[indexPath.row]; //取出对应模型
    
    CardCell *cell = [CardCell cardCellWidthTableView:tableView delegate:self];
    cell.card = card;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CardCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.showType == HYTCardControllerShowTypeDefalut) return 20;
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (self.showType == HYTCardControllerShowTypeDefalut) return nil;
    
    GroupCard *groupCard = self.groupsCard[section];
    GroupHeader *headerView = [GroupHeader groupHeaderWithTableView:tableView];
    headerView.groupCard = groupCard;
    headerView.delegate = self;
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - GroupHeaderDelegate
- (void)groupHeaderView:(GroupHeader *)groupHeader didSelectedCardGroup:(GroupCard *)groupCard {
    
    groupCard.fold = !groupCard.fold;
    [self.tableView reloadData];
}
@end
