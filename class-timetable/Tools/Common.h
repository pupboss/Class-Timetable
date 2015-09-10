//
//  JWCommon.h
//  lntuApp
//
//  Created by Li Jie on 14/11/29.
//  Copyright (c) 2014年 PUPBOSS. All rights reserved.
//

#define WAITSTR @"正在玩命加载中~~" // 等待提示语
#define ERRORSTR @"服务器被外星人搬走了o(╯□╰)o" // 错误提示语
#define NULLSTR @"暂无此类数据"

#define USERNAMEKEY @"userName"   // 用户名 key
#define PWDKEY @"pwd"           // 密码 key
#define PUSHTOKENOLD @"pushTokenOld"  // 旧Token key
#define PUSHTOKENNEW @"pushTokenNew"

#define LOGINTOKEN @"LOGINTOKEN"
#define CLASSTABLEMODE @"ClassTableMode"
#define KNOWOLDCLASSTABLE @"KnowOldClassTable"

#define TOKENFORNET [[NSUserDefaults standardUserDefaults] objectForKey:LOGINTOKEN]


// 获得RGB颜色
#define LJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
