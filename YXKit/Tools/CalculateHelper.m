//
//  CalculateHelper.m
//  YXKit
//
//  Created by 曹云霄 on 2017/6/30.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import "CalculateHelper.h"

@implementation CalculateHelper

+ (NSDecimalNumber *)calculateNum1:(id)num1 num2:(id)num2 type:(CalculateType)type roundingType:(NSRoundingMode)roundingType cutLenth:(NSInteger)coutLenth
{
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingType
                                                                                             scale:coutLenth
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:YES];
    NSDecimalNumber *decimalNum1 = [self changeType:num1];
    NSDecimalNumber *decimalNum2 = [self changeType:num2];

    if (decimalNum1 == nil || decimalNum2 == nil) {
        return nil;
    }

    NSDecimalNumber *decimalResult;
    NSString *result;

    switch (type) {
        case CalculateTypeAdd: {
            decimalResult = [decimalNum1 decimalNumberByAdding:decimalNum2 withBehavior:roundUp];
            result = [decimalResult stringValue];
            break;
        }
        case CalculateTypeSub: {
            decimalResult = [decimalNum1 decimalNumberBySubtracting:decimalNum2 withBehavior:roundUp];
            result = [decimalResult stringValue];
            break;
        }
        case CalculateTypeMul: {
            decimalResult = [decimalNum1 decimalNumberByMultiplyingBy:decimalNum2 withBehavior:roundUp];
            result = [decimalResult stringValue];
            break;
        }
        case CalculateTypeDiv: {
            if ([decimalNum2 isEqualToNumber:@0]) {
                decimalResult = [NSDecimalNumber decimalNumberWithString:@"0"];
            } else {

                decimalResult = [decimalNum1 decimalNumberByDividingBy:decimalNum2 withBehavior:roundUp];
                result = [decimalResult stringValue];
            }
            break;
        }
    }

    return decimalResult;
}

+ (NSDecimalNumber *)calculateNum1:(id)num1 num2:(id)num2 type:(CalculateType)type
{
    NSDecimalNumber *decimalNum1 = [self changeType:num1];
    NSDecimalNumber *decimalNum2 = [self changeType:num2];

    if (decimalNum1 == nil || decimalNum2 == nil) {
        return nil;
    }

    NSDecimalNumber *decimalResult;
    NSString *result;

    switch (type) {
        case CalculateTypeAdd: {
            decimalResult = [decimalNum1 decimalNumberByAdding:decimalNum2];
            result = [decimalResult stringValue];
            break;
        }
        case CalculateTypeSub: {
            decimalResult = [decimalNum1 decimalNumberBySubtracting:decimalNum2];
            result = [decimalResult stringValue];
            break;
        }
        case CalculateTypeMul: {
            decimalResult = [decimalNum1 decimalNumberByMultiplyingBy:decimalNum2];
            result = [decimalResult stringValue];
            break;
        }
        case CalculateTypeDiv: {
            if ([decimalNum2 isEqualToNumber:@0]) {
                decimalResult = [NSDecimalNumber decimalNumberWithString:@"0"];
            } else {

                decimalResult = [decimalNum1 decimalNumberByDividingBy:decimalNum2];
                result = [decimalResult stringValue];
            }
            break;
        }
    }

    return decimalResult;
}

//把传入的类型变成NSDecimalNumber
+ (NSDecimalNumber *)changeType:(id)num1
{
    NSDecimalNumber *decimalNum1;

    if ([num1 isKindOfClass:[NSDecimalNumber class]]) {
        decimalNum1 = num1;
    } else if ([num1 isKindOfClass:[NSString class]]) {
        if ([num1 isEqualToString:@""]) {
            decimalNum1 = [NSDecimalNumber decimalNumberWithString:@"0"];
        } else {
            decimalNum1 = [NSDecimalNumber decimalNumberWithString:num1];
        }
    } else if ([num1 isKindOfClass:[NSNumber class]]) {
        decimalNum1 = [NSDecimalNumber decimalNumberWithDecimal:[num1 decimalValue]];
    } else if (num1 == nil) {
        decimalNum1 = [NSDecimalNumber decimalNumberWithString:@"0"];
    } else {
        decimalNum1 = [NSDecimalNumber decimalNumberWithString:@"0"];
    }
    return decimalNum1;
}

+ (NSDecimalNumber *)decimalNumber:(id)number
{
    return [self changeType:number];
}

+ (NSDecimalNumber *)oneHundredTimes:(id)num
{
    return [self calculateNum1:num num2:@100 type:CalculateTypeMul roundingType:NSRoundPlain cutLenth:10];
}

+ (NSString *)getPercent:(id)num1 num:(id)num2
{
    [self calculateNum1:num1 num2:num1 type:CalculateTypeDiv roundingType:NSRoundPlain cutLenth:4];
    NSDecimalNumber *result = [self oneHundredTimes:[self calculateNum1:num1 num2:num2 type:CalculateTypeDiv roundingType:NSRoundPlain cutLenth:4]];
    return [NSString stringWithFormat:@"%@%%", [self getMoneyStringFromString:result.stringValue]];
}

+ (NSString *)getMoneyStringFrom:(id)num Lenth:(NSInteger)cutLenth isSeparate:(BOOL)isSeparate
{
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                             scale:cutLenth
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:YES];
    NSDecimalNumber *decimal = [self changeType:num];
    NSDecimalNumber *result = [decimal decimalNumberByAdding:[NSDecimalNumber decimalNumberWithString:@"0"] withBehavior:roundUp];

    if (isSeparate) {
        return [self separateMoney:result];
    } else {
        return [result stringValue];
    }
}

+ (NSString *)getMoneyStringFrom:(id)num
{
    NSString *originString = [self getMoneyStringFrom:num Lenth:2 isSeparate:NO];
    return [self getMoneyStringFromString:originString];
}

+ (NSString *)getMoneyStringFromString:(NSString *)originString
{
    NSArray *array = [originString componentsSeparatedByString:@"."];
    NSString *top = [array[0] stringByAppendingString:@"."];
    NSString *result;

    if (array.count == 1) {
        result = [NSString stringWithFormat:@"%@00", top];
    } else if (array.count == 2) {
        NSString *bottom = array[1];
        if (bottom.length == 2) {
            result = originString;
        }

        for (NSInteger i = bottom.length; i < 2; i++) {
            result = [originString stringByAppendingString:@"0"];
        }
    }
    return result;
}

+ (NSString *)moneyStringWithPrefix:(id)num {
  NSString *string = [self getMoneyStringFrom:num];
  if (![string hasPrefix:@"-"]) {
    return [@"+" stringByAppendingString:string];
  }else{
    return string;
  }
}

+ (NSString *)getABSValue:(NSString *)string
{
    if ([string hasPrefix:@"-"] && ![string hasPrefix:@"--"]) {
        NSString *absString = [string substringWithRange:NSMakeRange(1, string.length - 1)];
        return absString;
    } else {
        return string;
    }
}

+ (NSString *)separateMoney:(id)num1
{
    NSDecimalNumber *num = [self changeType:num1];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.locale = [NSLocale currentLocale];// this ensure the right separator behavior
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    numberFormatter.usesGroupingSeparator = YES;
    // example for writing the number object into a label
    NSString *string = [numberFormatter stringFromNumber:num];
    return string;
}

/** add */
+ (NSDecimalNumber *)add:(id)num1 num2:(id)num2
{
    return [self calculateNum1:num1 num2:num2 type:CalculateTypeAdd];
}
/** sub */
+ (NSDecimalNumber *)sub:(id)num1 num2:(id)num2
{
    return [self calculateNum1:num1 num2:num2 type:CalculateTypeSub];
}
/** mul */
+ (NSDecimalNumber *)mul:(id)num1 num2:(id)num2
{
    return [self calculateNum1:num1 num2:num2 type:CalculateTypeMul];
}
/** div */
+ (NSDecimalNumber *)div:(id)num1 num2:(id)num2
{
    return [self calculateNum1:num1 num2:num2 type:CalculateTypeDiv];
}

+ (BOOL)number:(id)num isInNum1:(id)num1 num2:(id)num2
{
    NSDecimalNumber *decNum = [self decimalNumber:num];
    NSDecimalNumber *minNumber;
    NSDecimalNumber *maxNumber;
    NSDecimalNumber *decNumber1 = [self decimalNumber:num1];
    NSDecimalNumber *decNumber2 = [self decimalNumber:num2];
    NSComparisonResult result = [decNumber1 compare:decNumber2];
    if (result == NSOrderedAscending) {
        minNumber = decNumber1;
        maxNumber = decNumber2;
    } else {
        minNumber = decNumber2;
        maxNumber = decNumber1;
    }

    if (([decNum compare:minNumber] == NSOrderedDescending && [decNum compare:maxNumber] == NSOrderedAscending) || [decNum compare:minNumber] == NSOrderedSame || [decNum compare:maxNumber] == NSOrderedSame) {
        return YES;
    } else {
        return NO;
    }
}

@end
