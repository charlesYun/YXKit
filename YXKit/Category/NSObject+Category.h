//
//  NSObject+Category.h
//  YXKit
//
//  Created by 曹云霄 on 16/9/22.
//  Copyright © 2016年 caoyunxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>



@interface NSObject (Category)

//app版本号
+ (NSString *)version;

//app build号
+ (NSInteger)build;

//app id
+ (NSString *)identifier;

//当前语言
+ (NSString *)currentLanguage;

//类名
- (NSString *)className;
+ (NSString *)className;

//父类名称
- (NSString *)superClassName;
+ (NSString *)superClassName;

/**
 * 字典给模型赋值
 * 用字典给一个类里的属性赋值,如有值是类中不存在的,常规情况下程序会崩溃
 * 根据本类的属性有选择的拿字典中的key value，如果本类的属性包含字典的key,则把key的value赋值给这个属性
 */
-(void)modelWithDictionary:(NSDictionary *)dict;


/***************************************Runtime***********************************************/

/** 属性列表 */
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;

/** 格式化之后的属性列表 */
+ (NSArray *)propertiesWithCodeFormat;

/** 成员变量列表 */
- (NSArray *)ivarInfo;
+ (NSArray *)ivarInfo;

/** 对象方法列表 */
-(NSArray*)instanceMethodList;
+(NSArray*)instanceMethodList;

/** 类方法列表 */
+(NSArray*)classMethodList;

/** 协议列表 */
-(NSDictionary *)protocolList;
+(NSDictionary *)protocolList;


/** 交换实例方法 */
+ (void)SwizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
/** 交换类方法 */
+ (void)SwizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;

/** 添加方法 */
+ (void)addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;

@end
