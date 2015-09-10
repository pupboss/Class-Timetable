//
//  AppDelegate.m
//  class-timetable
//
//  Created by Li Jie on 4/24/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#import "AppDelegate.h"
@import WatchKit;
#import "LJTools.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply {
    
    NSInteger day = [LJTimeTool getCurrentWeekDay] - 1;
    if (day == 0) {
        day =7;
    }
    
    NSInteger classNum = [LJTimeTool getCurrentClass];
    
    if (classNum == 6) {
        reply(@{@"course": @"洗洗睡吧~"});
    }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"courses.plist" ofType:nil];;
    
    NSString *key = [NSString stringWithFormat:@"%d-%d", (int)day, (int)classNum];
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    if ([mgr fileExistsAtPath:filePath]) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        NSDictionary *courses = dict[@"courses"];
        
        if (![courses[key] isEqualToString:@""]) {
            NSArray *tempArr = [courses[key] componentsSeparatedByString:@"\n"];
            NSString *course = [NSString stringWithFormat:@"%@\n%@", tempArr[0], tempArr[3]];
            reply(@{@"course": course});
        } else {
            reply(@{@"course": @"下节没课~"});
        }
        
    } else {
        reply(@{@"course": @"error"});
    }
}

@end
