//
//  UIView+Category.h
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (Category)

/**
 *  UIView/frame信息
 */
@property (assign) CGFloat x;
@property (assign) CGFloat y;
@property (assign) CGFloat width;
@property (assign) CGFloat height;
@property (assign) CGSize  size;
@property (assign) CGPoint origin;
@property (assign) CGFloat left;
@property (assign) CGFloat right;
@property (assign) CGFloat top;
@property (assign) CGFloat bottom;


/**
 *  添加圆角
 *
 *  @param coefficient 圆角大小
 */
- (void)addCorner:(CGFloat)coefficient;

/**
 *  添加边框
 *
 *  @param lineWidth 宽度
 *  @param color     颜色
 */
- (void)addBorderWidth:(CGFloat)lineWidth lineColor:(UIColor *)color;

/**
 *  设置width
 *
 *  @param width 宽度
 */
- (void)setWidth:(CGFloat)width;

/**
 *  设置height
 *
 *  @param height 高度
 */
- (void)setHeight:(CGFloat)height;

/**
 *  删除所有子视图
 */
- (void)removeAllSubViews;

/**
 *  通过对象来删除子视图
 *
 *  @param aClass 对象
 */
- (void)removeSubViewWithClass:(Class)aClass;

/**
 *  通过Tag值来删除子视图
 *
 *  @param tag tag值
 */
- (void)removeSubViewWithTag:(NSInteger)tag;

/**
 *  摇动动画
 */
- (void)shakeAnimation;

/**
 *  弹起动画
 */
- (void)springingAnimation;



@end
