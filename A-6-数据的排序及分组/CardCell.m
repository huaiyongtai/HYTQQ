//
//  CardCell.m
//  A-6-数据的排序及分组
//
//  Created by HelloWorld on 15/12/8.
//  Copyright (c) 2015年 HelloWorld. All rights reserved.
//
/**
 *  Cell的选中状态
 *          当Cell被选中时，cell会遍历所有的子控件并将子控件的颜色设置为ClearColor,然后再显
 *      示selectionView(selectionView是cell的subViews[0]), 故在此设置的self.bottomView，
 *      中的button上的文字显示出来，出现恶心的界面。我再此处理的方法是：cell上的点击手势识别后立即
 *      隐藏bottomView，滑动手势的selector开始滑动时显示bottomView,closeOpen完成后隐藏bottomView
 *
 *  打开的Cell使用全局变量声明
 *      tableView的allowsSelection的方法控制选中
 */

#import "CardCell.h"
#import "Card.h"
#import <UIImageView+WebCache.h>

const CGFloat CardCellHeight = 80;
static CGFloat kActionViewWidth = CardCellHeight;

static CardCell *lastOpenCell = nil;

@interface CardCell () <UIGestureRecognizerDelegate>

/** 顶层 */
@property (nonatomic, weak) UIView *topView;

/** 底层层容纳分享、拨打电话的View */
@property (nonatomic, weak) UIView *bottomView;

/** 头像 */
@property (nonatomic, weak) UIImageView *iconImageView;

/** 姓名 */
@property (nonatomic, weak) UILabel *nameLabel;

/** 隶属组织名称 */
@property (nonatomic, weak) UILabel *organizationLabel;

/** 职位\头衔 */
@property (nonatomic, weak) UILabel *rankLabel;

/** cell所属的TableView */
@property (nonatomic, weak) UITableView *tableView;

/** 标识是否正在拖动 */
@property (nonatomic, assign, getter=isDragVertical) BOOL dragVertical;

@end

@implementation CardCell

+ (instancetype)cardCellWidthTableView:(UITableView *)tableView delegate:(id<CardCellDelegate>)delegate {
    
    static NSString *reuseId = @"CardCell";
    CardCell *cardCell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cardCell) {
        cardCell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cardCell.tableView = tableView;
    }
    cardCell.delegate = delegate;
    return cardCell;
}
+ (instancetype)cardCellWidthTableView:(UITableView *)tableView {
    return [self cardCellWidthTableView:tableView delegate:nil];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;

    /** ================= 底层的View ================= */
    UIView *bottomView = ({
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CardCellHeight)];
        [bottomView setBackgroundColor:[UIColor whiteColor]];
        
        //分享
        UIButton *shareBtn = ({
            UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [shareBtn setFrame:CGRectMake(SCREEN_WIDTH-kActionViewWidth, 0, kActionViewWidth, bottomView.height)];
            [shareBtn setBackgroundColor:[UIColor blackColor]];
            [shareBtn setTitle:@"立即分享" forState:UIControlStateNormal];;
            [shareBtn addTarget:self action:@selector(clickShare) forControlEvents:UIControlEventTouchUpInside];
            shareBtn;
        });
        [bottomView addSubview:shareBtn];
        //打电话
        UIButton *callPhoneBtn = ({
            UIButton *callPhoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [callPhoneBtn setFrame:CGRectMake(shareBtn.x - kActionViewWidth, 0, kActionViewWidth, bottomView.height)];
            [callPhoneBtn setBackgroundColor:[UIColor redColor]];
            [callPhoneBtn setTitle:@"拨打电话" forState:UIControlStateNormal];;
            [callPhoneBtn addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside];
            callPhoneBtn;
        });
        [bottomView addSubview:callPhoneBtn];
        
        bottomView;
    });
    [self.contentView addSubview:bottomView];
    self.bottomView = bottomView;
    
    /** ================= 上层的View ================= */
    UIView *topView = ({
        
        CGFloat margin = 10;
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CardCellHeight)];
        [topView setBackgroundColor:[UIColor whiteColor]];
        
        /** 头像 */
        UIImageView *iconImageView = ({
            CGFloat iconImageWH = CardCellHeight * 0.7;
            UIImageView *iconImageView = [[UIImageView alloc] init];
            [iconImageView setFrame:CGRectMake(margin, (topView.height-iconImageWH)*0.5, iconImageWH, iconImageWH)];
            [iconImageView setBackgroundColor:[UIColor redColor]];
            [iconImageView setContentMode:UIViewContentModeScaleAspectFill];
            [iconImageView.layer setMasksToBounds:YES];
            [iconImageView.layer setCornerRadius:iconImageWH * 0.5];
            [iconImageView.layer setBorderWidth:0.5];
            [iconImageView.layer setBorderColor:[UIColor whiteColor].CGColor];
            iconImageView;
        });
        [topView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        CGFloat labelMaxWidth = SCREEN_WIDTH - 2*margin - CGRectGetWidth(iconImageView.frame) - margin;
        CGFloat labelHeight = CGRectGetHeight(iconImageView.frame)*0.5;
        
        /** 姓名 */
        UILabel *nameLabel = ({
            UILabel *nameLabel = [[UILabel alloc] init];
            [nameLabel setFrame:CGRectMake(CGRectGetMaxX(iconImageView.frame) + margin, iconImageView.y, labelMaxWidth*0.5, labelHeight)];
            [nameLabel setFont:[UIFont systemFontOfSize:15]];
            nameLabel;
        });
        [topView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** 职位 */
        UILabel *rankLabel = ({
            UILabel *rankLabel = [[UILabel alloc] init];
            CGFloat rankLabelWidth = labelMaxWidth-nameLabel.width;
            [rankLabel setFrame:CGRectMake(SCREEN_WIDTH-margin-rankLabelWidth, nameLabel.y, rankLabelWidth, labelHeight)];
            [rankLabel setTextAlignment:NSTextAlignmentRight];
            [rankLabel setFont:[UIFont systemFontOfSize:15]];
            rankLabel;
        });
        [topView addSubview:rankLabel];
        self.rankLabel = rankLabel;
        
        /** 隶属组织名称 */
        UILabel *organizationLabel = ({
            UILabel *organizationLabel = [[UILabel alloc] init];
            [organizationLabel setFrame:CGRectMake(nameLabel.x, CGRectGetMaxY(nameLabel.frame), labelMaxWidth, labelHeight)];
            [organizationLabel setFont:[UIFont systemFontOfSize:15]];
            organizationLabel;
        });
        [topView addSubview:organizationLabel];
        self.organizationLabel = organizationLabel;
        
        topView;
    });
    [self.contentView addSubview:topView];
    self.topView = topView;
    
    /** 分割线 */
    [self.contentView.layer addSublayer:({
        CALayer *separatorLine = [[CALayer alloc] init];
        [separatorLine setBackgroundColor:[UIColor colorWithWhite:0.600 alpha:1.000].CGColor];
        [separatorLine setFrame:CGRectMake(0, CardCellHeight-1, SCREEN_WIDTH, 0.5)];
        separatorLine;
    })];
    
    self.dragVertical = YES;
    
    return self;
}
- (void)setTableView:(UITableView *)tableView {
    
    _tableView = tableView;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] init];
    tapGesture.delegate = self;
    panGesture.delegate = self;
    [tableView addGestureRecognizer:tapGesture];
    [tableView addGestureRecognizer:panGesture];
}
- (void)setDelegate:(id<CardCellDelegate>)delegate {
    
    if (!delegate || _delegate == delegate) return; //设值为空或两次设置相同时直接返回
    
    if (!_delegate) {    //代理为空时开始加载手势识别器
        UIPanGestureRecognizer *dragRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(dragTopView:)];
        dragRecognizer.delegate = self;
        [self.topView addGestureRecognizer:dragRecognizer];
    }
    _delegate = delegate;
}

#pragma mark - Cell重置数据
- (void)setCard:(Card *)card {
    
    _card = card;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:card.iconURL]];
    
    [self.nameLabel setText:card.name];
    
    [self.organizationLabel setText:card.organization];
    
    [self.rankLabel setText:card.rank];
}

#pragma mark - 响应分享、拨打电话
- (void)clickShare {
    
    NSLog(@"----clickShare------");
    if ([self.delegate respondsToSelector:@selector(cardCell:didSelectedShareCard:)]) {
        [self.delegate cardCell:self didSelectedShareCard:self.card];
    }
}
- (void)callPhone {
    NSLog(@"----callPhone------");
    if ([self.delegate respondsToSelector:@selector(cardCell:didSelectedCallPhone:)]) {
        [self.delegate cardCell:self didSelectedCallPhone:self.card];
    }
}

#pragma mark - 监听手势拖动事件
- (void)dragTopView:(UIPanGestureRecognizer *)dragRecognizer {
    
    if (dragRecognizer.state == UIGestureRecognizerStateBegan) {    //开始拖动
        CGPoint startVelocity = [dragRecognizer velocityInView:self];
        if (fabs(startVelocity.y) > 200 || startVelocity.x > -5) {
            self.dragVertical = NO;
            return;
        }
        self.bottomView.hidden = NO;
        self.tableView.scrollEnabled = NO;
    } else if (dragRecognizer.state == UIGestureRecognizerStateChanged) {   //拖动中。。。
        if (self.isDragVertical == NO) return;
        CGPoint delta = [dragRecognizer translationInView:self];
        if ((delta.x>=0 && self.topView.x >=0) || self.topView.x < -(2*kActionViewWidth+10)) return;
        [UIView animateWithDuration:0.1 animations:^{
            self.topView.x += delta.x;
        }];
    } else { //拖动结束
        self.tableView.scrollEnabled = YES;
        if (self.topView.x < -kActionViewWidth) {
            [self animateToScrollOpen];
        } else {
            [self animateToScrollClose];
        }
        self.dragVertical = YES;
    }
    [dragRecognizer setTranslation:CGPointZero inView:self];
}

#pragma mark - 动画形式打开、关闭动画
- (void)animateToScrollOpen {
    
    lastOpenCell = self;
    
    //动画展示contentView的滑动
    [UIView animateWithDuration:0.2 animations:^{
        self.topView.x = -2*kActionViewWidth;
    } completion:^(BOOL finished) {
        self.tableView.allowsSelection = NO;
    }];
}
- (void)animateToScrollClose {
    
    lastOpenCell = nil;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.topView.x = 0;
    } completion:^(BOOL finished) {
        self.tableView.allowsSelection = YES;
        self.bottomView.hidden = YES;
    }];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (![gestureRecognizer.view isKindOfClass:[UITableView class]]) {  //非TableView上的手势
        self.bottomView.hidden = YES;
        return YES;
    }
    if (lastOpenCell) {
        [lastOpenCell animateToScrollClose];
    }
    return NO;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end
