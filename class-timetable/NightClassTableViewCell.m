//
//  NightClassTableViewCell.m
//  eduadmin
//
//  Created by Li Jie on 4/18/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#import "NightClassTableViewCell.h"

@implementation NightClassTableViewCell

- (void)awakeFromNib {

    self.courseLable.numberOfLines = 0;
}

- (void)setCourse:(NSString *)course {
    
    _course = course;
    self.courseLable.text = course;
}

+ (instancetype)newNightClassCell {

    return [[NSBundle mainBundle] loadNibNamed:@"NightClassTableViewCell" owner:nil options:nil][0];
}

@end
