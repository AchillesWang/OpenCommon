//
//  CMPinYin.m
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "CMPinYin.h"

#define CMGetPinYin(sourceString) getPinYin((sourceString))

static NSString *getPinYin(NSString *sourceString)
{
    NSMutableString *newStr = [NSMutableString stringWithString:sourceString];
    CFRange range = CFRangeMake(0, newStr.length);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformStripCombiningMarks, NO);
    return newStr;//获取中文拼音
}


@implementation CMPinYin

+ (NSString *)firstLatter:(NSString *)str {
    return [[getPinYin(str) substringToIndex:1] uppercaseString];
}

+ (NSString *)pinYin:(NSString *)str
{
    return getPinYin(str);
}
@end
