//
//  OldClassTableView.h
//  eduadmin
//
//  Created by JieLee on 4/22/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldClassTableView : UIView

@property (weak, nonatomic) IBOutlet UIView *bigView;

@property (weak, nonatomic) IBOutlet UIScrollView *schScrollView;

@property (weak, nonatomic) IBOutlet UILabel *s1_1;
@property (weak, nonatomic) IBOutlet UILabel *s1_2;
@property (weak, nonatomic) IBOutlet UILabel *s1_3;
@property (weak, nonatomic) IBOutlet UILabel *s1_4;
@property (weak, nonatomic) IBOutlet UILabel *s1_5;

@property (weak, nonatomic) IBOutlet UILabel *s2_1;
@property (weak, nonatomic) IBOutlet UILabel *s2_2;
@property (weak, nonatomic) IBOutlet UILabel *s2_3;
@property (weak, nonatomic) IBOutlet UILabel *s2_4;
@property (weak, nonatomic) IBOutlet UILabel *s2_5;

@property (weak, nonatomic) IBOutlet UILabel *s3_1;
@property (weak, nonatomic) IBOutlet UILabel *s3_2;
@property (weak, nonatomic) IBOutlet UILabel *s3_3;
@property (weak, nonatomic) IBOutlet UILabel *s3_4;
@property (weak, nonatomic) IBOutlet UILabel *s3_5;

@property (weak, nonatomic) IBOutlet UILabel *s4_1;
@property (weak, nonatomic) IBOutlet UILabel *s4_2;
@property (weak, nonatomic) IBOutlet UILabel *s4_3;
@property (weak, nonatomic) IBOutlet UILabel *s4_4;
@property (weak, nonatomic) IBOutlet UILabel *s4_5;

@property (weak, nonatomic) IBOutlet UILabel *s5_1;
@property (weak, nonatomic) IBOutlet UILabel *s5_2;
@property (weak, nonatomic) IBOutlet UILabel *s5_3;
@property (weak, nonatomic) IBOutlet UILabel *s5_4;
@property (weak, nonatomic) IBOutlet UILabel *s5_5;

@property (weak, nonatomic) IBOutlet UILabel *s6_1;
@property (weak, nonatomic) IBOutlet UILabel *s6_2;
@property (weak, nonatomic) IBOutlet UILabel *s6_3;
@property (weak, nonatomic) IBOutlet UILabel *s6_4;
@property (weak, nonatomic) IBOutlet UILabel *s6_5;

@property (weak, nonatomic) IBOutlet UILabel *s7_1;
@property (weak, nonatomic) IBOutlet UILabel *s7_2;
@property (weak, nonatomic) IBOutlet UILabel *s7_3;
@property (weak, nonatomic) IBOutlet UILabel *s7_4;
@property (weak, nonatomic) IBOutlet UILabel *s7_5;

@property (strong, nonatomic) NSDictionary *dict;

+ (instancetype)newOldClassTable;

@end
