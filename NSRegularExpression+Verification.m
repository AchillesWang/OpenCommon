//
//  NSRegularExpression+Verification.m
//  ZZ
//
//  Created by HuXin on 14-4-5.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "NSRegularExpression+Verification.h"

#define CM_DEBUG(fmt) NSLog(@"%@",(fmt))
#define EMAIL_SPECIFICATIONS @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}"                  //email规格
#define PN_SPECIFICATIONS @"[0-9]{3,4}+\\-[0-9]{7,8}"                                           //电话号码规格
#define ZIP_SPECIFICATIONS @"[0-9]{6}"                                                          //邮编号码规格
#define MP_SPECIFICATIONS @"[0-9]{11}"                                                          //手机号码规格
#define URL_SPECIFICATIONS @"(https?|ftp|file)://[-A-Z0-9+&@#/%?=~_|!:,.;]*[-A-Z0-9+&@#/%=~_|]" //网址规格

@implementation NSRegularExpression (Verification)

+(BOOL)isEmailWithString:(NSString *)emailStr
{
    NSString *pattemEmail = EMAIL_SPECIFICATIONS;
    NSError *error = nil;
    NSRegularExpression *regularEmail = [NSRegularExpression regularExpressionWithPattern:pattemEmail
                                                                                  options:0
                                                                                    error:&error];
    if (error) {
        CM_DEBUG(error);
        return NO;
    }
    NSTextCheckingResult *isEmail = [regularEmail firstMatchInString:emailStr options:0 range:NSMakeRange(0, [emailStr length])];
    if (isEmail) {
        return YES;
    }
    return NO;
}

+(BOOL)isPhoneNumberWithString:(NSString *)pnString
{
    NSString *pattemPN = PN_SPECIFICATIONS;
    NSError *error = nil;
    NSRegularExpression *regularPN = [NSRegularExpression regularExpressionWithPattern:pattemPN
                                                                                  options:0
                                                                                    error:&error];
    if (error) {
        CM_DEBUG(error);
        return NO;
    }
    NSTextCheckingResult *isPhoneNumber = [regularPN firstMatchInString:pnString options:0 range:NSMakeRange(0, [pnString length])];
    if (isPhoneNumber) {
        return YES;
    }
    return NO;
}

+(BOOL)isZipWithString:(NSString *)zipString
{
    NSString *pattemZip = ZIP_SPECIFICATIONS;
    NSError *error = nil;
    NSRegularExpression *regularZip = [NSRegularExpression regularExpressionWithPattern:pattemZip
                                                                                  options:0
                                                                                    error:&error];
    if (error) {
        CM_DEBUG(error);
        return NO;
    }
    NSTextCheckingResult *isZip = [regularZip firstMatchInString:zipString options:0 range:NSMakeRange(0, [zipString length])];
    if (isZip) {
        return YES;
    }
    return NO;
}

+(BOOL)isMobilePhoneWithString:(NSString *)mpString
{
    NSString *pattemMP = MP_SPECIFICATIONS;
    NSError *error = nil;
    NSRegularExpression *regularMP = [NSRegularExpression regularExpressionWithPattern:pattemMP
                                                                                  options:0
                                                                                    error:&error];
    if (error) {
        CM_DEBUG(error);
        return NO;
    }
    NSTextCheckingResult *isMobilePhone = [regularMP firstMatchInString:mpString options:0 range:NSMakeRange(0, [mpString length])];
    if (isMobilePhone) {
        return YES;
    }
    return NO;
}

+(BOOL)isURLWithString:(NSString *)urlString
{
    NSString *pattemURL = URL_SPECIFICATIONS;
    NSError *error = nil;
    NSRegularExpression *regularURL = [NSRegularExpression regularExpressionWithPattern:pattemURL
                                                                                  options:0
                                                                                    error:&error];
    if (error) {
        CM_DEBUG(error);
        return NO;
    }
    NSTextCheckingResult *isURL = [regularURL firstMatchInString:urlString options:0 range:NSMakeRange(0, [urlString length])];
    if (isURL) {
        return YES;
    }
    return NO;
}

@end
