//
//  UIDevice+Common.h
//  OpenCommon
//
//  Created by WangXiaoXiang on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief 设备分辨率
 */
typedef enum {
    // iPhone 1,3,3GS 标准分辨率(320x480px)
    UIDevice_iPhoneStandardRes      = 1,
    // iPhone 4,4S 高清分辨率(640x960px)
    UIDevice_iPhoneHiRes            = 2,
    // iPhone 5,5S 高清分辨率(640x1136px)
    UIDevice_iPhoneTallerHiRes      = 3,
    // iPad 1,2,iPadMini 标准分辨率(1024x768px)
    UIDevice_iPadStandardRes        = 4,
    // iPad 3,4,Air,iPadMini2 High Resolution(2048x1536px)
    UIDevice_iPadHiRes              = 5
}UIDeviceResolution;

/**
 *	@brief	网络类型
 */
typedef enum
{
	CMNetworkTypeNone = 0, /**< 无网络 */
    CMNetworkTypeWifi, /**< wifi */
	CMNetworkTypeCellular, /**< 蜂窝网络 */
    
}CMNetworkType;



/**
 *  系统版本
 */
typedef enum {
    CMSystemVersion_iOS_7 = 7,
    CMSystemVersion_iOS_5 = 5,
    CMSystemVersion_iOS_6 = 6,
    CMSystemVersion_iOS_5_BEFORE = 0,
    CMSystemVersion_OTHER = -1
}CMSystemVersion;

typedef CMSystemVersion CMSystemVersion;



//typedef enum{
//    CMDeviceMachine_Other,
//    CMDeviceMachine_iPhone5,
//    CMDeviceMachine_iPhone4,
//    CMDeviceMachine_iPhone3G,
//    CMDeviceMachine_iPad1,
//    CMDeviceMachine_iPad2,
//    CMDeviceMachine_iPad3,
//    CMDeviceMachine_iPad4,
//    CMDeviceMachine_iPadAir,
//    CMDeviceMachine_iPadMini,
//    CMDeviceMachine_iPadMini2,
//}CMDeviceMachine;

/**
 *	@brief	设备类目
 */

@interface UIDevice (Common)

/**
 *	@brief	判断是否为iPhone5
 *
 *	@return	YES：是，NO：否
 */
+ (BOOL)isPhone5;

/**
 *	@brief	获取系统越狱标识
 *
 *	@return	YES表示已经越狱，否则没有越狱。
 */
+ (BOOL)isJailBroken;

/**
 *	@brief	取得网卡的物理地址
 *
 *	@return	网卡物理地址
 */
+ (NSString *)macAddress;

/**
 *	@brief	获取设备型号
 *
 *	@return	设备型号：设备型号对照如下：
 *  iPhone1,1  ->   iPhone (Original/EDGE)
 *  iPhone1,2  ->   iPhone 3G
 *  iPhone1,2* ->   iPhone 3G (China/No Wi-Fi)
 *  iPhone2,1  ->   iPhone 3GS
 *  iPhone2,1* ->   iPhone 3GS (China/No Wi-Fi)
 *  iPhone3,1  ->   iPhone 4 (GSM)
 *  iPhone3,3  ->   iPhone 4 (CDMA/Verizon/Sprint)
 *  iPhone4,1  ->   iPhone 4S
 *  iPhone4,1* ->   iPhone 4S (GSM China/WAPI)
 *  iPhone5,1  ->   iPhone 5 (GSM/LTE 4, 17/North America), iPhone 5 (GSM/LTE 1, 3, 5/International), iPhone 5 (GSM/LTE/AWS/North America)
 *  iPhone5,2  ->   iPhone 5 (CDMA/LTE, Sprint/Verizon/KDDI)
 *  iPhone5,2* ->   iPhone 5 (CDMA China/UIM/WAPI)
 *
 *  iPod1,1   -> iPod touch (Original)
 *  iPod2,1   -> iPod touch (2nd Gen)
 *  iPod2,2   -> iPod touch 2.5G
 *  iPod3,1   -> iPod touch (3rd Gen/8 GB), iPod touch (3rd Gen/32 & 64 GB)
 *  iPod4,1   -> iPod touch (4th Gen/FaceTime), iPod touch (4th Gen, 2011), iPod touch (4th Gen, 2012)
 *  iPod5,1   -> iPod touch (5th Gen)
 *
 *  iPad1,1   -> iPad Wi-Fi (Original), iPad Wi-Fi/3G/GPS (Original)
 *  iPad2,1   -> iPad 2 (Wi-Fi Only)
 *  iPad2,2   -> iPad 2 (Wi-Fi/GSM/GPS)
 *  iPad2,3   -> iPad 2 (Wi-Fi/CDMA/GPS)
 *  iPad2,4   -> iPad 2 (Wi-Fi Only, iPad2,4)
 *  iPad3,1   -> iPad 3rd Gen (Wi-Fi Only)
 *  iPad3,3   -> iPad 3rd Gen (Wi-Fi/Cellular AT&T/GPS)
 *  iPad3,2   -> iPad 3rd Gen (Wi-Fi/Cellular Verizon/GPS)
 *  iPad3,4   -> iPad 4th Gen (Wi-Fi Only)
 *  iPad3,5   -> iPad 4th Gen (Wi-Fi/AT&T/GPS)
 *  iPad3,6   -> iPad 4th Gen (Wi-Fi/Verizon & Sprint/GPS)
 *  iPad2,5   -> iPad mini (Wi-Fi Only)
 *  iPad2,6   -> iPad mini (Wi-Fi/AT&T/GPS)
 *  iPad2,7   -> iPad mini (Wi-Fi/Verizon & Sprint/GPS)
 */
- (NSString *)deviceModel;

/**
 *	@brief	获取当前网络类型
 *
 *	@return	网络类型
 */
- (CMNetworkType)currentNetworkType;

/**
 *	@brief	获取wifi的使能状态
 *
 *	@return	YES wifi可用，NO wifi不可用
 */
- (BOOL)isEnableWIFI;

/**
 *	@brief	获取3G的使能状态
 *
 *	@return	YES 3G可用，NO 3G不可用
 */
- (BOOL)isEnable3G;

/**
 *	@brief	判断是否为iPad设备
 *
 *	@return	YES：是，NO：否
 */
- (BOOL)isPad;

/**
 *	@brief	获取运行进程
 *
 *	@return	运行进程
 */
- (NSArray *)runningProcesses;
/**
 *  设备分辨率
 *
 *  @return 设备分辨率
 */
+ (UIDeviceResolution) currentResolution;
/**
 *  返回当前系统的版本
 *
 *  @return 当前系统的版本
 */
+(CMSystemVersion)deviceSystemVersion;
@end
