//
//  NdUncaughtExceptionHandler.m
//  OpenCommon
//
//  Created by 汪潇翔 on 14-4-15.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "CMUncaughtExceptionHandler.h"


#define FILE_NAME @"Application_Exception.txt"

#define kIS_CRASH_OF_THE_LAST_OPEN @"kIsCarshOfTheLastOpen"

#define CMUncaughtExceptionFilePath exceptionFilePath()

/**
 *  返回异常文件的地址
 *
 *  @return 异常文件的地址
 */
NSString* exceptionFilePath() {
#if 0
    NSLog(@"%@",[[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:FILE_NAME]);
#endif
    return [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:FILE_NAME];
}

/**
 *  写入到日志文件中
 *
 *  @param path    路径
 *  @param content 内容
 */
void writeData(NSString* path,NSString* content)
{
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        NSLog(@"create file");
        [fileManager createFileAtPath:path
                             contents:nil
                           attributes:nil];
    }
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];
    NSUserDefaults* uDef =  [NSUserDefaults standardUserDefaults];
    [uDef setObject:@(YES) forKey:kIS_CRASH_OF_THE_LAST_OPEN];
    [uDef synchronize];
}
/**
 *  获取异常日志
 *
 *  @return 异常日志的二进制文件
 */
NSData* exceptionFile(void)
{
    NSError* error = nil;
    NSData* data = [NSData dataWithContentsOfFile:CMUncaughtExceptionFilePath
                                          options:NSDataReadingMappedIfSafe
                                            error:&error];
    if (error) {
        NSLog(@"读取异常日志出错:%@,%@",error,[error userInfo]);
        return nil;
    }
    return data;
}
/**
 * 异常处理
 *
 *  @param exception 异常
 */
void uncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    
    NSString *content = [NSString stringWithFormat:@"=============异常崩溃报告=====%@=============\nname:\n%@\nreason:\n%@\ncallStackSymbols:\n%@\n\n\n",[NSDate date],
                         name,reason,[arr componentsJoinedByString:@"\n"]];
    
    writeData(CMUncaughtExceptionFilePath, content);
    //除了可以选择写到应用下的某个文件，通过后续处理将信息发送到服务器等
    //还可以选择调用发送邮件的的程序，发送信息到指定的邮件地址
    //或者调用某个处理程序来处理这个信息
}

@implementation CMUncaughtExceptionHandler


+ (void)setDefaultHandler
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSSetUncaughtExceptionHandler (&uncaughtExceptionHandler);
    });
    
}

+ (NSUncaughtExceptionHandler*)handler
{
    return NSGetUncaughtExceptionHandler();
}

+(BOOL)isCrashOfTheLastOpenApp
{
    NSUserDefaults* uDef =  [NSUserDefaults standardUserDefaults];
    return [uDef objectForKey:kIS_CRASH_OF_THE_LAST_OPEN ];
}
+(void)uploadTheLogToServer:(NSURL *)url
                   complete:(void (^)(NSURLResponse *, NSData *))complete
                    failure:(void (^)(NSError *))failure
{
    //block copy
    void (^completeCopy)(NSURLResponse *res, NSData *data) = [complete copy];
    void (^failureCopy)(NSError* error) = [failure copy];

    NSMutableURLRequest* mrequest = [[NSMutableURLRequest alloc]initWithURL:url
                                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                            timeoutInterval:60.0f];
    NSData* data = exceptionFile();
    if (data&&mrequest) {
        //上传日志文件到服务器
        //1、请求
        [mrequest setHTTPMethod:@"POST"];
        [mrequest setHTTPBody:data];
        [mrequest setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
        [mrequest setValue:[NSString stringWithFormat:@"%lu",[data length]] forHTTPHeaderField:@"Content-Length"];
        //2、链接
        [NSURLConnection sendAsynchronousRequest:mrequest
                                           queue:nil
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                                   if (connectionError) {
                                       failureCopy(connectionError);
                                    }else{
                                        completeCopy(response,data);
                                   }
                               }
        ];
    }
}
@end
