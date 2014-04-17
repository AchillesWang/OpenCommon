//
//  NdUncaughtExceptionHandler.h
//  OpenCommon
//  [CMUncaughtExceptionHandler setDefaultHandler];
//  Created by 汪潇翔 on 14-4-15.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CMUncaughtExceptionHandler : NSObject
/**
 *  设置默认处理方式
 */
+ (void)setDefaultHandler;
/**
 *  获得处理方式
 *
 *  @return 处理
 */
+ (NSUncaughtExceptionHandler*)handler;
/**
 *  上一次打开App是否奔溃
 *
 *  @return
 */
+(BOOL)isCrashOfTheLastOpenApp;
/**
 *  提交崩溃日志到服务器
 *
 *  @param url      服务器地址
 *  @param complete 完成的操作
 *  @param failure  失败的操作
 */
+(void)uploadTheLogToServer:(NSURL*)url
                   complete:(void (^)(NSURLResponse* response,NSData* data))complete
                    failure:(void (^)(NSError* error))failure
;


@end
