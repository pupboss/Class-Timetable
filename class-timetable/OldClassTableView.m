//
//  OldClassTableView.m
//  eduadmin
//
//  Created by JieLee on 4/22/15.
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
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if ([def objectForKey:USERNAMEKEY]) {
        
        NSString *uName = [def objectForKey:USERNAMEKEY];
        NSString *pwd = [def objectForKey:PWDKEY];
        
        NSDictionary *param = @{@"userId": uName,
                                @"pwd": pwd,
                                @"platform": @"ios",
                                @"version": [LJDeviceTool getCurrentAppBuild],
                                @"manufacturer": @"Apple",
                                @"osVer": [NSString stringWithFormat:@"iOS%@",[LJDeviceTool getCurrentSystemVersion]],
                                @"model": [LJDeviceTool getCurrentDeviceModel]};
        
        [LJHTTPTool postHTTPWithURL:@"http://lntuonline.pupboss.com/user/login" params:param success:^(id responseHTTP) {
            
            [LJHTTPTool getJSONWithURL:@"http://lntuonline.pupboss.com/curriculum/info" params:nil success:^(id responseJSON) {
                
                [MBProgressHUD hideHUD];
                [self.schScrollView headerEndRefreshing];
                
                [LJFileTool writeToFileContent:responseJSON withFileName:scheduleFileName];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [MBProgressHUD hideHUD];
                [self.schScrollView headerEndRefreshing];
                [MBProgressHUD showError:NULLSTR];
            }];
            
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUD];
            [self.schScrollView headerEndRefreshing];
            [MBProgressHUD showError:NULLSTR];
        }];
    }
}


- (void)setDict:(NSDictionary *)dict {
    
    NSDictionary *courses = dict[@"courses"];
    
    if ([courses[@"1-1"] isEqualToString:@""]) {
        self.s1_1.backgroundColor = [UIColor whiteColor];
    }else{
        self.s1_1.text = courses[@"1-1"];
    }
    if ([courses[@"1-2"] isEqualToString:@""]) {
        self.s1_2.backgroundColor = [UIColor whiteColor];
    }else{
        self.s1_2.text = courses[@"1-2"];
    }
    if ([courses[@"1-3"] isEqualToString:@""]) {
        self.s1_3.backgroundColor = [UIColor whiteColor];
    }else{
        self.s1_3.text = courses[@"1-3"];
    }
    if ([courses[@"1-4"] isEqualToString:@""]) {
        self.s1_4.backgroundColor = [UIColor whiteColor];
    }else{
        self.s1_4.text = courses[@"1-4"];
    }
    if ([courses[@"1-5"] isEqualToString:@""]) {
        self.s1_5.backgroundColor = [UIColor whiteColor];
    }else{
        self.s1_5.text = courses[@"1-5"];
    }
    
    
    if ([courses[@"2-1"] isEqualToString:@""]) {
        self.s2_1.backgroundColor = [UIColor whiteColor];
    }else{
        self.s2_1.text = courses[@"2-1"];
    }
    if ([courses[@"2-2"] isEqualToString:@""]) {
        self.s2_2.backgroundColor = [UIColor whiteColor];
    }else{
        self.s2_2.text = courses[@"2-2"];
    }
    if ([courses[@"2-3"] isEqualToString:@""]) {
        self.s2_3.backgroundColor = [UIColor whiteColor];
    }else{
        self.s2_3.text = courses[@"2-3"];
    }
    if ([courses[@"2-4"] isEqualToString:@""]) {
        self.s2_4.backgroundColor = [UIColor whiteColor];
    }else{
        self.s2_4.text = courses[@"2-4"];
    }
    if ([courses[@"2-5"] isEqualToString:@""]) {
        self.s2_5.backgroundColor = [UIColor whiteColor];
    }else{
        self.s2_5.text = courses[@"2-5"];
    }
    
    
    if ([courses[@"3-1"] isEqualToString:@""]) {
        self.s3_1.backgroundColor = [UIColor whiteColor];
    }else{
        self.s3_1.text = courses[@"3-1"];
    }
    if ([courses[@"3-2"] isEqualToString:@""]) {
        self.s3_2.backgroundColor = [UIColor whiteColor];
    }else{
        self.s3_2.text = courses[@"3-2"];
    }
    if ([courses[@"3-3"] isEqualToString:@""]) {
        self.s3_3.backgroundColor = [UIColor whiteColor];
    }else{
        self.s3_3.text = courses[@"3-3"];
    }
    if ([courses[@"3-4"] isEqualToString:@""]) {
        self.s3_4.backgroundColor = [UIColor whiteColor];
    }else{
        self.s3_4.text = courses[@"3-4"];
    }
    if ([courses[@"3-5"] isEqualToString:@""]) {
        self.s3_5.backgroundColor = [UIColor whiteColor];
    }else{
        self.s3_5.text = courses[@"3-5"];
    }
    
    if ([courses[@"4-1"] isEqualToString:@""]) {
        self.s4_1.backgroundColor = [UIColor whiteColor];
    }else{
        self.s4_1.text = courses[@"4-1"];
    }
    if ([courses[@"4-2"] isEqualToString:@""]) {
        self.s4_2.backgroundColor = [UIColor whiteColor];
    }else{
        self.s4_2.text = courses[@"4-2"];
    }
    if ([courses[@"4-3"] isEqualToString:@""]) {
        self.s4_3.backgroundColor = [UIColor whiteColor];
    }else{
        self.s4_3.text = courses[@"4-3"];
    }
    if ([courses[@"4-4"] isEqualToString:@""]) {
        self.s4_4.backgroundColor = [UIColor whiteColor];
    }else{
        self.s4_4.text = courses[@"4-4"];
    }
    if ([courses[@"4-5"] isEqualToString:@""]) {
        self.s4_5.backgroundColor = [UIColor whiteColor];
    }else{
        self.s4_5.text = courses[@"4-5"];
    }
    
    if ([courses[@"5-1"] isEqualToString:@""]) {
        self.s5_1.backgroundColor = [UIColor whiteColor];
    }else{
        self.s5_1.text = courses[@"5-1"];
    }
    if ([courses[@"5-2"] isEqualToString:@""]) {
        self.s5_2.backgroundColor = [UIColor whiteColor];
    }else{
        self.s5_2.text = courses[@"5-2"];
    }
    if ([courses[@"5-3"] isEqualToString:@""]) {
        self.s5_3.backgroundColor = [UIColor whiteColor];
    }else{
        self.s5_3.text = courses[@"5-3"];
    }
    if ([courses[@"5-4"] isEqualToString:@""]) {
        self.s5_4.backgroundColor = [UIColor whiteColor];
    }else{
        self.s5_4.text = courses[@"5-4"];
    }
    if ([courses[@"5-5"] isEqualToString:@""]) {
        self.s5_5.backgroundColor = [UIColor whiteColor];
    }else{
        self.s5_5.text = courses[@"5-5"];
    }
    
    if ([courses[@"6-1"] isEqualToString:@""]) {
        self.s6_1.backgroundColor = [UIColor whiteColor];
    }else{
        self.s6_1.text = courses[@"6-1"];
    }
    if ([courses[@"6-2"] isEqualToString:@""]) {
        self.s6_2.backgroundColor = [UIColor whiteColor];
    }else{
        self.s6_2.text = courses[@"6-2"];
    }
    if ([courses[@"6-3"] isEqualToString:@""]) {
        self.s6_3.backgroundColor = [UIColor whiteColor];
    }else{
        self.s6_3.text = courses[@"6-3"];
    }
    if ([courses[@"6-4"] isEqualToString:@""]) {
        self.s6_4.backgroundColor = [UIColor whiteColor];
    }else{
        self.s6_4.text = courses[@"6-4"];
    }
    if ([courses[@"6-5"] isEqualToString:@""]) {
        self.s6_5.backgroundColor = [UIColor whiteColor];
    }else{
        self.s6_5.text = courses[@"6-5"];
    }
    
    if ([courses[@"7-1"] isEqualToString:@""]) {
        self.s7_1.backgroundColor = [UIColor whiteColor];
    }else{
        self.s7_1.text = courses[@"7-1"];
    }
    if ([courses[@"7-2"] isEqualToString:@""]) {
        self.s7_2.backgroundColor = [UIColor whiteColor];
    }else{
        self.s7_2.text = courses[@"7-2"];
    }
    if ([courses[@"7-3"] isEqualToString:@""]) {
        self.s7_3.backgroundColor = [UIColor whiteColor];
    }else{
        self.s7_3.text = courses[@"7-3"];
    }
    if ([courses[@"7-4"] isEqualToString:@""]) {
        self.s7_4.backgroundColor = [UIColor whiteColor];
    }else{
        self.s7_4.text = courses[@"7-4"];
    }
    if ([courses[@"7-5"] isEqualToString:@""]) {
        self.s7_5.backgroundColor = [UIColor whiteColor];
    }else{
        self.s7_5.text = courses[@"7-5"];
    }
}

+ (instancetype)newOldClassTable {
    
    return [[NSBundle mainBundle] loadNibNamed:@"OldClassTable" owner:nil options:nil][0];
}

@end
