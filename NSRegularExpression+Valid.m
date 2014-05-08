//
//  NSRegularExpression+Verification.m
//  ZZ
//
//  Created by HuXin on 14-4-5.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "NSRegularExpression+Valid.h"
#import "CMDebugLog.h"


#define CM_DEBUG(fmt) CMDebugLogWriteError((fmt))

@implementation NSRegularExpression (Valid)


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

+(BOOL)validString:(NSString *)str regular:(NSString *)regular
{
    NSString *pattemMP = regular;
    NSError *error = nil;
    NSRegularExpression *regularMP = [NSRegularExpression regularExpressionWithPattern:pattemMP
                                                                               options:0
                                                                                 error:&error];
    if (error) {
        CM_DEBUG(error);
        return NO;
    }
    NSTextCheckingResult *isRight = [regularMP firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
    if (isRight) {
        return YES;
    }
    return NO;
}

@end
