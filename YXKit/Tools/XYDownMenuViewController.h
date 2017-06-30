//
//  XYDownMenuViewController.h
//  SaleHelper
//
//  Created by 曹云霄 on 2017/1/4.
//  Copyright © 2017年 上海勾芒信息科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClickActionDelegate <NSObject>

@required

/**
 点击item

 @param indexPath indexpath
 */
- (void)clickItemWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface XYDownMenuViewController : UIViewController



/**
 创建下拉菜单

 @param array           数据源数组 格式@[@{@"title":@"",@"code":@""}]
 @param delegate        代理
 @param button          响应的button，决定显示的位置
 @param selected        默认选中下标
 @parm selectedColor    选中颜色
 @return DownMenu
 */
- (instancetype)initWithViewControllerWithArray:(NSArray *)array withDelegate:(id<ClickActionDelegate>)delegate withButton:(UIButton *)button withSelectedColor:(UIColor *)selectedColor defaultSelected:(int)selected;

/**
 隐藏
 */
- (void)dismissViewController;

/**
 显示
 */
- (void)showViewController;


@end
