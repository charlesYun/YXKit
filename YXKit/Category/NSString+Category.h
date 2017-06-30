//
//  NSString+Category.h
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

/**
 *  判断字符串是否为空
 */
- (BOOL)empty;
/**
 *  判断字符串是否为整数
 */
- (BOOL)isInteger;
/**
 *  判断字符串是否为浮点数
 */
- (BOOL)isFloat;
/**
 *  判断字符串是否含有特殊字符
 */
- (BOOL)isHasSpecialcharacters;
/**
 *  判断字符串是否含有数字
 */
- (BOOL)isHasNumder;
/**
 *  毫秒级时间戳转日期
 */
- (NSDate *)dateValueWithMillisecondsSince1970;
/**
 *  秒级时间戳转日期
 */
- (NSDate *)dateValueWithTimeIntervalSince1970;
/**
 *  计算string字数
 */
- (NSInteger)stringLength;
/**
 *  检测是否含有某个字符
 */
- (BOOL)containString:(NSString *)string;
/**
 *  是否含有汉字
 */
- (BOOL)containsChineseCharacter;
/**
 *  计算字符串高度
 */
- (CGSize)heightWithWidth:(CGFloat)width andFont:(CGFloat)font;
/**
 *  计算字符串宽度
 */
- (CGSize)widthWithHeight:(CGFloat)height andFont:(CGFloat)font;
/**
 *  邮箱地址有效性
 */
- (BOOL)isEmail;
/**
 *  url有效性
 */
- (BOOL)isUrl;
/**
 *  电话号码有效性
 */
- (BOOL)isTelephone;
/**
 *  邮政编码有效性
 */
- (BOOL)isValidZipcode;
/**
 *  由英文、字母或数字组成 6-18位 密码有效性
 */
- (BOOL)isPassword;
/**
 *  数字有效性
 */
- (BOOL)isNumbers;
/**
 *  匹配英文字母
 */
- (BOOL)isLetter;
/**
 *  匹配大写英文字母
 */
- (BOOL)isCapitalLetter;
/**
 *  匹配小写英文字母
 */
- (BOOL)isSmallLetter;
/**
 *  日期随机数
 */
+ (NSString*)getTimeAndRandomString;
/**
 *  将得到的json的回车替换转义字符
 */
- (NSString *)changeJsonEnter;
/**
 *  email 转换为 312******@qq.com 形式
 */
- (NSString *)emailChangeToPrivacy;
/**
 *   判断字符串时候含有Emoji
 */
- (BOOL)isIncludingEmoji;
/**
 *  移除掉字符串中得Emoji
 */
- (instancetype)removedEmojiString;

/**
 *  md5加密(32位 常规)
 *
 *  @return 加密后的字符串
 */
- (NSString *)md5;
/**
 *  md5加密(16位)
 *
 *  @return 加密后的字符串
 */
- (NSString *)md5_16;
/**
 *  sha1加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)sha1;
/**
 *  sha256加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)sha256;
/**
 *  sha384加密
 *
 *  @return 加密后的字符串
 */
- (NSString *)sha384;
/**
 *  sha512加密
 *
 *  @return 加密后的字符串
 */
- (NSString*)sha512;




@end


