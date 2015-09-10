//
//  OldClassTableView.h
//  eduadmin
//
//  Created by Li Jie on 4/22/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekViewLable.h"

@interface OldClassTableView : UIView

@property (weak, nonatomic) IBOutlet UIView *bigView;

@property (weak, nonatomic) IBOutlet UIScrollView *schScrollView;

@property (weak, nonatomic) IBOutlet WeekViewLable *s1_1;
@property (weak, nonatomic) IBOutlet WeekViewLable *s1_2;
@property (weak, nonatomic) IBOutlet WeekViewLable *s1_3;
@property (weak, nonatomic) IBOutlet WeekViewLable *s1_4;
@property (weak, nonatomic) IBOutlet WeekViewLable *s1_5;

@property (weak, nonatomic) IBOutlet WeekViewLable *s2_1;
@property (weak, nonatomic) IBOutlet WeekViewLable *s2_2;
@property (weak, nonatomic) IBOutlet WeekViewLable *s2_3;
@property (weak, nonatomic) IBOutlet WeekViewLable *s2_4;
@property (weak, nonatomic) IBOutlet WeekViewLable *s2_5;

@property (weak, nonatomic) IBOutlet WeekViewLable *s3_1;
@property (weak, nonatomic) IBOutlet WeekViewLable *s3_2;
@property (weak, nonatomic) IBOutlet WeekViewLable *s3_3;
@property (weak, nonatomic) IBOutlet WeekViewLable *s3_4;
@property (weak, nonatomic) IBOutlet WeekViewLable *s3_5;

@property (weak, nonatomic) IBOutlet WeekViewLable *s4_1;
@property (weak, nonatomic) IBOutlet WeekViewLable *s4_2;
@property (weak, nonatomic) IBOutlet WeekViewLable *s4_3;
@property (weak, nonatomic) IBOutlet WeekViewLable *s4_4;
@property (weak, nonatomic) IBOutlet WeekViewLable *s4_5;

@property (weak, nonatomic) IBOutlet WeekViewLable *s5_1;
@property (weak, nonatomic) IBOutlet WeekViewLable *s5_2;
@property (weak, nonatomic) IBOutlet WeekViewLable *s5_3;
@property (weak, nonatomic) IBOutlet WeekViewLable *s5_4;
@property (weak, nonatomic) IBOutlet WeekViewLable *s5_5;

@property (weak, nonatomic) IBOutlet WeekViewLable *s6_1;
@property (weak, nonatomic) IBOutlet WeekViewLable *s6_2;
@property (weak, nonatomic) IBOutlet WeekViewLable *s6_3;
@property (weak, nonatomic) IBOutlet WeekViewLable *s6_4;
@property (weak, nonatomic) IBOutlet WeekViewLable *s6_5;

@property (weak, nonatomic) IBOutlet WeekViewLable *s7_1;
@property (weak, nonatomic) IBOutlet WeekViewLable *s7_2;
@property (weak, nonatomic) IBOutlet WeekViewLable *s7_3;
@property (weak, nonatomic) IBOutlet WeekViewLable *s7_4;
@property (weak, nonatomic) IBOutlet WeekViewLable *s7_5;

@property (strong, nonatomic) NSDictionary *dict;

+ (instancetype)newOldClassTable;

@end
