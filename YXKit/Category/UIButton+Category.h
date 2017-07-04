//
//  UIButton+Category.h
//  YXKit
//
//  Created by 曹云霄 on 16/9/23.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

/*****************************跳转图片和文字的位置*****************************/
//上下居中，图片在上，文字在下
- (void)verticalCenterImageAndTitle:(CGFloat)spacing;

//左右居中，文字在左，图片在右
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing;

//左右居中，图片在左，文字在右
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;

//文字居中，图片在左边
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;

//文字居中，图片在右边
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;


/**
 快速创建按钮

 @param title         标题
 @param backColor     背景色
 @param backImageName 背景图片名称
 @param color         文字颜色
 @param fontSize      字体大小
 @param frame         frame
 @param cornerRadius  圆角
 @return              UIButton
 */
+(instancetype)buttonWithTitle:(NSString *)title backColor:(UIColor *)backColor backImageName:(NSString *)backImageName titleColor:(UIColor *)color fontSize:(int)fontSize frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius;

/** 显示菊花 */
- (void)showIndicator;

/** 隐藏菊花 */
- (void)hideIndicator;


@end
