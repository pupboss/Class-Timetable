//
//  LJHTTPTool.m
//
//  Created by 李杰 on 14-9-17.
//  Copyright (c) 2014年 PUPBOSS. All rights reserved.
//

#import "LJHTTPTool.h"
#import "Common.h"
#import "LJDeviceTool.h"
#import "AFNetworking.h"
#import "MBProgressHUD+LJ.h"

@implementation LJHTTPTool

+ (void)postJSONWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    if (TOKENFORNET) {
        
        [mgr.requestSerializer setValue:TOKENFORNET forHTTPHeaderField:@"Authorization"];
    }
    // 2.发送请求
    [mgr POST:url parameters:params
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          if (success) {
              success(responseObject);
          }
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          if (failure) {
              failure(error);
              if ([operation.response statusCode] == 401) {
                  [MBProgressHUD showError:@"授权已经过期，重新登陆可以解决"];
              }
              if ([operation.response statusCode] == 400) {
                  [MBProgressHUD showError:@"用户名密码错误"];
              }
              else {
                  [MBProgressHUD showError:ERRORSTR];
              }
          }
      }];
}

+ (void)postHTTPWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    if (TOKENFORNET) {
        
        [mgr.requestSerializer setValue:TOKENFORNET forHTTPHeaderField:@"Authorization"];
    }
    
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 2.发送请求
    [mgr POST:url parameters:params
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          if (success) {
              success(responseObject);
          }
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          if (failure) {
              failure(error);
              if ([operation.response statusCode] == 401) {
                  [MBProgressHUD showError:@"授权已经过期，重新登陆可以解决"];
              } else {
                  [MBProgressHUD showError:ERRORSTR];
              }
          }
      }];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> totalFormData) {
        for (LJFormData *formData in formDataArray) {
            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);        }
    }];
}

+ (void)getJSONWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    if (TOKENFORNET) {
        
        [mgr.requestSerializer setValue:TOKENFORNET forHTTPHeaderField:@"Authorization"];
    }
    
    // 2.发送请求
    [mgr GET:url parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(operation, error);
             if ([operation.response statusCode] == 401) {
                 [MBProgressHUD showError:@"授权已经过期，重新登陆可以解决"];
             } else {
                 [MBProgressHUD showError:ERRORSTR];
             }
         }
     }];
}

+ (void)getHTTPWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    if (TOKENFORNET) {
        
        [mgr.requestSerializer setValue:TOKENFORNET forHTTPHeaderField:@"Authorization"];
    }
    
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 2.发送请求
    [mgr GET:url parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
             if ([operation.response statusCode] == 401) {
                 [MBProgressHUD showError:@"授权已经过期，重新登陆可以解决"];
             } else {
                 [MBProgressHUD showError:ERRORSTR];
             }
         }
     }];
}

+ (void)feedbackError:(NSError *)error
{
//    NSString *err = [error description];
//    NSDictionary *param = @{@"info": err,
//                            @"platform":@"iOS",
//                            @"version": [LJDeviceTool getCurrentAppBuild],
//                            @"osVer": [NSString stringWithFormat:@"iOS%@",[LJDeviceTool getCurrentSystemVersion]],
//                            @"manufacturer": @"Apple",
//                            @"model": [LJDeviceTool getCurrentDeviceModel]
//                            };
//    
//    [LJHTTPTool postHTTPWithURL:[NSString stringWithFormat:@"%@feedback/crashLog",sinaURL] params:param loginToken:nil success:^(id responseHTTP) {
//        
//    } failure:^(NSError *error) {
//    }];
}

@end

/**
 *  用来封装文件数据的模型
 */
@implementation LJFormData

@end
