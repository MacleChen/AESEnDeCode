//
//  tools.h
//  250
//
//  Created by 周强 on 15/12/24.
//  Copyright © 2015年 com.jointsky.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface tools : NSObject

/**
 *  mapCode
 */
@property (nonatomic, strong) NSMutableDictionary *cityDic; //mapCode

/**
 *  获取本地时间
 *
 *  @return 本地时间字符串  yyyy-MM-dd HH:mm:ss
 */

+ (NSString *)getLocalTime;


/**
 *  获取城市
 *
 *  @return 当前城市
 */

+ (NSString *)getLocalCity;


/**
 *  获取详细地址
 *
 *  @return 地址字符串
 */

+ (NSString *)getThoroughfare;


/**
 *  参数 经纬度
 */

+ (NSString *)getLatitude;


/**
 *  参数 经纬度
 */

+ (NSString *)getLongitude;


/**
 *  获取时间戳 - 转字符串
 */

+ (NSString *)getTimestamp;


/**
 *  将数字的字符串转成随机的pm2.5
 *
 *  @param string 源字符串
 *
 *  @return 目标字符串
 */

+ (NSString *)randomStringWithString:(NSString *) string;//随机数


/**
 *  保存本地城市列表
 *
 *  @param array 城市列表的数组
 */

+ (void)setUserFollowCityWithArray:(NSMutableArray *)array;//存-- 用户关注城市


/**
 *  获取城市列表
 *
 *  @return 返回城市列表数据
 */

+ (NSMutableArray *)userFollowCity;//取--用户关注城市


/**
 *  根据一个过去的时间与现在时间做对比，获取间隔多少分钟
 *
 *  @param oldDate 过去时间
 *
 *  @return 差值多少秒
 */

+ (long)GetMinuteByOldDateBetweenNowDate:(NSDate *)oldDate;


/**
 *  NSString转换成NSDate，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */

+ (NSDate *)dateFromString:(NSString *)dateString andFormatterString:(NSString *)strFormater;


/**
 *  获取时间字符串，从当前时间开始算起，正数表示向后推算几天，负数表示向前推算几天
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherDateFromNowDays:(NSInteger)dayValue andFormatterString:(NSString *)strFormater;

/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"  忽略时区的转换
 */
+ (NSString *)stringIgnoreZoneFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater;

/**
 *  根据日期获取对应的星期几
 *
 *  @param inputDate 输入日期字符串
 *
 *  @return 星期几
 */
+ (NSString*)weekdayStringFromDate:(NSDate *)inputDate;

/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)stringFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater;


/**
 *  获取时间字符串，从某个日期算起，正数表示向后推算几小时，负数表示向前推算几小时
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherHourFromNowHours:(NSInteger)dayValue andFormatterString:(NSString *)strFormater andDate:(NSDate *)date;

/**
 *  可读格式化存储大小
 *
 *  @param size 存储大小   单位：B
 *
 *  @return B, K, M, G 为单位
 */
+ (NSString *)fileSizeWithInterge:(long long)size;


/**
 *  验证是否为手机号
 *
 *  @param phoneNum 要验证的手机号码
 *
 *  @return 是否为手机号
 */

+(BOOL)checkPhoneNumInputWithPhoneNum:(NSString *)phoneNum;


/**
 验证邮箱
 
 @param email email
 @return 是否是邮箱
 */
+ (BOOL)checkEmailInputWithEmail:(NSString *)email;


/**
 * 字母、数字、中文正则判断（不包括空格）
 */
+ (BOOL)isInputRuleNotBlank:(NSString *)str;


/**
 * 字母、数字、中文正则判断（包括空格）【注意3】
 */
+ (BOOL)isInputRuleAndBlank:(NSString *)str;


/**
 *  获得 kMaxLength长度的字符
 */
+ (NSString *)getSubCharString:(NSString*)string andMaxLength:(int)mexLength;

/**
 *  获得 kMaxLength长度的字
 */
+ (NSString *)getSubWordString:(NSString*)string andMaxLength:(int)mexLength;

/**
 *  过滤字符串中的emoji
 */
+ (NSString *)disable_emoji:(NSString *)text;


/*
 *第二种方法，利用Emoji表情最终会被编码成Unicode，因此，
 *只要知道Emoji表情的Unicode编码的范围，
 *就可以判断用户是否输入了Emoji表情。
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 *  校验字符串防止nil字符串操作
 *
 *  @param stringText 字符串
 *
 *  @return 校验后的字符串
 */
+ (NSString *)verifyString:(id)stringText;

/**
 格式化数据发布时间
 
 @param oldDate oldDate
 */
+ (NSString *)formattingTimeCanEasyRead:(NSDate *)oldDate;


/**
 去除自定中空的字符值
 
 @param obj 对象
 */
+ (id) processDictionaryIsNSNull:(id)obj;



/**
 根据字符串中后缀的格式类型返回对应的本地文件类型图标
 
 @param checkString 判断字符串
 @return 本地文件类型的图标地址
 */
+ (NSString *)getLocalImageWithCheckString:(NSString *)checkString;


/**
 过滤字符串中HTML标签的方法
 
 @param html 含HTML标签的字符串
 @return    过滤后的字符串
 */
+ (NSString *)flattenHTML:(NSString *)html;



/**
 判断本地是否存在该文件
 
 @param fileName 文件名称或者路径
 @return 存在的文件路径，不存在则返回nil
 */
+ (NSString *)checkFilePathExistWithFileName:(NSString *)fileName;


/**
 统计目录文件下文件的总大小
 
 @param folderPath 目录地址
 @return 总大小
 */
+ (long long)folderSizeWithPath:(NSString *)folderPath;


/**
 计算指定文件的大小
 
 @param filePath 文件地址
 @return 大小
 */
+ (long long)fileSizeWithPath:(NSString *)filePath;


/**
 删除指定目录下的所有文件
 
 @param folderPath 目录地址
 */
+ (void)removeFolderPathAndFileWithPath:(NSString *)folderPath;

/**
 问题提示
 
 @param messStr 文字
 @param view 视图
 */
+ (void)alertMessage:(NSString *)messStr andView:(NSView *)view;

@end
