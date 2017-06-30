//
//  UIImageView+AnimationView.h
//  YXKit
//
//  Created by 曹云霄 on 2017/1/13.
//  Copyright © 2017年 caoyunxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AnimationView)<CAAnimationDelegate>


/**
 动画

 @param endpoint 结束坐标
 @param controlpoint 中间坐标
 */
- (void)startAnimationWithEndPoint:(CGPoint)endpoint withControlPoint:(CGPoint)controlpoint animateWithDuration:(NSTimeInterval)time;

/**
 用于RAC订阅是否调用

 @param layerAnimation 动画layer
 */
- (void)removeFromLayer:(CALayer *)layerAnimation;
@end
