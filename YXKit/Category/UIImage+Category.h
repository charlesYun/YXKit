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
@end
