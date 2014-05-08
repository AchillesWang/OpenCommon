//
//  NdUncaughtExceptionHandler.h
//  OpenCommon

//  用于处理应用程序奔溃时的Bug记录

//  [CMUncaughtExceptionHandler setDefaultHandler];
//  Created by 汪潇翔 on 14-4-15.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CMUnExHandler : NSObject
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
 *  更新奔溃的键值，设置为NO
 */
+(void)updateCrashFlag;
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
