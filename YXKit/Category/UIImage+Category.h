//
//  UIImage+Category.h
//  YXKitDemo
//
//  Created by 曹云霄 on 2017/6/30.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

//截屏
+(instancetype)snapshotCurrentScreen;

//图片模糊效果
- (UIImage *)blur;

//高效添加圆角图片
- (UIImage*)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

/** 压缩图片 最大字节大小为maxLength */
- (NSData *)compressWithMaxLength:(NSInteger)maxLength;

/** 纠正图片的方向 */
- (UIImage *)fixOrientation;

/** 按给定的方向旋转图片 */
- (UIImage*)rotate:(UIImageOrientation)orient;

/** 压缩图片至指定尺寸 */
- (UIImage *)rescaleImageToSize:(CGSize)size;

/** 压缩图片至指定像素 */
- (UIImage *)rescaleImageToPX:(CGFloat )toPX;

/**
 加载gif

 @param name gif图片名称
 */
+ (UIImage *)animatedGIFNamed:(NSString *)name;

/**
 *  给图片加水印图片
 *
 *  @param image   水印图片
 *  @param imgRect 水印图片所在位置，大小
 *  @param alpha   水印图片的透明度，0~1之间，透明度太大会完全遮盖被加水印图片的那一部分
 *
 *  @return 加完水印的图片
 */
- (UIImage*)imageWaterMarkWithImage:(UIImage *)image imageRect:(CGRect)imgRect alpha:(CGFloat)alpha;
/**
 *  给图片加文字水印
 *
 *  @param str     水印文字
 *  @param strPoint 文字所在的位置大小
 *  @param attri   文字的相关属性，自行设置
 *
 *  @return 加完水印文字的图片
 */
- (UIImage*)imageWaterMarkWithString:(NSString*)str point:(CGPoint)strPoint attribute:(NSDictionary*)attri;
/**
 *  返回加水印文字和图片的图片
 *
 *  @param str      水印文字
 *  @param strPoint 文字（0，0）点所在位置
 *  @param attri    文字属性
 *  @param image    水印图片
 *  @param imgRect 图片（0，0）点所在位置
 *  @param alpha    透明度
 *
 *  @return 加完水印的图片
 */
- (UIImage*)imageWaterMarkWithString:(NSString*)str point:(CGPoint)strPoint attribute:(NSDictionary *)attri image:(UIImage *)image imageRect:(CGRect)imgRect alpha:(CGFloat)alpha;
@end
