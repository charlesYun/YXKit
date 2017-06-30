//
//  NSArray+Category.h
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (Category)

/**
 *  防止数组越界
 *
 *  @param index 下标
 *
 *  @return 元素
 */
- (id)yx_objectAtIndex:(NSUInteger)index;

/**
 *  读取Plist文件的
 *
 *  @param plistName plist文件名字
 *
 *  @return NSArray
 */
- (NSArray *)arrayFromPlistName:(NSString *)plistName;

@end
