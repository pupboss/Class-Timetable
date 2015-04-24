//
//  LJDeviceTool.h
//
//  Created by 李杰 on 14/9/22.
//  Copyright (c) 2014年 PUPBOSS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIViewController;

@interface LJDeviceTool : NSObject

//获得设备型号
+ (NSString *)getCurrentDeviceModel;

//获得系统版本
+ (NSString *)getCurrentSystemVersion;

//获得软件版本
+ (NSString *)getCurrentAppVersion;

//获得build版本
+ (NSString *)getCurrentAppBuild;

@end
