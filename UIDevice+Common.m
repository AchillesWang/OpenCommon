//
//  UIDevice+Common.m
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "UIDevice+Common.h"
#import "sys/utsname.h"

@implementation UIDevice (Common)
-(BOOL)isPhone5
{
    struct utsname sysinfo;
    uname(&sysinfo);
    NSLog(@"%s",sysinfo.machine);
    if (sysinfo.machine) {
//        NSLog()
    }
//    free(&sysinfo);
    return YES;
}
@end
