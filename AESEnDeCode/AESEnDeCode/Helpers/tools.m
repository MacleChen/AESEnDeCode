//
//  tools.m
//  250
//
//  Created by 周强 on 15/12/24.
//  Copyright © 2015年 com.jointsky.www. All rights reserved.
//

#import "tools.h"

@interface tools ()

@end


@implementation tools


/**
 *  保存本地城市列表
 *
 *  @param array 城市列表的数组
 */

+ (void)setUserFollowCityWithArray:(NSMutableArray *)array{
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"followCity"];
}


/**
 *  获取城市列表
 *
 *  @return 返回城市列表数据
 */

+ (NSArray *)userFollowCity{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"followCity"];
}



/**
 *  获取时间戳 - 转字符串
 */

+ (NSString *)getTimestamp{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    NSString *timestamp = [NSString stringWithFormat:@"%.f",timeInterval];
    return timestamp;
}



/**
 *  获取本地时间
 *
 *  @return 本地时间字符串  yyyy-MM-dd HH:mm:ss
 */

+ (NSString *)getLocalTime{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *localTime = [formatter stringFromDate:date];
    return localTime;
}

/**
 *  参数 经纬度
 */

+ (NSString *)getLatitude{
    
    NSString *latitude = [NSString stringWithFormat:@"%.1f",[[NSUserDefaults standardUserDefaults]doubleForKey:@"latitude"]];
    
    if (latitude) {
        return latitude;
    }else{
        return @"0";
    }
    
}


/**
 *  参数 经纬度
 */

+ (NSString *)getLongitude{
    NSString *longitude = [NSString stringWithFormat:@"%.1f",[[NSUserDefaults standardUserDefaults]doubleForKey:@"longitude"]];
    if (longitude) {
        return longitude;
    }else{
        return @"0";
    }
}




/**
 *  获取城市
 *
 *  @return 当前城市
 */

+ (NSString *)getLocalCity{
    NSString *resultStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"locality"]; //stringByReplacingOccurrencesOfString:@"市" withString:@""];
    NSLog(@"_______%@",resultStr);
    return resultStr;
}

/**
 *  获取详细地址
 *
 *  @return 地址字符串
 */

+ (NSString *)getThoroughfare{
    
//    [[NSUserDefaults standardUserDefaults] objectForKey:@"locality"],
    NSString * str = [NSString stringWithFormat:@"%@%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"subLocality"],[[NSUserDefaults standardUserDefaults] objectForKey:@"thoroughfare"]];
    
    NSLog(@"getThoroughfare ：%@",str);
    if ([str hasPrefix:@"(null)"]) {
        return @"未获得详细地点";
    }else{
        return str;
    }
}



/**
 *  将数字的字符串转成随机的pm2.5
 *
 *  @param string 源字符串
 *
 *  @return 目标字符串
 */

+ (NSString *)randomStringWithString:(NSString *) string{
    
    int pm2_5 = [string intValue];
    
    if (pm2_5 < 20) {
        int i = arc4random() % 4 - 2;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 30){
        int i = arc4random() % 10 - 5;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if (pm2_5< 40){
        int i = arc4random() % 12 - 6;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 60){
        int i = arc4random() % 16 - 8;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 70){
        int i = arc4random() % 16 - 8;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 80){
        int i = arc4random() % 18 - 9;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else {
        int i = arc4random() % 20 - 10;
        return [NSString stringWithFormat:@"%d",pm2_5 + i] ;
        
    }
}


+ (NSString *)formats:(NSString *)obj {
    
    NSRange foundObj=[obj rangeOfString:@"-" options:NSCaseInsensitiveSearch];
    
    if (foundObj.length > 0) {
        NSLog(@"%@", [obj substringFromIndex:1]);
        return [obj substringFromIndex:1];
    }else {
        return obj;
    }
}


/**
 *  根据一个过去的时间与现在时间做对比，获取间隔多少分钟
 *
 *  @param oldDate 过去时间
 *
 *  @return 差值多少秒
 */
+ (long)GetMinuteByOldDateBetweenNowDate:(NSDate *)oldDate {
    long betweenMinutes = 0;
    
    // 获取本地时间
    NSDate *nowdate = [self dateFromString:[self getLocalTime] andFormatterString:@"yyyy-MM-dd HH:mm:ss"];
    betweenMinutes = [nowdate timeIntervalSinceDate:oldDate]/60;
    
    return betweenMinutes;
}


/**
 *  NSString转换成NSDate，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSDate *)dateFromString:(NSString *)dateString andFormatterString:(NSString *)strFormater {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:strFormater];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: destDate];
    NSDate *dateCurrent = [destDate  dateByAddingTimeInterval: interval];
    
    return dateCurrent;
}


/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"  忽略时区的转换
 */
+ (NSString *)stringIgnoreZoneFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: -interval];
    
    return [tools stringFromDate:localeDate andFormatterString:strFormater];
}


/**
 *  根据日期获取对应的星期几
 *
 *  @param inputDate 输入日期字符串
 *
 *  @return 星期几
 */
+ (NSString*)weekdayStringFromDate:(NSDate *)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];  // 设置时区
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}


/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)stringFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:strFormater];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}


/**
 *  获取时间字符串，从当前时间开始算起，正数表示向后推算几天，负数表示向前推算几天
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherDateFromNowDays:(NSInteger)dayValue andFormatterString:(NSString *)strFormater {
    NSDate* date = [[NSDate alloc] init];
    date = [date dateByAddingTimeInterval:dayValue*3600*24];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormater];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    return strDate;
}


/**
 *  获取时间字符串，从某个日期算起，正数表示向后推算几小时，负数表示向前推算几小时
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherHourFromNowHours:(NSInteger)dayValue andFormatterString:(NSString *)strFormater andDate:(NSDate *)date {
    NSDate *dateTemp = [date dateByAddingTimeInterval:(dayValue-8)*3600];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormater];
    NSString *strDate = [dateFormatter stringFromDate:dateTemp];
    
    return strDate;
}


/**
 *  可读格式化存储大小
 *
 *  @param size 存储大小   单位：B
 *
 *  @return B, K, M, G 为单位
 */
+ (NSString *)fileSizeWithInterge:(long long)size {
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024.0f;
        return [NSString stringWithFormat:@"%.1fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024.0f * 1024.0f);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024.0f*1024.0f*1024.0f);
        return [NSString stringWithFormat:@"%.2fG",aFloat];
    }
}


/**
 *  验证是否为手机号
 *
 *  @param phoneNum 要验证的手机号码
 *
 *  @return 是否为手机号
 */

+(BOOL)checkPhoneNumInputWithPhoneNum:(NSString *)phoneNum {
    NSString *pattern = @"1[3578]\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:phoneNum];
    return isMatch;
    
}


/**
 验证邮箱

 @param email email
 @return 是否是邮箱
 */
+ (BOOL)checkEmailInputWithEmail:(NSString *)email
{
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


/**
 * 字母、数字、中文正则判断（不包括空格）
 */
+ (BOOL)isInputRuleNotBlank:(NSString *)str {
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}
/**
 * 字母、数字、中文正则判断（包括空格）【注意3】
 */
+ (BOOL)isInputRuleAndBlank:(NSString *)str {
    
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d\\s]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}


/**
 *  获得 kMaxLength长度的字符
 */
+ (NSString *)getSubCharString:(NSString*)string andMaxLength:(int)mexLength
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* data = [string dataUsingEncoding:encoding];
    NSInteger length = [data length];
    if (length > mexLength) {
        NSData *data1 = [data subdataWithRange:NSMakeRange(0, mexLength)];
        NSString *content = [[NSString alloc] initWithData:data1 encoding:encoding];//【注意4】：当截取kMaxLength长度字符时把中文字符截断返回的content会是nil
        if (!content || content.length == 0) {
            data1 = [data subdataWithRange:NSMakeRange(0, mexLength - 1)];
            content =  [[NSString alloc] initWithData:data1 encoding:encoding];
        }
        return content;
    }
    return nil;
}

/**
 *  获得 kMaxLength长度的字
 */
+ (NSString *)getSubWordString:(NSString*)string andMaxLength:(int)mexLength
{
    if (string.length > mexLength) {
        NSString *content = [string substringToIndex:mexLength];
        return content;
    }
    return nil;
}

/**
 *  过滤字符串中的emoji
 */
+ (NSString *)disable_emoji:(NSString *)text{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"‍‍" withString:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"‍‍‍" withString:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"‍" withString:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"•" withString:@""];
    //modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"?" withString:@""];
    return modifiedString;
}


/*
 *第二种方法，利用Emoji表情最终会被编码成Unicode，因此，
 *只要知道Emoji表情的Unicode编码的范围，
 *就可以判断用户是否输入了Emoji表情。
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50 || hs == 0x2022 || hs == 0xd83e) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}


/**
 *  校验字符串防止nil字符串操作
 *
 *  @param stringText 字符串
 *
 *  @return 校验后的字符串
 */
+ (NSString *)verifyString:(id)stringText {
    if ([stringText isKindOfClass:[NSNull class]]) {
        return @"";
    } else if ([stringText isEqual:NULL]) {
        return @"";
    } else if ([stringText isEqual:@"null"]) {
        return @"";
    } else if ([stringText isEqual:@"<null>"]) {
        return @"";
    }

    
    return stringText == nil ? @"" : stringText;
}



/**
 格式化数据发布时间

 @param oldDate oldDate
 */
+ (NSString *)formattingTimeCanEasyRead:(NSDate *)oldDate {
    NSString *timeStr = nil;
    long betweenMinutes = [tools GetMinuteByOldDateBetweenNowDate:oldDate];
    if (betweenMinutes < 60) {
        timeStr = [NSString stringWithFormat:@"%li分钟前发布", betweenMinutes];
    } if (betweenMinutes >= 60 && betweenMinutes < 3600) {
        timeStr = [NSString stringWithFormat:@"%li小时前发布", betweenMinutes/60];
    } if (betweenMinutes >=3600) {
        timeStr = [NSString stringWithFormat:@"%li天前发布", betweenMinutes/3600];
    }
    
    return timeStr;
}


/**
 去除自定中空的字符值
 
 @param obj 对象
 */
+ (id) processDictionaryIsNSNull:(id)obj {
    const NSString *blank = @"";
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dt = [(NSMutableDictionary*)obj mutableCopy];
        for(NSString *key in [dt allKeys]) {
            id object = [dt objectForKey:key];
            if([object isKindOfClass:[NSNull class]]) {
                [dt setObject:blank
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSString class]]){
                NSString *strobj = (NSString*)object;
                if ([strobj isEqualToString:@"<null>"]) {
                    [dt setObject:blank
                           forKey:key];
                }
            }
            else if ([object isKindOfClass:[NSArray class]]){
                NSArray *da = (NSArray*)object;
                da = [self processDictionaryIsNSNull:da];
                [dt setObject:da
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSDictionary class]]){
                NSDictionary *ddc = (NSDictionary*)object;
                ddc = [self processDictionaryIsNSNull:object];
                [dt setObject:ddc forKey:key];
            }
        }
        return [dt copy];
    }
    else if ([obj isKindOfClass:[NSArray class]]){
        NSMutableArray *da = [(NSMutableArray*)obj mutableCopy];
        for (int i=0; i<[da count]; i++) {
            NSDictionary *dc = [obj objectAtIndex:i];
            dc = [self processDictionaryIsNSNull:dc];
            [da replaceObjectAtIndex:i withObject:dc];
        }
        return [da copy];
    }
    else{
        return obj;
    }
}



/**
 根据字符串中后缀的格式类型返回对应的本地文件类型图标

 @param checkString 判断字符串
 @return 本地文件类型的图标地址
 */
+ (NSString *)getLocalImageWithCheckString:(NSString *)checkString {
    if ([checkString hasSuffix:@"doc"] || [checkString hasSuffix:@"DOC"]) {
        return @"findcase_file_icon.jpg";     // word 格式
    } else if ([checkString hasSuffix:@"docx"] || [checkString hasSuffix:@"DOCX"]) {
        return @"findcase_file_icon.jpg";     // word 格式
    } else if ([checkString hasSuffix:@"pdf"] || [checkString hasSuffix:@"PDF"]) {
        return @"findcase_file2_icon.jpg";
    } else if ([checkString hasSuffix:@"ppt"] || [checkString hasSuffix:@"PPT"]) {
        return @"case_filetype001.jpg";
    }else if ([checkString hasSuffix:@"xls"] || [checkString hasSuffix:@"XLS"]) {
        return @"findcase_file3_icon.jpg";
    }else if ([checkString hasSuffix:@"txt"] || [checkString hasSuffix:@"TXT"]) {
        return @"findcase_file4_icon.jpg";
    }else {
        return @"findcase_file5_icon.jpg";  // 位置格式
    }
}




/**
 过滤字符串中HTML标签的方法

 @param html 含HTML标签的字符串
 @return    过滤后的字符串
 */
+ (NSString *)flattenHTML:(NSString *)html {
    NSScanner *theScanner;
    NSString *text = nil;

    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                            [NSString stringWithFormat:@"%@>", text]
                            withString:@""];
    } // while //
    
    return html;
}


/**
 判断本地是否存在该文件
 
 @param fileName 文件名称或者路径
 @return 存在的文件路径，不存在则返回nil
 */
+ (NSString *)checkFilePathExistWithFileName:(NSString *)fileName {
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSArray *fileNameArray = [fileName componentsSeparatedByString:@"/"];
    NSString *exitFilePath = [cachesPath stringByAppendingPathComponent:fileNameArray[fileNameArray.count-1]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:exitFilePath]) {
        return exitFilePath;
    }
    return nil;
}



/**
 统计目录文件下文件的总大小

 @param folderPath 目录地址
 @return 总大小
 */
+ (long long)folderSizeWithPath:(NSString *)folderPath {
    // 获取默认的文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 判断文件是否存在
    if (![fileManager fileExistsAtPath:folderPath]) return 0;
    
    //文件的枚举器
    NSEnumerator *fileEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName = nil;
    long long filesAllSize = 0;
    while ((fileName = [fileEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        if ([fileAbsolutePath hasSuffix:@"doc"] || [fileAbsolutePath hasSuffix:@"DOC"]  || [fileAbsolutePath hasSuffix:@"docx"] || [fileAbsolutePath hasSuffix:@"DOCX"] || [fileAbsolutePath hasSuffix:@"pdf"] || [fileAbsolutePath hasSuffix:@"PDF"] || [fileAbsolutePath hasSuffix:@"ppt"] || [fileAbsolutePath hasSuffix:@"PPT"] || [fileAbsolutePath hasSuffix:@"xls"] || [fileAbsolutePath hasSuffix:@"XLS"] || [fileAbsolutePath hasSuffix:@"txt"] || [fileAbsolutePath hasSuffix:@"TXT"] || [fileAbsolutePath hasSuffix:@"wav"] || [fileAbsolutePath hasSuffix:@"WAV"] || [fileAbsolutePath hasSuffix:@"amr"] || [fileAbsolutePath hasSuffix:@"AMR"]) {
            // 计算某个文件的大小
            filesAllSize += [self fileSizeWithPath:fileAbsolutePath];
        }
    }
   
    return filesAllSize;
}



/**
 计算指定文件的大小

 @param filePath 文件地址
 @return 大小
 */
+ (long long)fileSizeWithPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]) {
        return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    
    return 0;
}



/**
 删除指定目录下的所有文件

 @param folderPath 目录地址
 */
+ (void)removeFolderPathAndFileWithPath:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];

    // 目录是否存在
    if (![fileManager fileExistsAtPath:folderPath]) return;

    // 文件枚举器
    NSEnumerator *fileEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName = nil;
    while ((fileName = [fileEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        if ([fileAbsolutePath hasSuffix:@"doc"] || [fileAbsolutePath hasSuffix:@"DOC"]  || [fileAbsolutePath hasSuffix:@"docx"] || [fileAbsolutePath hasSuffix:@"DOCX"] || [fileAbsolutePath hasSuffix:@"pdf"] || [fileAbsolutePath hasSuffix:@"PDF"] || [fileAbsolutePath hasSuffix:@"ppt"] || [fileAbsolutePath hasSuffix:@"PPT"] || [fileAbsolutePath hasSuffix:@"xls"] || [fileAbsolutePath hasSuffix:@"XLS"] || [fileAbsolutePath hasSuffix:@"txt"] || [fileAbsolutePath hasSuffix:@"TXT"] || [fileAbsolutePath hasSuffix:@"wav"] || [fileAbsolutePath hasSuffix:@"WAV"] || [fileAbsolutePath hasSuffix:@"amr"] || [fileAbsolutePath hasSuffix:@"AMR"]) {
            // 删除指定的文件
            NSError *error = nil;
            [fileManager removeItemAtPath:fileAbsolutePath error:&error];
            if (error != nil) {
                NSLog(@"error: %@", error);
            }
        }
    }
}


/**
 问题提示
 
 @param messStr 文字
 @param view 视图
 */
+ (void)alertMessage:(NSString *)messStr andView:(NSView *)view {
    if (messStr == nil || view == nil) {
        NSLog(@"error: message or view not nil.");
        return;
    }
    
    // 提示：请输入参数
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"确定"];
    [alert setMessageText:messStr];
    [alert beginSheetModalForWindow:view.window completionHandler:nil];
}



@end
