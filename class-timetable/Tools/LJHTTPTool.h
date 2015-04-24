//
//  LJHTTPTool.h
//
//  Created by 李杰 on 14-9-17.
//  Copyright (c) 2014年 PUPBOSS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPRequestOperation;

@interface LJHTTPTool : NSObject

/**
 *  发送一个POST JSON请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postJSONWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseJSON))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个POST HTTP请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postHTTPWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseHTTP))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formData  文件参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *  发送一个GETJSON请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getJSONWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseJSON))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  发送一个GET HTTP请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getHTTPWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseHTTP))success failure:(void (^)(NSError *error))failure;

+ (void)feedbackError:(NSError *)error;

@end


/**
 *  用来封装文件数据的模型
 */
@interface LJFormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;

@end
