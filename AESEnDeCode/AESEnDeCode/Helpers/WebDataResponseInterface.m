//
//  WebDataResponseInterface.m
//  ECOCityProject
//
//  Created by jointsky on 16/6/8.
//  Copyright © 2016年 com.jointsky.www. All rights reserved.
//

#import "WebDataResponseInterface.h"

@implementation WebDataResponseInterface

/**
 *  封装get网络请求数据接口
 *
 *  @param strApi     接口api
 *  @param parameters 参数列表
 *  @param progress   请求进度
 *  @param success    成功block
 *  @param failure    错误block
 */
+ (void)SessionManagerGetProgressWebDataWithApi:(NSString *)strApi andParameters:(NSDictionary *)parameters andProgress:(WebDataResponseProgress)progress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure {
    
    [self SessionManagerWebData:WEBBASEURL andApi:strApi andParameters:parameters andRequestType:REQUEST_GET andProgress:progress andSuccess:success andFailure:failure andIsEncrypt:YES andEncryptKeyStr:AESC_PASSWORD];
}


/**
 *  封装Post网络请求数据接口
 *
 *  @param strApi     接口api
 *  @param parameters 参数列表
 *  @param progress   请求进度
 *  @param success    成功block
 *  @param failure    错误block
 */
+ (void)SessionManagerPostWebDataWithApi:(NSString *)strApi andParameters:(NSDictionary *)parameters andProgress:(WebDataResponseProgress)progress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure {
    [self SessionManagerWebData:WEBBASEURL andApi:strApi andParameters:parameters andRequestType:REQUEST_POST andProgress:progress andSuccess:success andFailure:failure andIsEncrypt:YES andEncryptKeyStr:AESC_PASSWORD];
}



/**
 *  网络请求数据总方法
 *
 *  @param strUrl     请求网络地址和端口
 *  @param strApi     API接口
 *  @param parameters 请求参数
 *  @param strType    请求类型：GET，POST
 *  @param webDataDownloadProgress  请求完成数据的进度
 *  @param success    响应成功时调用的Block
 *  @param failure    响应失败时调用的Block
 *  @param isEncrypt  是否解密
 *  @param encryptKeyStr 解密密钥
 */
+ (void)SessionManagerWebData:(NSString *)strUrl andApi:(NSString *)strApi andParameters:(NSDictionary *)parameters andRequestType:(NSString *)strType andProgress:(WebDataResponseProgress)webDataDownloadProgress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure andIsEncrypt:(BOOL)isEncrypt andEncryptKeyStr:(NSString *)encryptKeyStr {
    AFHTTPSessionManager * sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置编码
    [sessionManager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    // 设置请求头中 AccessToken （没有登录传 “”）
//    NSString *accessToken = appDelegate.userInfo == nil ? @"" : [[NSUserDefaults standardUserDefaults] objectForKey:ACCESS_TOKEN];
//    [sessionManager.requestSerializer setValue:[NSString stringWithFormat:@"AccessToken=%@", [tools verifyString:accessToken]] forHTTPHeaderField:@"Set-Cookie"];
    sessionManager.requestSerializer.timeoutInterval = REQUEST_TIMEOUT_VALUE;
    
    if (![strApi hasPrefix:@"/"]) {
        strApi = [NSString stringWithFormat:@"/%@", strApi];
    }
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@", strUrl, strApi];
    
    if ([strType isEqual:REQUEST_GET]) {
        [sessionManager GET:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"currentThread == %@", [NSThread currentThread]);
            if (webDataDownloadProgress != nil) {
                webDataDownloadProgress((float)downloadProgress.completedUnitCount/(float)downloadProgress.totalUnitCount);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 解析数据
            NSDictionary *dataDict = responseObject;
            if (isEncrypt) {
                // data 转成 字符串
                NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                // 解码
//                NSString *string2 = [AESCrypt decrypt:string password:encryptKeyStr];
                dataDict = [string mj_JSONObject];
            }
            
            int resultCode = [[dataDict objectForKey:RESULT_STATUS] intValue];
            if (resultCode == RESULT_RIGHT) {
                success([dataDict objectForKey:RESULT_DATA]);
            } else {
                // 提示信息：RESULT_MESSAGE
            }

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure != nil) {
                failure(error);
            }
            NSLog(@"error: %@", error);
            // 提示信息：ERROR_WEB_EXCEPTION
        }];
        
    } else if ([strType isEqual:REQUEST_POST]) {
        [sessionManager POST:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if (webDataDownloadProgress != nil) {
                webDataDownloadProgress((float)uploadProgress.completedUnitCount/(float)uploadProgress.totalUnitCount);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse*)task.response;
            NSDictionary *allHeaderFieldsDict = httpURLResponse.allHeaderFields;
            [self saveAccessTokenWithHeaderFieldsDict:allHeaderFieldsDict];
            // 解析数据
            NSDictionary *dataDict = responseObject;
            if (isEncrypt) {
                // data 转成 字符串
                NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                // 解码
//                NSString *string2 = [AESCrypt decrypt:string password:AESC_PASSWORD];
                dataDict = [string mj_JSONObject];
            }
            if (dataDict == nil) {
                if (failure != nil) {
                    failure(nil);
                }
                NSLog(@"returnNull:%@", requestUrl);
                return;
            }
            
            int resultCode = [[dataDict objectForKey:RESULT_STATUS] intValue];
            if (resultCode == RESULT_RIGHT) {
                id object = [dataDict objectForKey:RESULT_DATA];
                if (object == nil || [object isKindOfClass:[NSNull class]] || [object isEqual:@""]) {
                    success(nil);
                } else {
                    success([dataDict objectForKey:RESULT_DATA]);
                }
            } else {
                if (failure != nil) {
                    failure(nil);
                }
                // 2. 提示信息：RESULT_MESSAGE
            }

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure != nil) {
                failure(error);
            }
            NSLog(@"error: %@", error);
        }];
    }
}




/**
 上传files 类型的数据接口（图片，文件，音频，视频等）

 @param strUrl URL
 @param apiStr API
 @param parameters Parameters
 @param block AFMultipartFormData
 @param webDataDownloadProgress progress
 @param success success block
 @param failure failed block
 */
+ (void)SessionManagerUploadFilesWithStrUrl:(NSString *)strUrl AndApi:(NSString *)apiStr andParameters:(NSDictionary *)parameters andFormData:(void (^)(id <AFMultipartFormData> formData))block andProgress:(WebDataResponseProgress)webDataDownloadProgress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure {

    //网络请求管理器
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
//    // 设置请求头中 AccessToken （没有登录传 “”）
//    NSString *accessToken = appDelegate.userInfo == nil ? @"" : [[NSUserDefaults standardUserDefaults] objectForKey:ACCESS_TOKEN];
//    [sessionManager.requestSerializer setValue:[NSString stringWithFormat:@"AccessToken=%@", [tools verifyString:accessToken]] forHTTPHeaderField:@"Set-Cookie"];
    sessionManager.requestSerializer.timeoutInterval = REQUEST_TIMEOUT_VALUE;
    
    if (![apiStr hasPrefix:@"/"]) {
        apiStr = [NSString stringWithFormat:@"/%@", apiStr];
    }
    NSString *requestUrlStr = [NSString stringWithFormat:@"%@%@", strUrl, apiStr];
    [sessionManager POST:requestUrlStr parameters:parameters constructingBodyWithBlock:block progress:^(NSProgress * _Nonnull uploadProgress) {
        if (webDataDownloadProgress != nil) {
            webDataDownloadProgress((float)uploadProgress.completedUnitCount/(float)uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 解析数据
        // data 转成 字符串
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        // 解码
//        NSString *string2 = [AESCrypt decrypt:string password:AESC_PASSWORD];
        NSDictionary *dataDict = [string mj_JSONObject];
        
        if (dataDict == nil) {
            success(nil);
            return;
        }
        
        int resultCode = [[dataDict objectForKey:RESULT_STATUS] intValue];
        if (resultCode == RESULT_RIGHT) {
            success([dataDict objectForKey:RESULT_DATA]);
        } else {
            success(nil);
            //2. 提示2
//            [MBProgressHUD show:[dataDict objectForKey:RESULT_MESSAGE] icon:nil view:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure != nil) {
            failure(error);
        }
        NSLog(@"error: %@", error);
    }];
}



/**
 下载文件的功能

 @param strUrl Url
 @param apiStr ApiStr
 @param webDataDownloadProgress 进度
 @param success 成功后文件Path
 */
+ (void)SessionManagerDownLoadFilesWithStrUrl:(NSString *)strUrl AndApi:(NSString *)apiStr  andProgress:(WebDataResponseProgress)webDataDownloadProgress andSuccess:(WebDataResponseSuccess)success {
    
    //远程地址
    if (![apiStr hasPrefix:@"/"]) {
        apiStr = [NSString stringWithFormat:@"/%@", apiStr];
    }
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", strUrl, apiStr]];
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //AFN3.0+基于封住URLSession的句柄
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    //下载Task操作
   NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // @property int64_t totalUnitCount;     需要下载文件的总大小
        // @property int64_t completedUnitCount; 当前已经下载的大小
        
        // 给Progress添加监听 KVO
        // 回到主队列刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            // 设置进度条的百分比
            if (webDataDownloadProgress != nil) {
                webDataDownloadProgress((float)downloadProgress.completedUnitCount/(float)downloadProgress.totalUnitCount);
            }
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
        
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //设置下载完成操作
        // filePath就是你下载文件的位置，你可以解压，也可以直接拿来使用
        
        NSString *imgFilePath = [filePath path];// 将NSURL转成NSString
        success(imgFilePath);
        
    }];
    [task resume];  // 开始下载
}



/**
 获取用户信息详情的接口
 
 @param userId 用户Id
 */
+ (void)getWebResponseUserInformationWithUserId:(NSString *)userId andsuccessBlock:(WebDataResponseSuccess)success {
    NSDictionary *parameters = @{@"userId" : [tools verifyString:userId]};
    
    [WebDataResponseInterface SessionManagerPostWebDataWithApi:WEB_INTERFACE_User_GetUserDetail andParameters:parameters andProgress:nil andSuccess:^(id successObject) {
        successObject = [tools processDictionaryIsNSNull:successObject];
        if (successObject != nil) {
            success(successObject);
        }
    } andFailure:nil];
}



/**
 *  监测网络状态
 */
+ (void)checkNetWorkStatus {
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case -1:
            {
                // 提示信息：ERROR_WEB_EXCEPTION
                ;
            }
                break;
            case 0:
            {
                // 提示信息：ERROR_WEB_EXCEPTION
                ;
            }
                break;
            case 1:
            {
            }
                break;
            case 2:
            {
            }
                break;
            default:
                break;
        }
    }];
}


// MARK: 保存 HeaderDict中的AccessToken
+ (void)saveAccessTokenWithHeaderFieldsDict:(NSDictionary *)headerDict {
    NSString *cookieStr = headerDict[@"Set-Cookie"];
    NSArray *valueArr = [cookieStr componentsSeparatedByString:@"; "];
    if (valueArr.count > 0) {
        NSArray *accessTokenArray = [valueArr[0] componentsSeparatedByString:@"="];
        if (accessTokenArray.count > 1 && [accessTokenArray[0] isEqual:@"AccessToken"]) {
            NSString *accessToken = accessTokenArray[1];
            NSLog(@"accessToken: %@", accessToken);
            // 保存AccessToken
            [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:ACCESS_TOKEN];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}


@end
