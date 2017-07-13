//
//  UIImageView+AnimationView.m
//  YXKit
//
//  Created by 曹云霄 on 2017/1/13.
//  Copyright © 2017年 caoyunxiao. All rights reserved.
//

#import "UIImageView+AnimationView.h"

@implementation UIImageView (AnimationView)


/**
 动画
 
 @param endpoint 结束坐标
 @param controlpoint 中间坐标
 */
- (void)startAnimationWithEndPoint:(CGPoint)endpoint withControlPoint:(CGPoint)controlpoint animateWithDuration:(NSTimeInterval)time completed:(void (^)())completed;
{
    //终点
    CGPoint endPoint = endpoint;
    //控点
    CGPoint controlPoint = controlpoint;
    //路径曲线
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:self.center];
    [movePath addQuadCurveToPoint:endPoint
                     controlPoint:controlPoint];
    //关键帧
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.removedOnCompletion = YES;
    
    //缩小变化
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //x，y轴缩小到0.1,Z 轴不变
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];
    scaleAnim.removedOnCompletion = YES;
    
    //透明度变化
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    opacityAnim.removedOnCompletion = YES;
    
    //关键帧，旋转，透明度组合起来执行
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    //当动画完成，停留到结束位置
    animGroup.removedOnCompletion = NO;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, scaleAnim,opacityAnim, nil];
    animGroup.duration = time;
    animGroup.delegate = self;
    [self.layer addAnimation:animGroup forKey:nil];
    [self performSelector:@selector(removeFromLayer:) withObject:self.layer afterDelay:time];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completed();
    });
    
}

#pragma mark -动画完成后移除
- (void)removeFromLayer:(CALayer *)layerAnimation{
    
    [layerAnimation removeFromSuperlayer];
}

@end
