//
//  ViewController.m
//  iOSSummary
//
//  Created by HeQin on 2019/7/3.
//  Copyright © 2019 HeQin. All rights reserved.
//

#import "ViewController.h"
#import "CMTitleView.h"
#import "Const.h"
#import "CMEvalluateCell.h"
#import "CMEvalluateFrame.h"
#import "CMEvaluateModel.h"

#define BottomHeight 120
#define MainNaviHeight [UIScreen mainScreen].bounds.size.height / 2 - 40

@interface ViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign)CGFloat bottomViewY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // 导航栏
    CMTitleView *titleView = [[CMTitleView alloc] init];
    [titleView setTitle:@"主页面" backBlock:^{
        
    }];
    [self.view addSubview:titleView];
    [self initData];
    // 列表
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), SCREENWIDTH, SCREENHEIGHT - CGRectGetMaxY(titleView.frame)) style:UITableViewStylePlain];
    tableView.bounces = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellEditingStyleNone;
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragAction:)];
    pan.delegate = self;
    [tableView addGestureRecognizer:pan];
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)initData {
    for (int i = 0; i < 20; i++) {
        CMEvalluateFrame *frame = [[CMEvalluateFrame alloc] init];
        CMEvaluateModel *model = [[CMEvaluateModel alloc] init];
        model.head = @"";
        model.content = @"我们如何去做一个快速有效的app，这是一个问题，那么我们如何才能做的最快,写一些模版，能更快捷，更方便的使用";
        model.name = @"iOSer";
        model.star = @"";
        model.time = @"2019/7/3";
        frame.model = model;
        [self.dataArray addObject:frame];
    }
}
#pragma mark - UITableView delegate datasoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CMEvalluateCell *cell = [CMEvalluateCell cellWithTableView:tableView];
    cell.statusFrame = self.dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CMEvalluateFrame *frame = self.dataArray[indexPath.row];
    return frame.cellHeight;
}

- (void)viewInHalf {

}
- (void)viewInBottom {
    
}
- (void)dragAction:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:self.view];
    if (_tableView.contentOffset.y >0) {
        point = [pan translationInView:_tableView];
        if ((_bottomViewY == MainNaviHeight && point.y <0) || (_bottomViewY == SCREENHEIGHT - BottomHeight && point.y <0)) {
        }else{
            return;
        }
    }
    CGFloat y = point.y ;
    y = _bottomViewY + y;
    if (y>50) {
        _tableView.scrollEnabled = NO;
    }else{
        _tableView.scrollEnabled = YES;
    }
    if (y <0 + [Const getStartYWithProfiledScreen]) {
        y = 0+ [Const getStartYWithProfiledScreen];
    }
    if (y > [UIScreen mainScreen].bounds.size.height - BottomHeight) {
        y = [UIScreen mainScreen].bounds.size.height - BottomHeight;
    }
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.bottomViewY = CGRectGetMinY(_tableView.frame);
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        _tableView.frame = CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        __weak UIView *weakbottomView = _tableView;
        if (_bottomViewY == MainNaviHeight && y == _bottomViewY) {
            return;
        }
        
        if (y > _bottomViewY) { // 向下滑
            if (y < 50) {
                [UIView animateWithDuration:0.3 animations:^{
                    weakbottomView.frame = CGRectMake(0, 0+ [Const getStartYWithProfiledScreen], SCREENWIDTH, SCREENHEIGHT);
                    
                }];
                self.bottomViewY = 0;
                return;
            }
            if (y > 50 && y < MainNaviHeight) {
                weakbottomView.frame = CGRectMake(0, MainNaviHeight, SCREENWIDTH, SCREENHEIGHT);
                [self viewInHalf];
                return;
            }
            if (y - _bottomViewY > 50) {
                weakbottomView.frame = CGRectMake(0, SCREENHEIGHT -BottomHeight, SCREENWIDTH, SCREENHEIGHT);
                [self viewInBottom];
            }else{
                weakbottomView.frame = CGRectMake(0, MainNaviHeight, SCREENWIDTH, SCREENHEIGHT);
                [self viewInHalf];
            }
        }else{
            if (y < MainNaviHeight-50) {
                [UIView animateWithDuration:0.3 animations:^{
                    weakbottomView.frame = CGRectMake(0, 0+ [Const getStartYWithProfiledScreen], SCREENWIDTH, SCREENHEIGHT);
                }];
                self.bottomViewY = 0;
                return;
            }
            if (y > MainNaviHeight-50 && y < MainNaviHeight) {
                weakbottomView.frame = CGRectMake(0, MainNaviHeight, SCREENWIDTH, SCREENHEIGHT);
                [self viewInHalf];
                return;
            }
            if (_bottomViewY - y > 50) {
                weakbottomView.frame = CGRectMake(0, MainNaviHeight, SCREENWIDTH, SCREENHEIGHT);
                [self viewInHalf];
            }else{
                weakbottomView.frame = CGRectMake(0, SCREENHEIGHT -BottomHeight, SCREENWIDTH, SCREENHEIGHT);
                [self viewInBottom];
            }
        }
        self.bottomViewY = CGRectGetMinY(_tableView.frame);
    }
}
- (void)setBottomViewY:(CGFloat)bottomViewY {
    _bottomViewY = bottomViewY;
    if (bottomViewY > 0 + [Const getStartYWithProfiledScreen]) {
        _tableView.scrollEnabled = NO;
    }else{
        _tableView.scrollEnabled = YES;
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return YES;
    }
    
    return NO;
}
@end
