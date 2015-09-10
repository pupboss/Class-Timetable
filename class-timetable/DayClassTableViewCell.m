//
//  DayClassTableViewCell.m
//  eduadmin
//
//  Created by Li Jie on 4/18/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#import "DayClassTableViewCell.h"

@implementation DayClassTableViewCell

- (void)awakeFromNib {
    
    self.class1.numberOfLines = 0;
    self.class0.numberOfLines = 0;
}

- (void)setCourse0:(NSString *)course0 {
    
    _course0 = course0;
    self.class0.text = course0;
}

- (void)setCourse1:(NSString *)course1 {
    
    _course1 = course1;
    self.class1.text = course1;
}

- (void)setCourse:(DayCourse *)course {
    
    _course = course;
    
    self.timeInterval.text = @"下午";
    self.time0.text = @"第4节 14:00-14:45";
    self.time1.text = @"第5节 14:50-15:35";
    self.time2.text = @"第6节 15:55-16:40";
    self.time3.text = @"第7节 16:45-17:30";
    
    self.class0.text = course.class0;
    self.class1.text = course.class1;
    
}

+ (instancetype)newDayClassCell {
    
    return [[NSBundle mainBundle] loadNibNamed:@"DayClassTableViewCell" owner:nil options:nil][0];
}

@end
