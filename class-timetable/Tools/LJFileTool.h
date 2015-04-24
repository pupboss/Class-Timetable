//
//  LJFileTool.h
//
//  Created by 李杰 on 14/9/22.
//  Copyright (c) 2014年 PUPBOSS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJFileTool : NSObject

+ (NSString *)getFilePath:(NSString *)fileName;

+ (void)writeToFileContent:(id)content withFileName:(NSString *)fileName;

+ (void)writeImageToFileName:(NSString *)imgName withImgURL:(NSString *)webURL;

@end
