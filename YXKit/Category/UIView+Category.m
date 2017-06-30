//
//  UIView+Category.m
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (CGFloat) x {
    return self.frame.origin.x;
}

- (void) setX:(CGFloat)x {
    CGRect nframe = self.frame;
    
    nframe.origin.x = x;
    
    self.frame = nframe;
}

- (CGFloat) y {
    return self.frame.origin.y;
}

- (void) setY:(CGFloat)y {
    CGRect nframe = self.frame;
    
    nframe.origin.y = y;
    
    self.frame = nframe;
}

- (CGFloat) width {
    return self.frame.size.width;
}

- (void) setWidth:(CGFloat)width {
    CGRect nframe = self.frame;
    
    nframe.size.width = width;
    
    self.frame = nframe;
}

- (CGFloat) height {
    return self.frame.size.height;
}

- (void) setHeight:(CGFloat)height {
    CGRect nframe = self.frame;
    
    nframe.size.height = height;
    
    self.frame = nframe;
}

// Retrieve and set the origin, size
- (CGPoint) origin {
    return self.frame.origin;
}

- (void) setOrigin:(CGPoint)aPoint {
    CGRect nframe = self.frame;
    
    nframe.origin = aPoint;
    
    self.frame = nframe;
}

- (CGSize) size {
    return self.frame.size;
}

- (void) setSize:(CGSize)aSize {
    CGRect nframe = self.frame;
    
    nframe.size = aSize;
    
    self.frame = nframe;
}

- (CGFloat) left {
    return self.x;
}

- (void) setLeft:(CGFloat)left {
    self.x = left;
}

- (CGFloat) right {
    return CGRectGetMaxX(self.frame);
}

- (void) setRight:(CGFloat)right {
    self.x = right - self.width;
}

- (CGFloat) top {
    return self.y;
}

- (void) setTop:(CGFloat)top {
    self.y = top;
}

- (CGFloat) bottom {
    return CGRectGetMaxY(self.frame);
}

- (void) setBottom:(CGFloat)bottom {
    self.y = bottom - self.height;
}

- (void)addCorner:(CGFloat)coefficient
{
    self.layer.cornerRadius = coefficient;
    self.layer.masksToBounds = YES;
}

- (void)addBorderWidth:(CGFloat)lineWidth lineColor:(UIColor *)color
{
    self.layer.borderWidth = lineWidth;
    self.layer.borderColor = color.CGColor;
}

- (id)viewWithClass:(Class)aClass {
    __block id machedView = nil;
    
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass]) {
            machedView = obj;
            *stop = YES;
        }
    }];
    return machedView;
}

- (void)removeSubViewWithClass:(Class)aClass {
    [[self viewWithClass:aClass] removeFromSuperview];
}

- (void)removeSubViewWithTag:(NSInteger)tag {
    [[self viewWithTag:tag] removeFromSuperview];
}

- (void)removeAllSubViews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)shakeAnimation {
    
    CALayer* layer = [self layer];
    CGPoint position = [layer position];
    CGPoint y = CGPointMake(position.x - 8.0f, position.y);
    CGPoint x = CGPointMake(position.x + 8.0f, position.y);
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.08f];
    [animation setRepeatCount:3];
    [layer addAnimation:animation forKey:nil];
}
- (void)springingAnimation
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[self layer] addAnimation:popAnimation forKey:nil];
}

























@end
