//
//  InterfaceController.m
//  class-timetable WatchKit Extension
//
//  Created by Li Jie on 4/25/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [WKInterfaceController openParentApplication:@{@"action": @"getClassTable"} reply:^(NSDictionary *replyInfo, NSError *error) {
        
        if (error) {
            [self.courseLable setText:@"error"];
            
        } else {
            
            [self.courseLable setText:replyInfo[@"course"]];
        }
        
    }];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



