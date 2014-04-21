//
//  OPDebugLog.m
//  OpenCommon
//
//  Created by HuXin on 14-4-2.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "CMDebugLog.h"
//文件名称
#define CMMLogFileName @"CMDebugLog.text"
#define CMDebugLoadEndContent  endContent()
//文件路径
#define CMDebugFilePath debugFilePath()
//Dictionary
#define CMDebugDictionaryHeader @"===============================Dictionary==============================="
#define CMDebugDictionaryEnd    CMDebugLoadEndContent
//Error
#define CMDebugErrorHeader @"===============================Error==============================="
#define CMDebugErrorEnd    CMDebugLoadEndContent
//Info
#define CMDebugInfoHeader @"===============================Info==============================="
#define CMDebugInfoEnd    CMDebugLoadEndContent
//Warning
#define CMDebugWarningHeader @"===============================Warning==============================="
#define CMDebugWarningEnd    CMDebugLoadEndContent
//内容拼接
#define CMDebugInsetContent(head,end,content) insertContentString((head),(end),(content))
//写入内容
#define CMDebugWriteStringToFile(content) writeStringToFile((content))

#pragma mark - Supporting function

/**
 *  Debug文件路径
 *
 *  @return 文件路径
 */
NSString *debugFilePath() {
#if 0
    NSLog(@"%@",[[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:CMMLogFileName]);
#endif
    return [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:CMMLogFileName];
}
/**
 *  写入文件
 *
 *  @param content 内容
 */
void writeStringToFile(NSString*  content){
    dispatch_queue_t queueFile = dispatch_queue_create("writeFile", NULL);
    dispatch_async(queueFile, ^{
        //判断文件是否存在，不存在着创建
        NSFileManager* fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:CMDebugFilePath]) {
            [fileManager createFileAtPath:CMDebugFilePath
                                 contents:nil
                               attributes:nil];
        }
        NSFileHandle* fileHandle = [NSFileHandle fileHandleForWritingAtPath:CMDebugFilePath];
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle closeFile];
    });
}
/**
 *  结束的标记
 *
 *  @return 结束的标记
 */
NSString* endContent()
{
    return [NSString stringWithFormat:@"\n------------%@\n\n",[[NSDate date] descriptionWithLocale:[NSLocale systemLocale]]];
}
/**
 *  插入内容的字符串
 *
 *  @param content 内容
 *
 *  @return 拼接后的字符串
 */
NSString* insertContentString(NSString* headStr,NSString* endStr,NSString *content){
    return [NSString stringWithFormat:@"%@\n\n%@%@",headStr,content,endStr];
}


#pragma mark - CMDebugLog implementation

@implementation CMDebugLog


//MARK:文件路径
+(NSString *)logPath
{
    return CMDebugFilePath;
}
//MARK:写入字典
+(void)writeContentWithDictionary:(NSDictionary *)content
{
    CMDebugWriteStringToFile(CMDebugInsetContent(CMDebugDictionaryHeader, CMDebugDictionaryEnd, [content descriptionInStringsFileFormat]));
}
//MARK:写入错误
+(void)writeError:(NSError *)error
{
    CMDebugWriteStringToFile(CMDebugInsetContent(CMDebugErrorHeader, CMDebugErrorEnd, [[error userInfo] descriptionInStringsFileFormat]));
}
//MARK:写入信息
+(void)writeInfo:(NSString *)content
{
    CMDebugWriteStringToFile(CMDebugInsetContent(CMDebugInfoHeader, CMDebugInfoEnd, content));
}
//MARK:写入警告
+(void)writeWarning:(NSString *)content
{
    CMDebugWriteStringToFile(CMDebugInsetContent(CMDebugWarningHeader, CMDebugWarningEnd, content));
}
//MARK:写入错误字符串
+(void)writeErrorString:(NSString *)content
{
    CMDebugWriteStringToFile(CMDebugInsetContent(CMDebugErrorHeader, CMDebugErrorEnd, content));
}
@end
