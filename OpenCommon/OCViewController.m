//
//  OCViewController.m
//  OpenCommon
//
//  Created by HuXin on 14-4-2.
//  Copyright (c) 2014年 NestTime. All rights reserved.
//

#import "OCViewController.h"
#import "CMDevice.h"
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
    NSLog(@"MAC:%@",[CMDevice macAddress]);
    NSLog(@"Ver:%d",[CMDevice deviceSystemVersion]);
    NSLog(@"我爱你:%@",getPinYin(@"我爱你"));
    NSLog(@"我爱你:%@",[CMPinYin firstLatter:@"我爱你"]);
    NSLog(@"我爱你:%@",[CMPinYin pinYin:@"我爱你"]);
    NSLog(@"OpenUDID:%@",[CMOpenUDID value]);
    [[UIDevice currentDevice] isPhone5];
    NSLog(@"%ld",(long)[NSDate getDayOfMonth:[NSDate date]]);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
