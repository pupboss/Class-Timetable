//
//  MBProgressHUD+LJ.h
//  lntuApp
//
//  Created by 李杰 on 15-01-05.
//  Copyright (c) 2015年 PUPBOSS. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (LJ)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
