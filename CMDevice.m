//
//  CMDevice.m
//  CMenCommon
//
//  Created by HuXin on 14-4-2.
//  CCMyright (c) 2014年 NestTime. All rights reserved.
//

#import "CMDevice.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>


@implementation CMDevice
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
+(SystemVersion)deviceSystemVersion
{
//    UIDevice* device = [UIDevice currentDevice];
    CGFloat svf = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (svf >= 7.0) {
        return CMSystemVersion_iOS_7;
    }else if (svf >= 6.0) {
        return CMSystemVersion_iOS_6;
    }else if (svf >= 5.0){
        return CMSystemVersion_iOS_5;
    }else if(svf < 5.0){
        return CMSystemVersion_iOS_5_BEFORE;
    }
    return CMSystemVersion_OTHER;
}
@end
