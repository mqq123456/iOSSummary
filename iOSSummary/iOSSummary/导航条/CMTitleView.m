//
//  TitleView.m
//  CMHitchhiking
//
//  Created by HeQin on 2018/11/21.
//  Copyright © 2018年 HeQin. All rights reserved.
//

#import "CMTitleView.h"
#import "Const.h"

@interface CMTitleView ()
@property(nonatomic, copy)void(^backBlock)(void);
@property(nonatomic, copy)void(^rightBlock)(void);
@property(nonatomic, weak) UILabel *titleText;
@property(nonatomic, weak) UIButton *rightBtn;
@end
@implementation CMTitleView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initView];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView {
    
    int NaviHeight  = ([Const isProfiledScreen]  ?  88 : 64);
    self.backgroundColor = [UIColor colorWithRed:43.0/255.0 green:52.0/255.0 blue:68.0/255.0 alpha:1];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, NaviHeight);
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, NaviHeight - 44, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
    UILabel *titleText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(backButton.frame), NaviHeight - 44, [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(backButton.frame) - CGRectGetMaxX(backButton.frame), 40)];
    [titleText setTextAlignment:NSTextAlignmentCenter];
    [titleText setFont:[UIFont systemFontOfSize:18]];
    titleText.textColor = [UIColor whiteColor];
    titleText.backgroundColor = [UIColor colorWithRed:43.0/255.0 green:52.0/255.0 blue:68.0/255.0 alpha:1];
    [self addSubview:titleText];
    self.titleText = titleText;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 70, NaviHeight - 44, 70, 44);
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:rightButton];
    [rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    rightButton.hidden = YES;
    self.rightBtn = rightButton;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, NaviHeight - 0.6, [UIScreen mainScreen].bounds.size.width, 0.6)];
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
}

- (void)setTitle:(NSString *)title backBlock:(void (^)(void))backBlock{
    self.backBlock = backBlock;
    self.titleText.text = title;
}
- (void)backClick {
    if (self.backBlock) {
        self.backBlock();
    }
}
- (void)rightClick {
    if (self.rightBlock) {
        self.rightBlock();
    }
}
- (void)setTitle:(NSString *)title rightBtn:(NSString *)right backBlock:(void (^)(void))backBlock  rightBlock:(void (^)(void))rightBlock {
    self.backBlock = backBlock;
    self.titleText.text = title;
    self.rightBlock = rightBlock;
    [self.rightBtn setTitle:right forState:UIControlStateNormal];
    self.rightBtn.hidden = NO;
}

- (void)hideRightBtn:(BOOL)isHide {
    self.rightBtn.hidden = isHide;
}

@end
