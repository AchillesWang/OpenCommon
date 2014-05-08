//
//  NSDate+Common.m
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "NSDate+Common.h"


#define TEST_CMDateCode 1

#define CMGetNumberWithDate(date,unit)  getNumberWithDate((date),(unit))

#define CMGetDataWithComponents(year,month,day,hour,minute,second) getDateByComponents((year),(month),(day),(hour),(minute),(second))

#define CMGetData(stringFormat,dateString,locale) getDate((stringFormat),(dateString),(locale));
/**
 *  根据需求返回对应的数值（2013-11-11 10:10:10）,需要年的数值（unit = NSCalendarUnitYear）
 *
 *  @param date 对应日期
 *  @param unit 数值类型（年，月，日）
 *
 *  @return 对应数值
 */
NSInteger getNumberWithDate(NSDate* date,NSCalendarUnit unit)
{
    //日期组件
    static NSDateComponents* dc = nil;
    dc = [[NSCalendar currentCalendar] components:unit fromDate:date];
    switch (unit) {
        case NSCalendarUnitYear:
            return dc.year;
        case NSCalendarUnitMonth:
            return dc.month;
        case NSCalendarUnitDay:
            return dc.day;
        case NSCalendarUnitMinute:
            return dc.minute;
        case NSCalendarUnitSecond:
            return dc.second;
        case NSCalendarUnitWeekday:
            return dc.weekday;
        case NSCalendarUnitWeekdayOrdinal:
            return dc.weekdayOrdinal;
        case NSCalendarUnitQuarter:
            return dc.quarter;
        case NSCalendarUnitWeekOfMonth:
            return dc.weekOfMonth;
        case NSCalendarUnitWeekOfYear:
            return dc.weekOfYear;
        case NSCalendarUnitYearForWeekOfYear:
            return dc.yearForWeekOfYear;
        case NSCalendarUnitHour:
            return dc.hour;
        case NSCalendarUnitEra:
            return dc.era;
        default:
            return CMDateCommonNumberError;
    }
}
/**
 *  根据你输入的年、月、日、时、分、秒，返回NSDate
 *
 *  @param year   年
 *  @param month  月
 *  @param day    日
 *  @param hour   时
 *  @param minute 分
 *  @param second 秒
 *
 *  @return NSDate对象
 */
NSDate* getDateByComponents(NSInteger year,NSInteger month,NSInteger day,NSInteger hour,NSInteger minute, NSInteger second){
    NSDateComponents* dataCom = [[NSDateComponents alloc]init];
    [dataCom setYear:year];
    [dataCom setMonth:month];
    [dataCom setDay:day];
    [dataCom setHour:hour];
    [dataCom setMinute:minute];
    [dataCom setSecond:second];
    return  dataCom.date;
}
/**
 *  根据输入的参数，返回日期对象
 *
 *  @param stringFormat 格式化样式（yyyy-MM-dd hh:mm:ss）
 *  @param dateString   日期字符串 2013-11-11 10:10:10
 *  @param locale       本地化
 *
 *  @return 日期对象
 */
NSDate* getDate(NSString* stringFormat,NSString* dateString,NSLocale* locale)
{
    NSDateFormatter* dateFm = [NSDateFormatter new];
    [dateFm setDateFormat:stringFormat];
    [dateFm setLocale:locale];
#if TEST_CMDateCode
    NSLog(@"%@",dateFm.locale.localeIdentifier);
#endif
    //时区
//    [dataFm setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    return [dateFm dateFromString:dateString];
};

@implementation NSDate (Common)
+(NSInteger)getFullYear:(NSDate *)date
{
    return CMGetNumberWithDate(date, NSCalendarUnitYear);
}

+(NSInteger)getMonth:(NSDate *)date
{
    return CMGetNumberWithDate(date, NSCalendarUnitMonth);
}
+(NSInteger)getDayOfMonth:(NSDate *)date
{
    return CMGetNumberWithDate(date, NSCalendarUnitDay);
}
+(NSInteger)getHour:(NSDate *)date
{
    return CMGetNumberWithDate(date, NSCalendarUnitHour);
}
+(NSInteger)getMinute:(NSDate *)date
{
    return CMGetNumberWithDate(date, NSCalendarUnitMinute);
}
+(NSInteger)getSecond:(NSDate *)date
{
    return CMGetNumberWithDate(date, NSCalendarUnitSecond);
}
+(NSDate *)dateByYear:(NSInteger)year
                month:(NSInteger)month
                  day:(NSInteger)day
                 hour:(NSInteger)hour
               minute:(NSInteger)minute
               second:(NSInteger)second
{
    return CMGetDataWithComponents(year, month, day, hour, minute, second);
}
+(NSString *)stringByStringFormat:(NSString *)format data:(NSDate *)date
{
    NSDateFormatter* dateFm = [NSDateFormatter new];
    [dateFm setDateFormat:format];
#if TEST_CMDateCode
    NSLog(@"%@",dateFm.locale.localeIdentifier);
#endif
    return [dateFm stringFromDate:date];
}
+(NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString locale:(NSLocale *)locale
{
    return CMGetData(format, dateString, locale);
}
+(NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString
{
    return CMGetData(format, dateString, nil);
}


@end
