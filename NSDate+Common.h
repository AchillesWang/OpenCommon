//
//  NSDate+Common.h
//  OpenCommon

//  在获取NSDate中的莫个组件时，如果获取失败返回CMDateCommonNumberError。

//  Created by WangXiaoXiang on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>




#define CMDateCommonNumberError -999

/**
 *  @brief NSDate类目
 */
@interface NSDate (Common)
/**
 *	@brief	获取NSDate的年份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	年份
 */
+ (NSInteger)getFullYear:(NSDate *)date;

/**
 *	@brief	获取NSDate的月份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	月份
 */
+ (NSInteger)getMonth:(NSDate *)date;

/**
 *	@brief	获取NSDate的日期部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	日期
 */
+ (NSInteger)getDayOfMonth:(NSDate *)date;

/**
 *	@brief	获取NSDate的小时部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	小时
 */
+ (NSInteger)getHour:(NSDate *)date;

/**
 *	@brief	获取NSDate的分钟部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	分钟
 */
+ (NSInteger)getMinute:(NSDate *)date;

/**
 *	@brief	获取NSDate的秒部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	秒
 */
+ (NSInteger)getSecond:(NSDate *)date;

/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *
 *	@return	日期对象
 */
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString;

/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *	@param 	locale 	语言环境
 *
 *	@return	日期对象
 */
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString locale:(NSLocale *)locale;

/**
 *	@brief	根据字符串格式转换日期为字符串
 *
 *	@param 	format 	日期格式字符串
 *	@param 	date 	日期对象
 *
 *	@return	日期字符串
 */
+ (NSString *)stringByStringFormat:(NSString *)format data:(NSDate *)date;

/**
 *	@brief	根据年月日返回日期
 *
 *	@param 	year 	年份
 *	@param 	month 	月份
 *	@param 	date 	日期
 *	@param 	hour 	小时
 *	@param 	minute 	分钟
 *	@param 	second 	秒
 *
 *	@return	日期对象
 */
+ (NSDate *)dateByYear:(NSInteger)year
                 month:(NSInteger)month
                  day:(NSInteger)day
                  hour:(NSInteger)hour
                minute:(NSInteger)minute
                second:(NSInteger)second;
@end
