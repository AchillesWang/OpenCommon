//
//  NSRegularExpression+Verification.h
//  ZZ
//
//  Created by HuXin on 14-4-5.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSRegularExpression (Verification)
/**
 *  验证邮箱
 *
 *  @param emailStr Email邮箱地址
 *
 *  @return 是否是Email
 */
+(BOOL)isEmailWithString:(NSString *)emailString;

/**
 *  验证座机号码
 *
 *  @param pnString 电话号码
 *
 *  @return 是否是电话号码
 */
+(BOOL)isPhoneNumberWithString:(NSString *)pnString;

/**
 *  验证邮编
 *
 *  @param zipString 邮编号码
 *
 *  @return 是否是邮编号码
 */
+(BOOL)isZipWithString:(NSString *)zipString;

/**
 *  验证移动电话
 *
 *  @param mbString 移动电话号码
 *
 *  @return 是否是移动电话号码
 */
+(BOOL)isMobilePhoneWithString:(NSString *)mpString;

/**
 *  验证网页地址
 *
 *  @param urlString 网页地址
 *
 *  @return 是否是网页地址
 */
+(BOOL)isURLWithString:(NSString *)urlString;

@end
