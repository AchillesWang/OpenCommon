//
//  OCViewController.m
//  OpenCommon
//
//  Created by HuXin on 14-4-2.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "OCViewController.h"
#import "CMOpenUDID.h"
#import "CMPinYin.h"
#import "UIDevice+Common.h"
#import "NSDate+Common.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"MAC:%@",[CMDevice macAddress]);
//    NSLog(@"Ver:%d",[CMDevice deviceSystemVersion]);
//    NSLog(@"我爱你:%@",getPinYin(@"我爱你"));
//    NSLog(@"我爱你:%@",[CMPinYin firstLatter:@"我爱你"]);
//    NSLog(@"我爱你:%@",[CMPinYin pinYin:@"我爱你"]);
//    NSLog(@"OpenUDID:%@",[CMOpenUDID value]);
//    NSLog(@"%ld",(long)[NSDate getDayOfMonth:[NSDate date]]);
    [self testDateCommon];
    
    [self testDevice];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)testDevice
{
    NSLog(@"%d",[[UIDevice currentDevice] isEnableWIFI]);
    NSLog(@"%d",[[UIDevice currentDevice] isEnable3G]);
    NSLog(@"%@",[[UIDevice currentDevice] deviceModel]);
    NSLog(@"%@",[[UIDevice currentDevice] runningProcesses]);
}
-(void)testDateCommon
{
//    NSDate* date = [NSDate date];
//    NSLog(@"%d",(int)[NSDate getFullYear:date]);
//    NSLog(@"%d",(int)[NSDate getMonth:date]);
//    NSLog(@"%d",(int)[NSDate getDayOfMonth:date]);
//    NSLog(@"%d",(int)[NSDate getHour:date]);
//    NSLog(@"%d",(int)[NSDate getMinute:date]);
//    NSLog(@"%d",(int)[NSDate getSecond:date]);
    
//    NSLog(@"%@",[NSDate stringByStringFormat:@"yyyy-MM-dd HH:mm:ss" data:date]);
//    NSLog(@"%@",[NSDate dateByStringFormat:@"yyyy-MM-dd HH:mm:ss" dateString:@"2013-11-11 10:10:10"]);
//    NSLog(@"%@",[date descriptionWithLocale:[NSLocale currentLocale]]);
//    NSLog(@"%@",[[NSLocale currentLocale] localeIdentifier]);
//    NSLog(@"%@",[[NSDate dateByStringFormat:@"yyyy-MM-dd HH:mm:ss" dateString:@"2013-11-11 10:10:10" locale:[NSLocale localeWithLocaleIdentifier:@"en_US"]] descriptionWithLocale:[NSLocale currentLocale]]);
    
//    NSLog(@"%@",[[NSLocale currentLocale] localeIdentifier]);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
