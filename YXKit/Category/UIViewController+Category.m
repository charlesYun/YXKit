//
//  UIViewController+Category.m
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)



/**
 push

 @param viewController viewcontroller
 @param animated 是否动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.navigationController pushViewController:viewController animated:YES];
}


/**
 pop

 @param animated 是否动画
 */
- (void)popViewControllerAnimated:(BOOL)animated
{
    [self.navigationController popViewControllerAnimated:animated];
}

/**
 pop to root

 @param animated 是否动画
 */
- (void)popToRootViewControllerAnimated:(BOOL)animated
{
    [self.navigationController popToRootViewControllerAnimated:animated];
}


/**
 pop to UIViewController

 @param viewController viewcontroller
 @param animated 是否动画
 */
- (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.navigationController popToViewController:viewController animated:animated];
}























@end
