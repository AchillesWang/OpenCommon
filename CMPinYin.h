//
//  CMPinYin.h
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMPinYin : NSObject
/**
 *  获得中文的拼音（"我爱你"->"wo ai ni"）
 *
 *  @param str 中文字符串
 *
 *  @return 拼音
 */
+ (NSString *)pinYin:(NSString *)str;
/**
 *  返回中文的首字母（"大哥"->"D"）
 *
 *  @param str 中文字符串
 *
 *  @return 首字母
 */
+ (NSString *)firstLatter:(NSString *)str;

@end
