//
//  ViewController.m
//  class-timetable
//
//  Created by JieLee on 4/24/15.
//  Copyright (c) 2015 PUPBOSS. All rights reserved.
//

#define CLASSTIMETABLEMODE @"ClassTimeTableMode"
#define USERHASKNOW @"UserHasKnow"

#import "ViewController.h"
#import "MJRefresh.h"
#import "iCarousel.h"
#import "DayClassTableViewCell.h"
#import "NightClassTableViewCell.h"
#import "DayCourse.h"
#import "OldClassTableView.h"
#import "LJTools.h"

@interface ViewController () <iCarouselDataSource, iCarouselDelegate, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) iCarousel *iCaView;
@property (strong, nonatomic) OldClassTableView *oldView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *courseArray;
@property (strong, nonatomic) NSDictionary *dict;
@property (strong, nonatomic) NSUserDefaults *deft;

@end

@implementation ViewController

- (void)dealloc
{
    self.iCaView.delegate = nil;
    self.iCaView.dataSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.title = [NSString stringWithFormat:@"第%d周", (int)[LJTimeTool getCurrentWeek] - 10];
    
    self.deft = [NSUserDefaults standardUserDefaults];
    
    if (![self.deft objectForKey:CLASSTIMETABLEMODE]) {
        
        [self createNewClassView];
    } else {
        
        [self createOldClassView];
    }
    
    if (![self.deft objectForKey:USERHASKNOW]) {
        
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"小 tips" message:@"点击右上角按钮可以按周查看课表" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        
        [view show];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.iCaView = nil;
    self.oldView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

/**
 *  新版课表
 */
- (void)createNewClassView {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"courses.plist" ofType:nil];
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    if ([mgr fileExistsAtPath:filePath]) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        self.courseArray = [self getCourseArray:dict];
    }else{
        [self refreshData];
    }
    
    CGRect newFrame = self.view.frame;
    
    newFrame.origin.y += 64;
    newFrame.size.height -= 64;
    
    self.iCaView = [[iCarousel alloc] initWithFrame:newFrame];
    
    self.iCaView.delegate = self;
    self.iCaView.dataSource = self;
    self.iCaView.type = iCarouselTypeRotary;
    self.iCaView.pagingEnabled = YES;
    self.iCaView.backgroundColor = [UIColor clearColor];
    
    self.iCaView.currentItemIndex = [LJTimeTool getCurrentWeekDay] - 1;
    
    [self.view addSubview:self.iCaView];
    
    self.titleArray = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    
}

/**
 *  旧版课表
 */
- (void)createOldClassView {
    
    
    OldClassTableView *oldClassTable = [OldClassTableView newOldClassTable];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"courses.plist" ofType:nil];
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    if ([mgr fileExistsAtPath:filePath]) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        self.dict = dict;
    }else{
        [self refreshData];
    }
    
    oldClassTable.dict = self.dict;
    
    CGRect newFrame = self.view.frame;
    
    newFrame.origin.y += 64;
    newFrame.size.height -= 64;
    
    oldClassTable.frame = newFrame;
    
    self.oldView = oldClassTable;
    
    [self.view addSubview:oldClassTable];
}

#pragma mark iCarousel methods


- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 7;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    NSInteger HEIGHT = [UIScreen mainScreen].bounds.size.height - 40 - 64;
    NSInteger WIDTH = [UIScreen mainScreen].bounds.size.width - 30;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    
    tableView.tag = index;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.allowsSelection = NO;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.alwaysBounceVertical = NO;
    tableView.backgroundColor = [UIColor colorWithRed:214/255.0 green:227/255.0 blue:181/255.0 alpha:1];
    
    return tableView;
}

#pragma mark Table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"head"];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"head"];
        }
        
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.text = self.titleArray[tableView.tag];
        return cell;
    }
    if (indexPath.row == 1) {
        
        DayClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"day"];
        if (!cell) {
            cell = [DayClassTableViewCell newDayClassCell];
        }
        
        cell.course0 = self.courseArray[tableView.tag][0];
        cell.course1 = self.courseArray[tableView.tag][1];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_morning"]];
        return  cell;
    }
    if (indexPath.row == 2) {
        
        DayClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"day"];
        if (!cell) {
            cell = [DayClassTableViewCell newDayClassCell];
        }
        
        DayCourse *course = [DayCourse new];
        course.class0 = self.courseArray[tableView.tag][2];
        course.class1 = self.courseArray[tableView.tag][3];
        
        cell.course = course;
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_afternoon"]];
        return  cell;
    }
    else {
        
        NightClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"night"];
        if (!cell) {
            cell = [NightClassTableViewCell newNightClassCell];
        }
        
        cell.course = self.courseArray[tableView.tag][4];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_night"]];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 44;
    }
    if (indexPath.row == 3) {
        return 106;
    }
    else {
        
        return 212;
    }
}

- (NSArray *)getCourseArray:(NSDictionary *)dict {
    
    NSDictionary *courses = dict[@"courses"];
    
    NSArray *arr0 = @[courses[@"7-1"], courses[@"7-2"], courses[@"7-3"], courses[@"7-4"], courses[@"7-5"]];
    NSArray *arr1 = @[courses[@"1-1"], courses[@"1-2"], courses[@"1-3"], courses[@"1-4"], courses[@"1-5"]];
    NSArray *arr2 = @[courses[@"2-1"], courses[@"2-2"], courses[@"2-3"], courses[@"2-4"], courses[@"2-5"]];
    NSArray *arr3 = @[courses[@"3-1"], courses[@"3-2"], courses[@"3-3"], courses[@"3-4"], courses[@"3-5"]];
    NSArray *arr4 = @[courses[@"4-1"], courses[@"4-2"], courses[@"4-3"], courses[@"4-4"], courses[@"4-5"]];
    NSArray *arr5 = @[courses[@"5-1"], courses[@"5-2"], courses[@"5-3"], courses[@"5-4"], courses[@"5-5"]];
    NSArray *arr6 = @[courses[@"6-1"], courses[@"6-2"], courses[@"6-3"], courses[@"6-4"], courses[@"6-5"]];
    
    NSArray *array = @[arr0, arr1, arr2, arr3, arr4, arr5, arr6];
    return array;
}

- (void)refreshData
{
    // write class time table to file
}


#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:0.7f animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}

#pragma AlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        [self.deft setObject:@"1" forKey:USERHASKNOW];
    }
}

- (IBAction)changeMode:(id)sender {
    
    [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
    
    if (![self.deft objectForKey:CLASSTIMETABLEMODE]) {
        
        [self.iCaView removeFromSuperview];
        [self createOldClassView];
        [self.deft setObject:@"1" forKey:CLASSTIMETABLEMODE];
    } else {
        
        [self.oldView removeFromSuperview];
        [self createNewClassView];
        
        [self.deft setObject:nil forKey:CLASSTIMETABLEMODE];
    }
    [self.deft synchronize];
}
@end
