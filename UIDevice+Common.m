//
//  UIDevice+Common.m
//  OpenCommon
//
//  Created by HuXin on 14-4-3.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "UIDevice+Common.h"
#import "sys/utsname.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>


@implementation UIDevice (Common)
+(UIDeviceResolution)currentResolution
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
            if (result.height <= 480.0f)
                return UIDevice_iPhoneStandardRes;
            return (result.height > 960 ? UIDevice_iPhoneTallerHiRes : UIDevice_iPhoneHiRes);
        } else
            return UIDevice_iPhoneStandardRes;
    } else
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? UIDevice_iPadHiRes : UIDevice_iPadStandardRes);
}

+(BOOL)isPhone5
{
    if ([self currentResolution] == UIDevice_iPhoneTallerHiRes) {
        return YES;
    }
    return NO;
}
+(BOOL)isJailBroken
{
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;  
    }  
    return jailbroken;
}
+(NSString *)macAddress
{
    int                 mib[6];
    
    size_t              len;
    
    char                *buf;
    
    unsigned char       *ptr;
    
    struct if_msghdr    *ifm;
    
    struct sockaddr_dl  *sdl;
    /*
     
     设置信息资源库
     
     */
    
    //请求网络子系统
    
    mib[0]=CTL_NET;
    
    //路由表信息
    
    mib[1]=AF_ROUTE;
    
    mib[2]=0;
    
    //链路层信息
    
    mib[3]=AF_LINK;
    
    //配置端口信息
    
    mib[4]=NET_RT_IFLIST;
    
    //判断En0地址是否存在，除联通3GS太监外，都存在
    
    if ((mib[5]=if_nametoindex("en0"))==0) {
        
        return NULL;
        
    }
    
    //获取数据的大小
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0)<0) {
        
        return NULL;
        
    }
    
    //分配内存的基础上调用
    
    if ((buf=malloc(len))==NULL) {
        
        return NULL;
        
    }
    
    //获取系统信息，存储在缓冲区
    
    if ((sysctl(mib, 6, buf, &len, NULL, 0))<0) {
        
        free(buf);
        
        return NULL;
        
    }
    
    //获取接口电气性结构
    
    ifm=(struct if_msghdr *)buf;
    
    sdl=(struct sockaddr_dl *)(ifm+1);
    
    ptr=(unsigned char *)LLADDR(sdl);
    
    free(ifm);
    
    //获取Mac地址信息：读取字符数组到一个字符串对象，设置为传统的Mac地址，即XX:XX:XX:XX:XX:XX
    
    NSString *outString=[NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                         
                         *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    //返回Mac地址信息
    
    return outString;
}

@end
