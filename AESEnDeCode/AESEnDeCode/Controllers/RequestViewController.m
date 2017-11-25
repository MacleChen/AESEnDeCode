//
//  RequestViewController.m
//  AESEnDeCode
//
//  Created by 陈帆 on 2017/11/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "RequestViewController.h"

@interface RequestViewController () {
}

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.title = @"网络解析";
}

- (IBAction)sendRequestBtnClick:(NSButton *)sender {
    // 判断url是否输入
    if (self.baseUrlTextField.stringValue.length <= 0) {
        // 提示：请输入URL
        [tools alertMessage:@"请输入URL" andView:self.view];
        return;
    }
    
//    // 判断headerParam是否输入
//    if (self.headerParamTF.stringValue.length <= 0) {
//        // 提示：请输入请求头参数
//        [tools alertMessage:@"请输入请求头参数" andView:self.view];
//        return;
//    }
//    
//    // 判断paramter是否输入
//    if (self.paramTextField.stringValue.length <= 0) {
//        // 提示：请输入参数
//        [tools alertMessage:@"请输入参数" andView:self.view];
//        return;
//    }
    
    // 如果加密情况下是否输入密码
    if (self.checkBtn.state != 0 && self.codePasswordTF.stringValue.length <= 0) {
        // 提示：请输入密码
        [tools alertMessage:@"请输入密码" andView:self.view];
        return;
    }
    
    // 将header请求参数字符串转成字典
    [self SessionManagerWebData:self.baseUrlTextField.stringValue andHeaderParam:[self requestStringWithURLParamStr:self.headerParamTF.stringValue] andParameters:[self requestStringWithURLParamStr:self.paramTextField.stringValue] andRequestType:self.requestTypePuBtn.selectedItem.title andIsEncrypt:self.checkBtn.state andEncryptKeyStr:self.codePasswordTF.stringValue];
    
}

// MARK: 是否加密点击方法
- (IBAction)checkBtnClick:(NSButton *)sender {
}




/**
 网络请求

 @param strUrl 请求地址和接口
 @param headerParamDict 请求头参数
 @param parameters 请求参数
 @param strType 请求方式（get， post）
 @param isEncrypt 是否加密
 @param encryptKeyStr 加密的密码
 */
- (void)SessionManagerWebData:(NSString *)strUrl andHeaderParam:(NSDictionary *)headerParamDict andParameters:(NSDictionary *)parameters andRequestType:(NSString *)strType  andIsEncrypt:(BOOL)isEncrypt andEncryptKeyStr:(NSString *)encryptKeyStr {
    AFHTTPSessionManager * sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置编码
    [sessionManager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    // 设置请求头中的参数 accessToken=e91cd4ec7f414f7f8888796f0d5df8d8.5280D611-1823-4A75-BB30-FA82D6FB5721
    for (NSString *keyStr in headerParamDict.allKeys) {
        [sessionManager.requestSerializer setValue:[NSString stringWithFormat:@"%@=%@", keyStr,  headerParamDict[keyStr]] forHTTPHeaderField:@"Set-Cookie"];
    }
    sessionManager.requestSerializer.timeoutInterval = REQUEST_TIMEOUT_VALUE;
    
    if ([strType isEqual:REQUEST_GET]) {
        [sessionManager GET:strUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"currentThread == %@", [NSThread currentThread]);
           
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self responseSuccessWithData:task andResponseObject:responseObject andisEncrypt:isEncrypt andEncryptKeyStr:encryptKeyStr];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
            NSLog(@"error: %@", error);
            // 提示信息：ERROR_WEB_EXCEPTION
            [tools alertMessage:[NSString stringWithFormat:@"%@", error] andView:self.view];
        }];
        
    } else if ([strType isEqual:REQUEST_POST]) {
        [sessionManager POST:strUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"currentThread == %@", [NSThread currentThread]);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self responseSuccessWithData:task andResponseObject:responseObject andisEncrypt:isEncrypt andEncryptKeyStr:encryptKeyStr];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error: %@", error);
            [tools alertMessage:[NSString stringWithFormat:@"%@", error] andView:self.view];
        }];
    }
}

// MARK: 请求成功后的处理方法
- (void)responseSuccessWithData:(NSURLSessionDataTask *)task andResponseObject:(id)responseObject andisEncrypt:(BOOL)isEncrypt andEncryptKeyStr:(NSString *)encryptKeyStr {
    // 获取数据的返回头数据
//    NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse*)task.response;
//    NSDictionary *allHeaderFieldsDict = httpURLResponse.allHeaderFields;
    // 解析数据
    NSDictionary *dataDict = responseObject;
    if (isEncrypt) {
        // 加密
        // data 转成 字符串
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        // 解码
        NSString *string2 = [AESCryptJointSky decrypt:string password:encryptKeyStr];
        self.resultTextView.string = string2;
        dataDict = [string2 mj_JSONObject];
    } else {
        // 未加密
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        self.resultTextView.string = string;
        dataDict = [string mj_JSONObject];
    }
    
    
}



/**
 将网络请求参数转成字典

 @param paramStr 网络请求参数字符串
 @return 字典
 */
- (NSDictionary *)requestStringWithURLParamStr:(NSString *)paramStr {
    if (paramStr == nil) {
        return @{};
    }
   
    NSMutableDictionary *resultMuDict = [[NSMutableDictionary alloc] init];
    NSArray *paramArray = [paramStr componentsSeparatedByString:@"&"];
    for (NSString *paramStr in paramArray) {
        NSArray *keyValueArray = [paramStr componentsSeparatedByString:@"="];
        if (keyValueArray.count == 2) {
            [resultMuDict setValue:keyValueArray[1] forKey:keyValueArray[0]];
        }
    }
    
    return resultMuDict;
}


@end
