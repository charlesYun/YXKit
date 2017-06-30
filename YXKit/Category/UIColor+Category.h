//
//  UIColor+Category.h
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

/**
 *  RGB颜色
 *
 *  @param red   红色比例
 *  @param green 绿色比例
 *  @param blue  蓝色比例
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;


/**
 * 随机颜色
 */
+ (UIColor *)randomColor;

@end
