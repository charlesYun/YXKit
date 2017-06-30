//
//  UIViewController+Category.h
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

/**
 *  从不同storyBoard获取控制器（这里storyBoard的id必须和类名一致）
 *
 *  @param storyBoardName storyBoard Name
 *
 *  @return 对应控制器
 */
+ (id)viewControllerWithStoryBoardType:(NSString *)storyBoardName;

/**
 push

 @param viewController viewcontroller
 @param animated 动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 pop
 
 @param animated 是否动画
 */
- (void)popViewControllerAnimated:(BOOL)animated;

/**
 pop to root
 
 @param animated 是否动画
 */
- (void)popToRootViewControllerAnimated:(BOOL)animated;

/**
 pop to UIViewController
 
 @param viewController viewcontroller
 @param animated 是否动画
 */
- (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
