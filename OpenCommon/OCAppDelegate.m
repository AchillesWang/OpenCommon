//
//  OCAppDelegate.m
//  OpenCommon
//
//  Created by HuXin on 14-4-2.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//
//哈哈哈~~~

#import "OCAppDelegate.h"
#import "CMDebugLog.h"
#import "CMUnExHandler.h"

@implementation OCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    NSLog(@"%@",NSHomeDirectory());
//    [CMUncaughtExceptionHandler setDefaultHandler];
//    NSArray *array = [NSArray arrayWithObject:@"there is only one objective in this arary,call index one, app will crash and throw an exception!"];
////    NSLog(@"%@", [array objectAtIndex:2]);
////    NSLog(@"%@", [array objectAtIndex:1]);
//    
//    [CMUncaughtExceptionHandler uploadTheLogToServer:nil
//                                            complete:^(NSURLResponse *response, NSData *data) {
//                                                 NSLog(@"呵呵,%@,%@",response,data);
//                                            }
//                                             failure:^(NSError *error) {
//                                                 NSLog(@"不要,%@",error);
//                                             }];
//    NSError* error = nil;
//    NSString* str = [NSString stringWithContentsOfFile:exceptionFilePaths() encoding:NSUTF8StringEncoding error:&error];
//    if (error) {
//        NSLog(@"%@,%@",error,[error userInfo]);
//        NSString* string =[NSString stringWithFormat:@"%@\n%@\n%@",[error localizedDescription],[error localizedFailureReason],[error localizedRecoverySuggestion]];
//        CMDebugLogWriteError(error);
//    }
    return YES;
}
							
NSString *exceptionFilePaths() {
#if 0
    NSLog(@"%@",[[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:FILE_NAME]);
#endif
    return [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"123.text"];
}

@end
