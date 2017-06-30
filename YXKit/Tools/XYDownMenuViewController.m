//
//  XYDownMenuViewController.m
//  YXKit
//
//  Created by 曹云霄 on 2017/1/4.
//  Copyright © 2017年 上海勾芒信息科技. All rights reserved.
//

#import "XYDownMenuViewController.h"
#import "YXKitHeader.h"

@interface XYDownMenuViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView *menuTableView;

/**
 是否显示
 */
@property (nonatomic,assign) BOOL isShow;

/**
 是否新建
 */
@property (nonatomic,assign) BOOL isCreate;

/**
 title
 */
@property (nonatomic,strong) NSArray *titleArray;

/**
 代理
 */
@property (nonatomic,weak) id<ClickActionDelegate>clickDelegate;

/**
 按钮
 */
@property (nonatomic,strong) UIButton *sender;

/**
 默认选中
 */
@property (nonatomic,assign) int defaultSelected;

/**
 选中颜色
 */
@property (nonatomic,strong) UIColor *selectedColor;

@end

@implementation XYDownMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self uiConfigAction];
    [self setUpTableView];
}

#pragma mark - UI
- (void)uiConfigAction
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissViewController:)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    self.view.backgroundColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:0.3];
}

#pragma mark -UITableView
- (void)setUpTableView
{
    CGFloat height = ((self.titleArray.count * 44) > AppWindow.width)?AppWindow.width:(self.titleArray.count * 44);
    self.menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, height) style:UITableViewStylePlain];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    self.menuTableView.tableFooterView = [UIView new];
    self.menuTableView.backgroundColor = [UIColor whiteColor];
    [self.menuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.menuTableView];
}

#pragma mark - <UITableViewDataSource>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row][@"title"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.tintColor = self.selectedColor;
    BOOL boolValue = (indexPath.row == self.defaultSelected);
    boolValue?[self selectedCell:cell]:[self defalutCell:cell];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    for (UITableViewCell *cell in tableView.visibleCells) {
        [self defalutCell:cell];
    }
    [self selectedCell:cell];
    if ([self.clickDelegate respondsToSelector:@selector(clickItemWithIndexPath:)]) {
        [self.clickDelegate clickItemWithIndexPath:indexPath];
    }
    [self dismissViewController];
}

#pragma mark -默认状态
- (void)defalutCell:(UITableViewCell *)cell
{
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.textColor = [UIColor darkGrayColor];
}

#pragma mark -选中状态
- (void)selectedCell:(UITableViewCell *)cell
{
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.textLabel.textColor = self.selectedColor;
}

#pragma mark - 创建
- (instancetype)initWithViewControllerWithArray:(NSArray *)array withDelegate:(id<ClickActionDelegate>)delegate withButton:(UIButton *)button withSelectedColor:(UIColor *)selectedColor defaultSelected:(int)selected
{
    if (self = [super init]) {
        if (array.count) {
            self.titleArray = array;
        }
        self.clickDelegate = delegate;
        self.sender = button;
        self.defaultSelected = selected;
        self.selectedColor = selectedColor;
        CGPoint point = [button convertPoint:button.frame.origin toView:AppWindow];
        self.view.frame = CGRectMake(0,point.y+button.height , self.view.width, AppWindow.height-point.y-button.height);
        self.view.alpha = 0;
    }
    return self;
}

#pragma mark - 销毁控制器
- (void)disMissViewController:(UITapGestureRecognizer *)sender
{
    [self dismissViewController];
}

#pragma mark - 销毁
- (void)dismissViewController
{
    self.sender.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 0;
    }completion:^(BOOL finished) {
        self.isShow = NO;
        [self.view removeFromSuperview];
        self.isCreate = YES;
    }];
}

#pragma mark - 显示
- (void)showViewController
{
    if (self.isShow) {
        [self dismissViewController];
    }else {
        if (self.isCreate) {
           [AppWindow addSubview:[self initWithViewControllerWithArray:self.titleArray withDelegate:self.clickDelegate withButton:self.sender withSelectedColor:self.selectedColor defaultSelected:self.defaultSelected].view];
        }
        self.sender.selected = YES;
        [UIView animateWithDuration:0.3 animations:^{
            self.view.alpha = 1;
        }completion:^(BOOL finished) {
            self.isShow = YES;
        }];
    }
}

#pragma mark -UIGestureRecognizerDelegate代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (CGRectContainsPoint(self.menuTableView.frame, [touch locationInView:self.menuTableView])) {
        return NO;
    }
    return YES;
}

@end
