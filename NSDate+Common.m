//
//  NSDate+Common.m
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "NSDate+Common.h"
@implementation NSDate (Common)
+(NSInteger)getFullYear:(NSDate *)date
{
    NSDateComponents* dc = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:date];
    return dc.year;
}

+(NSInteger)getMonth:(NSDate *)date
{
    NSDateComponents* dc = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:date];
    return dc.month;
}
+(NSInteger)getDayOfMonth:(NSDate *)date
{
    NSDateComponents* dc = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:date];
    return dc.day;
}
@end
