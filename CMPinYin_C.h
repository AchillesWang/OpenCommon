//
//  ACPinYin_C.h
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#ifndef OpenCommon_CMPinYin_C_h
#define OpenCommon_CMPinYin_C_h

static NSString *getPinYin(NSString *sourceString)
{
    NSMutableString *newStr = [NSMutableString stringWithString:sourceString];
    CFRange range = CFRangeMake(0, newStr.length);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformStripCombiningMarks, NO);
    return newStr;//获取中文拼音
}

#endif
