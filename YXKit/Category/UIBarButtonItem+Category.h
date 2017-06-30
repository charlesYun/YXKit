//
//  UIBarButtonItem+Category.h
//  YXKit
//
//  Created by 曹云霄 on 2017/1/22.
//  Copyright © 2017年 caoyunxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Category.h"
@interface UIBarButtonItem (Category)


/**
 添加LeftBarButtonItem
 
 @param title     文字
 @param imageName 图片
 @param action    事件
 */
+ (instancetype)addCustomLeftBarButtonItem:(NSString *)title withTarget:(id)target withImageNamed:(NSString *)imageName withAction:(SEL)action;

/**
 添加RightBarButtonItem
 
 @param title     文字
 @param imageName 图片
 @param action    事件
 */
+ (instancetype)addCustomRightBarButtonItem:(NSString *)title withTarget:(id)target withImageNamed:(NSString *)imageName withAction:(SEL)action;



@end
