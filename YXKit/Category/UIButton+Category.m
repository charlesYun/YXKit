//
//  UIButton+Category.m
//  YXKit
//
//  Created by 曹云霄 on 16/9/23.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

static NSString *const IndicatorViewKey = @"indicatorView";
static NSString *const ButtonTextObjectKey = @"buttonTextObject";

NSString const *UIButton_badgeKey = @"UIButton_badgeKey";
NSString const *UIButton_badgeBGColorKey = @"UIButton_badgeBGColorKey";
NSString const *UIButton_badgeTextColorKey = @"UIButton_badgeTextColorKey";
NSString const *UIButton_badgeFontKey = @"UIButton_badgeFontKey";
NSString const *UIButton_badgePaddingKey = @"UIButton_badgePaddingKey";
NSString const *UIButton_badgeMinSizeKey = @"UIButton_badgeMinSizeKey";
NSString const *UIButton_badgeOriginXKey = @"UIButton_badgeOriginXKey";
NSString const *UIButton_badgeOriginYKey = @"UIButton_badgeOriginYKey";
NSString const *UIButton_shouldHideBadgeAtZeroKey = @"UIButton_shouldHideBadgeAtZeroKey";
NSString const *UIButton_shouldAnimateBadgeKey = @"UIButton_shouldAnimateBadgeKey";
NSString const *UIButton_badgeValueKey = @"UIButton_badgeValueKey";

@implementation UIButton (Category)


/**
 快速创建按钮
 */
+(instancetype)buttonWithTitle:(NSString *)title backColor:(UIColor *)backColor backImageName:(NSString *)backImageName titleColor:(UIColor *)color fontSize:(int)fontSize frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius {
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:backColor];
    [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button sizeToFit];
    button.frame=frame;
    button.layer.cornerRadius=cornerRadius;
    button.clipsToBounds=YES;
    return button;
}


/**
 显示菊花
 */
- (void)showIndicator
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    [indicator startAnimating];
    NSString *currentButtonText = self.titleLabel.text;
    objc_setAssociatedObject(self, &ButtonTextObjectKey, currentButtonText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &IndicatorViewKey, indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.enabled = NO;
    [self setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:indicator];
}


/**
 隐藏菊花
 */
- (void)hideIndicator
{
    NSString *currentButtonText = (NSString *)objc_getAssociatedObject(self, &ButtonTextObjectKey);
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &IndicatorViewKey);
    self.enabled = YES;
    [indicator removeFromSuperview];
    [self setTitle:currentButtonText forState:UIControlStateNormal];
}


- (void)verticalCenterImageAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing/2), 0.0);
    titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing/2), 0.0, 0.0, - titleSize.width);
}


- (void)horizontalCenterTitleAndImage:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width + spacing/2);
    titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing/2, 0.0, - titleSize.width);
}



- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,  0.0, 0.0,  - spacing/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing/2, 0.0, 0.0);
}



- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing
{
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing, 0.0, 0.0);
}


- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + imageSize.width + spacing, 0.0, - titleSize.width);
}


@end
