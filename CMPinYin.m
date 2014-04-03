//
//  CMPinYin.m
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "CMPinYin.h"
#include "CMPinYin_C.h"

@implementation CMPinYin

+ (NSString *)firstLatter:(NSString *)str {
    return [[getPinYin(str) substringToIndex:1] uppercaseString];
}

+ (NSString *)pinYin:(NSString *)str
{
    return getPinYin(str);
}
@end
