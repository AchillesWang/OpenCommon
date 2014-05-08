//
//  NSRegularExpression+Verification.h
//  ZZ
//
//  Created by WangXiaoXiang on 14-4-5.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>


#define EMAIL_SPECIFICATIONS @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}"                  //email规格
#define PN_SPECIFICATIONS @"[0-9]{3,4}+\\-[0-9]{7,8}"                                           //电话号码规格
#define ZIP_SPECIFICATIONS @"[0-9]{6}"                                                          //邮编号码规格
#define MP_SPECIFICATIONS @"[0-9]{11}"                                                          //手机号码规格
#define URL_SPECIFICATIONS @"(https?|ftp|file)://[-A-Z0-9+&@#/%?=~_|!:,.;]*[-A-Z0-9+&@#/%=~_|]" //网址规格

@interface NSRegularExpression (Valid)
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


/**
 *  验证字符串，是否支持某个规则
 *
 *  @param str     字符串
 *  @param regular 规则
 *
 *  @return 验证结果
 */
+(BOOL)validString:(NSString *)str regular:(NSString *)regular;

@end
