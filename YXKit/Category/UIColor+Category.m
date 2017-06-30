//
//  UIColor+Category.m
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)


+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (instancetype)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}

+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}
@end
