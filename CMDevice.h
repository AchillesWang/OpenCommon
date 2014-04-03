//
//  CMDevice.h
//  CMenCommon
//
//  Created by HuXin on 14-4-2.
//  CCMyright (c) 2014年 NestTime. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CMSystemVersion_iOS_7 = 7,
    CMSystemVersion_iOS_5 = 5,
    CMSystemVersion_iOS_6 = 6,
    CMSystemVersion_iOS_5_BEFORE = 0,
    CMSystemVersion_OTHER = -1
}CMSystemVersion;

typedef CMSystemVersion SystemVersion;

@interface CMDevice : NSObject
/**
 *	@brief	取得网卡的物理地址
 *
 *	@return	网卡物理地址
 */
+ (NSString *)macAddress;
/**
 *	@brief	取得系统版本
 *
 *	@return	系统版本
 */
+(SystemVersion)deviceSystemVersion;

@end
