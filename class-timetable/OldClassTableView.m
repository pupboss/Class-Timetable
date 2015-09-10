//
//  OldClassTableView.m
//  eduadmin
//
//  Created by Li Jie on 4/22/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#import "OldClassTableView.h"
#import "MJRefresh.h"
#import "LJTools.h"
#import "Common.h"
#import "MBProgressHUD+LJ.h"

@implementation OldClassTableView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //内容尺寸
    self.schScrollView.contentSize = CGSizeMake(444,672);
    
    //隐藏滚动条
    self.schScrollView.showsHorizontalScrollIndicator = YES;
    
    for (UILabel *lable in self.bigView.subviews) {
        lable.numberOfLines = 0;
    }
    
}

- (void)awakeFromNib {
    
    // 下拉刷新
    [self.schScrollView addHeaderWithTarget:self action:@selector(refreshData) dateKey:@"table"];
    
}

- (void)refreshData
{
    [MBProgressHUD showMessage:@"正在获取中"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"刷新成功"];
        [self.schScrollView headerEndRefreshing];
    });
}


- (void)setDict:(NSDictionary *)dict {
    
    NSDictionary *courses = dict[@"courses"];
    
    self.s1_1.text = courses[@"1-1"];
    
    self.s1_2.text = courses[@"1-2"];
    
    self.s1_3.text = courses[@"1-3"];
    
    self.s1_4.text = courses[@"1-4"];
    
    self.s1_5.text = courses[@"1-5"];
    
    
    self.s2_1.text = courses[@"2-1"];
    
    self.s2_2.text = courses[@"2-2"];
    
    self.s2_3.text = courses[@"2-3"];
    
    self.s2_4.text = courses[@"2-4"];
    
    self.s2_5.text = courses[@"2-5"];
    
    
    self.s3_1.text = courses[@"3-1"];
    
    self.s3_2.text = courses[@"3-2"];
    
    self.s3_3.text = courses[@"3-3"];
    
    self.s3_4.text = courses[@"3-4"];
    
    self.s3_5.text = courses[@"3-5"];
    
    
    self.s4_1.text = courses[@"4-1"];
    
    self.s4_2.text = courses[@"4-2"];
    
    self.s4_3.text = courses[@"4-3"];
    
    self.s4_4.text = courses[@"4-4"];
    
    self.s4_5.text = courses[@"4-5"];
    
    
    self.s5_1.text = courses[@"5-1"];
    
    self.s5_2.text = courses[@"5-2"];
    
    self.s5_3.text = courses[@"5-3"];
    
    self.s5_4.text = courses[@"5-4"];
    
    self.s5_5.text = courses[@"5-5"];
    
    
    self.s6_1.text = courses[@"6-1"];
    
    self.s6_2.text = courses[@"6-2"];
    
    self.s6_3.text = courses[@"6-3"];
    
    self.s6_4.text = courses[@"6-4"];
    
    self.s6_5.text = courses[@"6-5"];
    
    
    self.s7_1.text = courses[@"7-1"];
    
    self.s7_2.text = courses[@"7-2"];
    
    self.s7_3.text = courses[@"7-3"];
    
    self.s7_4.text = courses[@"7-4"];
    
    self.s7_5.text = courses[@"7-5"];
}

+ (instancetype)newOldClassTable {
    
    return [[NSBundle mainBundle] loadNibNamed:@"OldClassTable" owner:nil options:nil][0];
}

@end
