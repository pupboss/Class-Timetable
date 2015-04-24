//
//  LJFileTool.m
//
//  Created by 李杰 on 14/9/22.
//  Copyright (c) 2014年 PUPBOSS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJFileTool.h"
#import "Common.h"

@implementation LJFileTool

+ (void)writeToFileContent:(id)content withFileName:(NSString *)fileName
{
    [content writeToFile:[self getFilePath:fileName] atomically:YES];
}

+ (NSString *)getNewName:(NSString *)fileName {
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    NSString *str = [def objectForKey:USERNAMEKEY];
    
    if (str.length) {
        return [NSString stringWithFormat:@"%@%@", str, fileName];
    } else {
        return @"error";
    }
    
}

#pragma mark 
+ (NSString *)getFilePath:(NSString *)fileName
{
    NSString *newFileName = [self getNewName:fileName];
    
    NSString *home = NSHomeDirectory();
    
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    
    NSString *filePath = [docPath stringByAppendingPathComponent:newFileName];
    
    return filePath;
}

+ (void)writeImageToFileName:(NSString *)imgName withImgURL:(NSString *)webURL
{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:webURL]];
    UIImage *img = [[UIImage alloc] initWithData:data];
    [self writeToFileContent:UIImagePNGRepresentation(img) withFileName:imgName];
}

@end
