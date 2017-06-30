//
//  UIBarButtonItem+Category.m
//  YXKit
//
//  Created by 曹云霄 on 2017/1/22.
//  Copyright © 2017年 caoyunxiao. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

/**
 添加LeftBarButtonItem
 
 @param title     文字
 @param imageName 图片
 @param action    事件
 */
+ (instancetype)addCustomLeftBarButtonItem:(NSString *)title withTarget:(id)target withImageNamed:(NSString *)imageName withAction:(SEL)action
{
    //纯图片
    if ([[self class] isBlankString:title] && ![[self class] isBlankString:imageName]) {
        return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStyleDone target:target action:action];
    //纯文字
    }else if (![[self class] isBlankString:title] && [[self class] isBlankString:imageName]) {
        return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:action];
    //图片、文字
    }else if (![[self class] isBlankString:title] && ![[self class] isBlankString:imageName]) {
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [leftButton setTitle:title forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [leftButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [leftButton horizontalCenterImageAndTitle:10.0f];
        leftButton.frame = CGRectMake(0, 0, 100, 45);
        return [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    }
    return [[UIBarButtonItem alloc] init];
}

/**
 添加RightBarButtonItem
 
 @param title     文字
 @param imageName 图片
 @param action    事件
 */
+ (instancetype)addCustomRightBarButtonItem:(NSString *)title withTarget:(id)target withImageNamed:(NSString *)imageName withAction:(SEL)action
{
    //纯图片
    if ([[self class] isBlankString:title] && ![[self class] isBlankString:imageName]) {
        return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStyleDone target:target action:action];
    //纯文字
    }else if (![[self class] isBlankString:title] && [[self class] isBlankString:imageName]) {
        return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:action];
    //图片、文字
    }else if (![[self class] isBlankString:title] && ![[self class] isBlankString:imageName]) {
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [rightButton setTitle:title forState:UIControlStateNormal];
        [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [rightButton horizontalCenterImageAndTitle:10.0f];
        rightButton.frame = CGRectMake(0, 0, 100, 45);
        return [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }
    return [[UIBarButtonItem alloc] init];
}

#pragma mark - 判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
