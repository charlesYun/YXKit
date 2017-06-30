//
//  CalculateHelper.h
//  YXKit
//
//  Created by 曹云霄 on 2017/6/30.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, CalculateType) {
    CalculateTypeAdd = 0, //加
    CalculateTypeSub,  //减
    CalculateTypeMul,  //乘
    CalculateTypeDiv   //除
};
@interface CalculateHelper : NSObject

/*
 NSRoundPlain,   // Round up on a tie ／／貌似取整
 
 NSRoundDown,    // Always down == truncate  ／／只舍不入
 
 NSRoundUp,      // Always up    ／／ 只入不舍
 
 NSRoundBankers  // on a tie round so last digit is even  貌似四舍五入
 */
/**
 *  计算
 *
 *  @param num1         第一个数字
 *  @param num2         第二个数字
 *  @param type         计算类型（加减乘除）
 *  @param roundingType 四舍五入类型
 *  @param coutLenth    小数点后面保留几位
 *
 *  @return 结算结果
 */
+ (NSDecimalNumber *)calculateNum1:(id)num1 num2:(id)num2 type:(CalculateType)type roundingType:(NSRoundingMode)roundingType cutLenth:(NSInteger)coutLenth;
+ (NSDecimalNumber *)calculateNum1:(id)num1 num2:(id)num2 type:(CalculateType)type;
/** add */
+ (NSDecimalNumber *)add:(id)num1 num2:(id)num2;
/** sub */
+ (NSDecimalNumber *)sub:(id)num1 num2:(id)num2;
/** mul */
+ (NSDecimalNumber *)mul:(id)num1 num2:(id)num2;
/** div */
+ (NSDecimalNumber *)div:(id)num1 num2:(id)num2;
/** 一百倍 */
+ (NSDecimalNumber *)oneHundredTimes:(id)num;
/** 计算百分比 */
+ (NSString *)getPercent:(id)num1 num:(id)num2;
/** 获取金额 保留两位小数*/
+ (NSString *)getMoneyStringFrom:(id)num;
/** 获取金额 */
+ (NSString *)getMoneyStringFrom:(id)num Lenth:(NSInteger)cutLenth isSeparate:(BOOL)isSeparate;

+ (NSString *)getMoneyStringFromString:(NSString *)originString;
//获取金额包涵正负号
+ (NSString *)moneyStringWithPrefix:(id)num;
//获得绝对值
+ (NSString *)getABSValue:(NSString *)string;
/** 每3位加逗号 */
+ (NSString *)separateMoney:(id)num;
/** 把非decimalNumber转化 */
+ (NSDecimalNumber *)decimalNumber:(id)number;
/**
 *  判断数字是否在给定的范围内，num1和num2的顺序不影响判断
 *
 *  @param num  需要判断的数字
 *  @param num1 范围区间
 *  @param num2 范围区间
 *
 *  @return 是否在区间内
 */
+ (BOOL)number:(id)num isInNum1:(id)num1 num2:(id)num2;
@end
