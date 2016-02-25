//
//  HYTViewController.m
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 16/1/18.
//  Copyright (c) 2016年 HelloWorld. All rights reserved.
//

#import "HYTViewController.h"
#import "HYTCardController.h"
#import "GroupCard.h"
#import "Card.h"

@interface HYTViewController ()

@property (nonatomic, strong) NSArray *cardArray;
@property (nonatomic, strong) NSArray *listCardArray;
@property (nonatomic, strong) NSArray *groupCardArray;

@end

@implementation HYTViewController

- (void)testDome {
    

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HelloWorld";
    
    
    [self testDome];
    
    [self.view setBackgroundColor:[UIColor brownColor]];
    
    UIButton *showListBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [showListBtn setBackgroundColor:[UIColor blueColor]];
    [showListBtn setTitle:@"我是盖伦，人们都我为神河之力" forState:UIControlStateNormal];
    [showListBtn setFrame:CGRectMake(10, 200, 300, 100)];
    [showListBtn addTarget:self
                    action:@selector(showList)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showListBtn];
    
}

- (void)showList {
    
    NSMutableArray *cards = [NSMutableArray array];
    for (NSDictionary *cardDict in self.cardArray) {
        Card *card = [Card cardWithDict:cardDict];
        [cards addObject:card];
    }
    
    HYTCardController *cardVC = [[HYTCardController alloc] init];
    cardVC.cards = cards;
    [self.navigationController pushViewController:cardVC animated:YES];
    
    
    NSLog(@"已进入天使--彦---模式");
}

- (NSArray *)cardArray {
    
    if (_cardArray == nil) {
        
        NSArray *cardArray = @[//超神学院
                               @{@"groupName"   : @"超神学院",
                                 @"groupId"     : @"1",
                                 @"idStr"       : @"001",
                                 @"name"        : @"葛小伦",
                                 @"organization": @"超神学院·地球防卫·雄兵连",
                                 @"rank"        : @"银河之力",
                                 @"iconURL"     : @"http://e.hiphotos.baidu.com/baike/s%3D250/sign=8495aa19fdf2b211e02e824bfa816511/ae51f3deb48f8c54004309453c292df5e1fe7fcc.jpg"},
                               
                               @{@"groupName"   : @"超神学院",
                                 @"groupId"     : @"1",
                                 @"idStr"       : @"002",
                                 @"name"        : @"赵信 ",
                                 @"organization": @"超神学院·地球防卫·雄兵连",
                                 @"rank"        : @"德星之枪",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=4a6b50b68c13632711edc531a18ea056/c8ea15ce36d3d539edb4c3a93c87e950342ab0cb.jpg"},
                               
                               @{@"groupName"   : @"超神学院",
                                 @"groupId"     : @"1",
                                 @"idStr"       : @"003",
                                 @"name"        : @"程耀文",
                                 @"organization": @"超神学院·地球防卫·雄兵连",
                                 @"rank"        : @"上士",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"004",
                                 @"name"     : @"杜蔷薇",
                                 @"organization": @"超神学院·地球防务·雄兵连",
                                 @"rank"     : @"中士",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=3fc0576e5f82b2b7a39f3ec601accb0a/5d6034a85edf8db15597b30e0f23dd54564e741b.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"005",
                                 @"name"     : @"琪琳",
                                 @"organization": @"超神学院·地球防务·女神队",
                                 @"rank"     : @"中士",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=1c80945c1b950a7b713549c63ad0625c/500fd9f9d72a605975a52e702e34349b033bba27.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"006",
                                 @"name"     : @"何蔚蓝",
                                 @"organization": @"超神学院·地球防卫·雄兵连",
                                 @"rank"     : @"下士",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=515ca75f8194a4c20e23e0293ef51bac/b64543a98226cffc99c3f9e2bf014a90f703eaf1.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"007",
                                 @"name"     : @"蕾娜",
                                 @"organization": @"超神学院·地球防卫·雄兵连",
                                 @"rank"     : @"太阳之光",
                                 @"iconURL"     : @"http://e.hiphotos.baidu.com/baike/s%3D220/sign=8cc802438018367aa98978df1e728b68/4e4a20a4462309f7accb6278740e0cf3d7cad630.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"008",
                                 @"name"     : @"刘闯",
                                 @"organization": @"超神学院·地球防务·雄兵连",
                                 @"rank"     : @"诺星战神·中士",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=7934cf70c05c1038207ec9c08210931c/cf1b9d16fdfaaf5163ba4ed58a5494eef01f7a7b.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"009",
                                 @"name"     : @"瑞萌萌",
                                 @"organization": @"超神学院·地球防务·雄兵连",
                                 @"rank"     : @"诺星尖刀·中士",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=5ff10c6ca9c379317968812bdbc4b784/63d9f2d3572c11df8eed7149652762d0f703c298.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"010",
                                 @"name"     : @"左翼·彦",
                                 @"organization": @"天使星云·神圣护卫·天使统帅",
                                 @"rank"     : @"雷鸣战神",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D250/sign=d98cfb522e381f309a198aac99004c67/6a63f6246b600c33c0e717a21c4c510fd9f9a13a.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"011",
                                 @"name"     : @"右翼·炙心",
                                 @"organization": @"天使星云·神圣护卫",
                                 @"rank"     : @"烈火战神",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D250/sign=cca55711d71373f0f13f689a940e4b8b/1e30e924b899a90151ee945c1b950a7b0308f585.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"0012",
                                 @"name"     : @"孙悟空/吴老师",
                                 @"organization": @"无",
                                 @"rank"     : @"斗战胜佛 孙悟空",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D220/sign=87ac45536d63f624185d3e01b745eb32/caef76094b36acaf5b6e58967ad98d1000e99cca.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"013",
                                 @"name"     : @"苏小狸",
                                 @"organization": @"超神学院·地球防务·雄兵连",
                                 @"rank"     : @"下士",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=a6792c706659252da7171a06049a032c/203fb80e7bec54e74951d474bf389b504fc26a1f.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"014",
                                 @"name"     : @"莫甘娜",
                                 @"organization": @"恶魔星云",
                                 @"rank"     : @"堕落女王·自由与梦想之神",
                                 @"iconURL"     : @"http://b.hiphotos.baidu.com/baike/s%3D220/sign=5cfd1c4b96ef76c6d4d2fc29ad16fdf6/241f95cad1c8a786703784646109c93d70cf50bf.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"015",
                                 @"name"     : @"丁格黑",
                                 @"organization": @"神河文明",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"016",
                                 @"name"     : @"泰·史奈夫",
                                 @"organization": @"弗雷卓文明·北方霸王",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=d1d1987d64d0f703e2b292de38fb5148/37d3d539b6003af36145120a332ac65c1138b6d9.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"0017",
                                 @"name"     : @"艾妮·熙德",
                                 @"organization": @"弗雷卓文明·冰雪王国",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=fde2d6afe6fe9925cf0c6e5204a95ee4/cc11728b4710b9120f373894c5fdfc03934522e2.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"018",
                                 @"name"     : @"索顿",
                                 @"organization": @"未知来历",
                                 @"rank"     : @"鳄神",
                                 @"iconURL"     : @"http://b.hiphotos.baidu.com/baike/s%3D220/sign=d31415b9f4d3572c62e29bdeba126352/2934349b033b5bb5102f62ae30d3d539b700bce2.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"019",
                                 @"name"     : @"杜卡奥",
                                 @"organization": @"超神学院·地球防务·雄兵连总指挥官",
                                 @"rank"     : @"上将",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=326b3894c5fdfc03e178e4bae43e87a9/aec379310a55b31911534c1f45a98226cffc1736.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"020",
                                 @"name"     : @"黑风",
                                 @"organization": @"恶魔星云",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @"http://b.hiphotos.baidu.com/baike/s%3D220/sign=587a63c953fbb2fb302b5f107f4b2043/5243fbf2b2119313b1ea942463380cd790238dfc.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"021",
                                 @"name"     : @"剑魔·阿托",
                                 @"organization": @"恶魔星云",
                                 @"rank"     : @"上古剑魔",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=a7c42b706659252da7171a06049a032c/203fb80e7bec54e748ecd374bf389b504fc26a5c.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"022",
                                 @"name"     : @"死神",
                                 @"organization": @"黑暗星云",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D220/sign=bd71aa92a9c379317968812bdbc5b784/63d9f2d3572c11df6c6dd7b7652762d0f603c2e2.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"023",
                                 @"name"     : @"凯莎",
                                 @"organization": @"天使星云",
                                 @"rank"     : @"天使之王",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=6719c970c05c1038207ec9c08210931c/cf1b9d16fdfaaf517d9748d58a5494eef01f7a60.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"024",
                                 @"name"     : @"杰古斯丁",
                                 @"organization": @"超神学院·地球防务·雄兵连",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D250/sign=a015c1e0ab345982c18ae2973cf5310b/bd315c6034a85edfba79abb74f540923dc5475a8.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"025",
                                 @"name"     : @"语琴·医疗官",
                                 @"organization": @"超神学院指挥部",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D220/sign=6930f1e1d088d43ff4a996f04d1fd2aa/b219ebc4b74543a91715ac5818178a82b9011413.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"026",
                                 @"name"     : @"怜风·情报分析员",
                                 @"organization": @"超神学院指挥部",
                                 @"rank"     : @"无",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=5b4fe9b7652762d0843ea3bd90ed0849/14ce36d3d539b600c8505923ef50352ac75cb78c.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"027",
                                 @"name"     : @"魏颖",
                                 @"organization": @"超神学院·地球防务·雄兵连",
                                 @"rank"     : @"暗影猎手",
                                 @"iconURL"     : @"http://e.hiphotos.baidu.com/baike/s%3D220/sign=174b67eb7ef0f736dcfe4b033a54b382/7af40ad162d9f2d3eb03757bafec8a136327cc10.jpg"},
                               
                               @{@"groupName": @"超神学院",
                                 @"groupId"  : @"1",
                                 @"idStr"    : @"028",
                                 @"name"     : @"李菲菲",
                                 @"organization": @"超神学院·地球防务·雄兵连",
                                 @"rank"     : @"下士",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=15fc9b78d700baa1be2c40b97711b9b1/5bafa40f4bfbfbed21a560eb7ef0f736aec31fa1.jpg"},
                               
                               //魁拔
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"001",
                                 @"name"        : @"蛮吉",
                                 @"organization": @"神圣兽国",
                                 @"rank"        : @"魁拔",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=d891432e362ac65c63056171cbf3b21d/a6efce1b9d16fdfa4d4759a0b78f8c5494ee7b51.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"002",
                                 @"name"        : @"蛮小满",
                                 @"organization": @"神圣兽国",
                                 @"rank"        : @"屌丝",
                                 @"iconURL"     : @"http://e.hiphotos.baidu.com/baike/s%3D220/sign=e87ec7781e950a7b713549c63ad0625c/500fd9f9d72a6059815b7d542b34349b033bba31.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"003",
                                 @"name"        : @"镜心",
                                 @"organization": @"天界",
                                 @"rank"        : @"魁拔司主神",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=2cdf0d7148fbfbedd859317d48f1f78e/6f061d950a7b02080d84a3af61d9f2d3572cc82b.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"004",
                                 @"name"        : @"卡拉肖克·潘",
                                 @"organization": @"神圣龙国",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D220/sign=fe88c45c4c4a20a4351e3bc5a0539847/b17eca8065380cd72cbd3ea3a244ad34588281d9.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"005",
                                 @"name"        : @"雪伦",
                                 @"organization": @"神圣兽国",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=3c1e192ffb1986184547e8867aed2e69/6c224f4a20a4462386f2392c9b22720e0cf3d740.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"006",
                                 @"name"        : @"离离艾",
                                 @"organization": @"神圣树国",
                                 @"rank"        : @"公主",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=0a34e5766d061d957946303a4bf50a5d/1b4c510fd9f9d72ac36c8c53d72a2834349bbb70.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"007",
                                 @"name"        : @"秋落木",
                                 @"organization": @"辉妖",
                                 @"rank"        : @"协行士",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"008",
                                 @"name"        : @"奇衡三",
                                 @"organization": @"基斯卡人",
                                 @"rank"        : @"中部战区指挥官",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=50757eddcc8065387feaa311a7dca115/95eef01f3a292df523985786ba315c6035a873ce.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"009",
                                 @"name"        : @"幽弥狂",
                                 @"organization": @"雾妖族",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=8d818427194c510faac4e518505b2528/7dd98d1001e939012bfad7d178ec54e737d19660.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"010",
                                 @"name"        : @"吧咕嗒",
                                 @"organization": @"蛰族",
                                 @"rank"        : @"王子",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=ad2be7ccb37eca8016053ee5a1229712/8d5494eef01f3a2932cf94219a25bc315d607cdd.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"011",
                                 @"name"        : @"海问香",
                                 @"organization": @"粼妖",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=00e9db137fd98d1072d40b33113eb807/b2de9c82d158ccbf42b5f8d51ad8bc3eb03541d7.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"012",
                                 @"name"        : @"大仓",
                                 @"organization": @"萨库人",
                                 @"rank"        : @"灵山军厨师",
                                 @"iconURL"     : @"http://b.hiphotos.baidu.com/baike/s%3D220/sign=2615df23452309f7e36faa10420f0c39/64380cd7912397ddc81b52b35a82b2b7d0a28723.jpg"},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"013",
                                 @"name"        : @"雷光",
                                 @"organization": @"翼族",
                                 @"rank"        : @"",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"014",
                                 @"name"        : @"幽若离",
                                 @"organization": @"格洛莫赫人",
                                 @"rank"        : @"",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"015",
                                 @"name"        : @"万两",
                                 @"organization": @"默拓人",
                                 @"rank"        : @"",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"016",
                                 @"name"        : @"梅龙尼卡·嘉",
                                 @"organization": @"龙族",
                                 @"rank"        : @"",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"017",
                                 @"name"        : @"卡拉肖克·玲",
                                 @"organization": @"",
                                 @"rank"        : @"",
                                 @"iconURL"     : @""},
                               
                               @{@"groupName"   : @"魁拔",
                                 @"groupId"     : @"2",
                                 @"idStr"       : @"08",
                                 @"name"        : @"燃谷",
                                 @"organization": @"兽族",
                                 @"rank"        : @"",
                                 @"iconURL"     : @""},
                               
                               //妖怪名单
                               @{@"groupName"   : @"妖怪名单",
                                 @"groupId"     : @"3",
                                 @"idStr"       : @"001",
                                 @"name"        : @"苏九儿",
                                 @"organization": @"妖怪",
                                 @"rank"        : @"九尾狐妲己",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=0c76aedf4d36acaf5de091fe4cd88d03/dc54564e9258d10974474454d758ccbf6d814db4.jpg"},
                               
                               @{@"groupName"   : @"妖怪名单",
                                 @"groupId"     : @"3",
                                 @"idStr"       : @"002",
                                 @"name"        : @"封夕",
                                 @"organization": @"",
                                 @"rank"        : @"穷学生",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=6d88f5391638534388cf8023a312b01f/9c16fdfaaf51f3deec2dbf3192eef01f3b2979c3.jpg"},
                               
                               @{@"groupName"   : @"妖怪名单",
                                 @"groupId"     : @"3",
                                 @"idStr"       : @"003",
                                 @"name"        : @"郭双",
                                 @"organization": @"道家弟子",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://e.hiphotos.baidu.com/baike/s%3D220/sign=efe14d95f136afc30a0c38678318eb85/0bd162d9f2d3572cfd719c898c13632763d0c3d0.jpg"},
                               
                               @{@"groupName"   : @"妖怪名单",
                                 @"groupId"     : @"3",
                                 @"idStr"       : @"004",
                                 @"name"        : @"燕朝雪",
                                 @"organization": @"燕家",
                                 @"rank"        : @"大学学生会长",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=da1f7d50cf177f3e1434fb0f40cd3bb9/43a7d933c895d143a69c0bc575f082025baf0769.jpg"},
                               
                               @{@"groupName"   : @"妖怪名单",
                                 @"groupId"     : @"3",
                                 @"idStr"       : @"005",
                                 @"name"        : @"灵灵",
                                 @"organization": @"神族",
                                 @"rank"        : @"龙之末裔",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D220/sign=20074b1cd7c8a786ba2a4d0c5708c9c7/0eb30f2442a7d933cd8d0f95ab4bd11373f0012a.jpg"},
                               
                               @{@"groupName"   : @"妖怪名单",
                                 @"groupId"     : @"3",
                                 @"idStr"       : @"006",
                                 @"name"        : @"合欢",
                                 @"organization": @"女妖",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=1397bb7507e9390152028a3c4bed54f9/d058ccbf6c81800a76968a5bb73533fa828b4777.jpg"},
                               
                               //画江湖之不良人
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"001",
                                 @"name"        : @"李星云",
                                 @"organization": @"无",
                                 @"rank"        : @"皇子",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=4db34292d2160924d825a519e406359b/b151f8198618367a21fa5a192c738bd4b21ce587.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"002",
                                 @"name"        : @"姬如雪",
                                 @"organization": @"幻音坊",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=9ce367110f33874498c5287e610ed937/adaf2edda3cc7cd9e7d70d983a01213fb90e91fc.jpg"},
                               
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"003",
                                 @"name"        : @"张子凡",
                                 @"organization": @"通文馆\\天师府",
                                 @"rank"        : @"少主",
                                 @"iconURL"     : @"http://b.hiphotos.baidu.com/baike/s%3D220/sign=97103fdabb389b503cffe750b537e5f1/838ba61ea8d3fd1fe0f587fe324e251f94ca5f71.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"004",
                                 @"name"        : @"陆林轩",
                                 @"organization": @"",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://e.hiphotos.baidu.com/baike/s%3D220/sign=f708a7b141a98226bcc12c25ba80b97a/622762d0f703918fbc20180e533d269758eec404.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"005",
                                 @"name"        : @"黑白无常",
                                 @"organization": @"玄冥教",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=410168f85eafa40f38c6c9df9b66038c/a8014c086e061d95388ae8f27ff40ad163d9ca28.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"006",
                                 @"name"        : @"上官云阙",
                                 @"organization": @"不良人",
                                 @"rank"        : @"天巧星",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=3418cc5e422309f7e36faa10420f0c39/64380cd7912397ddda1641ce5d82b2b7d1a28789.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"007",
                                 @"name"        : @"倾国/倾城",
                                 @"organization": @"幻音坊",
                                 @"rank"        : @"无盐女",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=0d1b1fa2a01ea8d38e227306a70b30cf/0824ab18972bd4070b1b7be47d899e510eb309ce.jpg"},
                               
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"008",
                                 @"name"        : @"本人",
                                 @"organization": @"扶桑浪人",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=138dfff68bb1cb133a693b11ed5456da/c2fdfc039245d688f31a26bda2c27d1ed21b248a.jpg"},
                               
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"009",
                                 @"name"        : @"疯道人",
                                 @"organization": @"龙虎山天师府",
                                 @"rank"        : @"崇玄真人、张天师",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=eb96166246166d223c77129676220945/b3119313b07eca80db55a84e942397dda04483c3.jpg"},
                               
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"010",
                                 @"name"        : @"妙成天",
                                 @"organization": @"幻音坊",
                                 @"rank"        : @"妙成圣姬",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=7b0c1904063b5bb5bad727fc06d2d523/2e2eb9389b504fc2865aa8aae0dde71190ef6d13.jpg"},
                               
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"011",
                                 @"name"        : @"玄净天",
                                 @"organization": @"幻音坊",
                                 @"rank"        : @"玄净圣姬",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=c7b619375bdf8db1b82e7b663922dddb/c2cec3fdfc0392454d5ef9a08294a4c27c1e25b1.jpg"},
                               
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"012",
                                 @"name"        : @"冥帝",
                                 @"organization": @"玄冥教",
                                 @"rank"        : @"朱友珪、朱温长子",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=906d58284634970a4373172da5cbd1c0/d50735fae6cd7b89a6efaa84082442a7d9330e31.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"013",
                                 @"name"        : @"张氏",
                                 @"organization": @"玄冥教",
                                 @"rank"        : @"张贞娘",
                                 @"iconURL"     : @"http://b.hiphotos.baidu.com/baike/s%3D220/sign=3a30bf7b560fd9f9a417526b152cd42b/8c1001e93901213f69c6dedb53e736d12e2e95c4.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"014",
                                 @"name"        : @"鬼王",
                                 @"organization": @"玄冥教",
                                 @"rank"        : @"朱友文、朱温次子",
                                 @"iconURL"     : @"http://d.hiphotos.baidu.com/baike/s%3D220/sign=09cce5216a224f4a5399741139f79044/9213b07eca806538b7e0371490dda144ad3482ab.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"015",
                                 @"name"        : @"孟婆",
                                 @"organization": @"玄冥教\\不良人",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=13cc14269413b07eb9bd570a3cd79113/b58f8c5494eef01fd2178bc2e7fe9925bc317db2.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"016",
                                 @"name"        : @"水火判官",
                                 @"organization": @"玄冥教",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=7cc1929f59df8db1b82e7b663922dddb/c2cec3fdfc039245f62972088094a4c27d1e251c.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"017",
                                 @"name"        : @"五大阎君",
                                 @"organization": @"玄冥教",
                                 @"rank"        : @"",
                                 @"iconURL"     : @"http://e.hiphotos.baidu.com/baike/s%3D220/sign=a94676ffa086c9170c03553bf93c70c6/0e2442a7d933c895edcf0a7cd61373f082020007.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"018",
                                 @"name"        : @"温韬",
                                 @"organization": @"玄冥教\\不良人\\幻音坊",
                                 @"rank"        : @"摸金校尉、盗圣",
                                 @"iconURL"     : @"http://g.hiphotos.baidu.com/baike/s%3D220/sign=8012d3be99510fb37c197095e932c893/b21c8701a18b87d641a03618000828381e30fdd3.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"019",
                                 @"name"        : @"不良帅",
                                 @"organization": @"不良人",
                                 @"rank"        : @"袁天罡",
                                 @"iconURL"     : @"http://c.hiphotos.baidu.com/baike/s%3D220/sign=e9e9e1630e23dd542573a06ae108b3df/d788d43f8794a4c25fe47a2c09f41bd5ac6e39f5.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"020",
                                 @"name"        : @"阳叔子",
                                 @"organization": @"不良人",
                                 @"rank"        : @"天立星",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D220/sign=ce4042f3b04543a9f11bfdce2e168a7b/8b13632762d0f703ecd609db0ffa513d2697c555.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"021",
                                 @"name"        : @"陆佑劫",
                                 @"organization": @"不良人",
                                 @"rank"        : @"天损星",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=c3df2b11c8fc1e17f9bf8b337a91f67c/f603918fa0ec08fad14b8fa05eee3d6d55fbda6a.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"022",
                                 @"name"        : @"圣主",
                                 @"organization": @"通文馆",
                                 @"rank"        : @"李嗣源",
                                 @"iconURL"     : @"http://h.hiphotos.baidu.com/baike/s%3D220/sign=8fcfa013ac18972ba73a07c8d6cc7b9d/8718367adab44aed71aa22e3b41c8701a08bfbd5.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"023",
                                 @"name"        : @"女帝",
                                 @"organization": @"幻音坊",
                                 @"rank"        : @"岐王",
                                 @"iconURL"     : @"http://f.hiphotos.baidu.com/baike/s%3D220/sign=e72c90b0ee50352ab561220a6342fb1a/77c6a7efce1b9d1620250566f4deb48f8d5464d3.jpg"},
                               
                               @{@"groupName"   : @"画江湖之不良人",
                                 @"groupId"     : @"4",
                                 @"idStr"       : @"024",
                                 @"name"        : @"梵音天",
                                 @"organization": @"幻音坊",
                                 @"rank"        : @"梵音圣姬",
                                 @"iconURL"     : @"http://a.hiphotos.baidu.com/baike/s%3D220/sign=b2990d29afd3fd1f3209a538004e25ce/aa18972bd40735fad6dfd0be99510fb30f24088d.jpg"},
                               ];
        _cardArray = cardArray;
    }
    return _cardArray;
}

- (NSArray *)listCardArray {
    
    if (_listCardArray == nil) {
        
        NSArray *listCardArray = @[@{@"name"     : @"奇衡三",
                                     @"phoneNum" : @"13051180293",
                                     @"organization": @"马可波罗",
                                     @"rank"     : @"职位",
                                     @"groupId"  : @"1",
                                     @"iconURL"     : @""},
                                   
                                   @{@"name"     : @"幽冥狂",
                                     @"phoneNum" : @"13051180293",
                                     @"organization": @"马可波罗",
                                     @"rank"     : @"职位",
                                     @"groupId"  : @"1"}];
        _listCardArray = listCardArray;
    }
    return _listCardArray;
}

- (NSArray *)groupCardArray {
    
    if (_groupCardArray == nil) {
        NSArray *groupCardArray = @[@{@"name"     : @"奇衡三",
                                      @"phoneNum" : @"13051180293",
                                      @"organization": @"马可波罗",
                                      @"rank"     : @"职位",
                                      @"groupId"  : @"1",
                                      @"iconURL"     : @""},
                                    
                                    @{@"name"     : @"幽冥狂",
                                      @"phoneNum" : @"13051180293",
                                      @"organization": @"马可波罗",
                                      @"rank"     : @"职位",
                                      @"groupId"  : @"1"}];
        _groupCardArray = groupCardArray;
    }
    return _groupCardArray;
}


@end
