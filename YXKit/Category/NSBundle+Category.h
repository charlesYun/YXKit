//
//  NSBundle+Category.h
//  YXKit
//
//  Created by 曹云霄 on 2017/1/22.
//  Copyright © 2017年 caoyunxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSBundle (Category)


/**
 获取App icon

 @return 图片路径
 */
- (NSString *)appIconPath;


/**
 获取App icon

 @return 图片
 */
- (UIImage *)appIcon;

@end
