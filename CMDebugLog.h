//
//  OPDebugLog.h
//  OpenCommon
//
//  Created by HuXin on 14-4-2.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMDebugLog : NSObject
/**
 *	@brief	获取日志保存路径
 *
 *	@return	日志路径
 */
+ (NSString *)logPath;

/**
 *	@brief	写入信息
 *
 *	@param 	content 	内容
 */
+ (void)writeInfo:(NSString *)content;

/**
 *	@brief	写入警告
 *
 *	@param 	content 	内容
 */
+ (void)writeWarning:(NSString *)content;

/**
 *	@brief	写入错误
 *
 *	@param 	content 	内容
 */
+ (void)writeError:(NSString *)content;

/**
 *	@brief	写入内容
 *
 *	@param 	content 	内容字典对象
 */
+ (void)writeContentWithDictionary:(NSDictionary *)content;

@end
