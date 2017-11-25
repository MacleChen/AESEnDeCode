//
//  WebDataResponseInterface.h
//  ECOCityProject
//
//  Created by jointsky on 16/6/8.
//  Copyright © 2016年 com.jointsky.www. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  网络数据请求接口信息
 */
// 解密密码
#define AESC_PASSWORD  @"JOINT_MOBILE_APP"
// AccessToken
#define ACCESS_TOKEN @"AccessToken"

// 网络请求时间 s
#define REQUEST_TIMEOUT_VALUE 20

/// 一期服务地址
// 测试请求ip 端口 (测试)1 一期
#define WEBBASEURL0_FILE @"http://121.40.82.126:8280"
#define WEBBASEURL0 @"http://121.40.82.126:8280/EcoSphereTest"
// 正式请求ip端口 一期
//#define WEBBASEURL @"http://121.40.82.126:8080"


/// 二期服务地址
// 测试请求ip 端口 (测试)2 二期
#define WEBBASEURL_FILE @"http://115.159.156.24:8280"
#define WEBBASEURL @"http://115.159.156.24:8280"
// 正式请求ip端口 一期
//#define WEBBASEURL @"http://121.40.82.126:8080"



/****************     数据正式接口     *****************/

///////////  ECO  /////////////   一期请求地址
//1. 获取推荐照片
#define WEB_INTERFACE_ECO_GetRecommed @"/eco/getRecommend"

//2. 获取最近站点的PM2.5
#define WEB_INTERFACE_ECO_NearbyPm25 @"/eco/getNearbyPm25"

//3. 250你发布，发布照片
#define WEB_INTERFACE_ECO_Publish @"/eco/publish"

//4. 获取250照片列表分页
#define WEB_INTERFACE_ECO_GetPhotosPage @"/eco/getPhotosPage"

//5. 获取区划树
#define WEB_INTERFACE_ECO_GetRegionTree @"/eco/getRegionTree"

//6. 获取用户足迹
#define WEB_INTERFACE_ECO_GetUserFoot @"/eco/getUserFoot"

//7. 获取照片主评论
#define WEB_INTERFACE_ECO_GetPhotoMainComment @"/eco/getPhotoMainComment"

//8. 发表照片的文字评论
#define WEB_INTERFACE_ECO_CommentWithText @"/eco/commentWithText"

//9. 发表照片的语音评论
#define WEB_INTERFACE_ECO_CommentWithAudio @"/eco/commentWithAudio"

//10. 照片点赞，或踩
#define WEB_INTERFACE_ECO_Like @"/eco/like"

//11. 获取照片的评论列表（分页）
#define WEB_INTERFACE_ECO_GetPhotoCommentList @"/eco/getPhotoComment"

//12. 获取指定城市所属区的pm2.5浓度，照片数量(最近一周)
#define WEB_INTERFACE_ECO_GetRecentPm25Count @"/eco/getRecentPm25Count"

//13. 获取指定城市区域最近一周的照片
#define WEB_INTERFACE_ECO_GetRecentPhotos @"/eco/getRecentPhotos"

//14. 用户反馈
#define WEB_INTERFACE_FeedBack_FeedBack @"/feedback/feedback"

//15. 获取权限模块
#define WEB_INTERFACE_User_GetModule @"/user/getModule"

//16. 获取最新城市的ECI空气质量数据
#define WEB_INTERFACE_ECI_GetEciByCity @"/eci/getECIByCity"




///////////  User  /////////////
//1. 获取短信验证码（如果手机号未注册，会进行后台注册）
#define WEB_INTERFACE_User_GetSmsCode @"/EcoSphere/user/User!getSmsCode.page"

//2. 登录
#define WEB_INTERFACE_User_Login @"/EcoSphere/user/User!login.page"

//3. 快速登录
#define WEB_INTERFACE_User_LoginByPhone @"/EcoSphere/user/User!loginByPhone.page"

//4. 验证邮箱，发送邮件
#define WEB_INTERFACE_User_ValidMail @"/EcoSphere/user/validMail"

//5.修改昵称、性别
#define WEB_INTERFACE_User_UpdateName @"/EcoSphere/user/User!update.page"

//7. 上传用户头像
#define WEB_INTERFACE_User_UploadAvatar @"/EcoSphere/user/User!changeAvatar.page"

//8. 注册
#define WEB_INTERFACE_User_Register @"/EcoSphere/user/User!register.page"

//9. 认证的接口
#define WEB_INTERFACE_User_Auth @"/EcoSphere/user/User!auth.page"

//10. 获取用户详情的接口
#define WEB_INTERFACE_User_GetUserDetail @"/EcoSphere/user/User!getUserDetail.page"

//11. 按登录的专家用户获取专家详情
#define WEB_INTERFACE_User_ExpertDetail @"/EcoSphere/expert/Expert!getExpertDetailByUserId.page"

//12. 获取个人与专家相关数量：收藏专家数量、咨询专家数量
#define WEB_INTERFACE_User_AboutExpertCount @"/EcoSphere/expert/Expert!getUserExpertCount.page"

//13. 修改密码的接口
#define WEB_INTERFACE_User_ChangePassword @"/EcoSphere/user/User!changePassword.page"

//14. 修改手机号
#define WEB_INTERFACE_User_ChangePhoneNumber @"/EcoSphere/user/User!changePhoneNumber.page"

//15. 获取邮箱的验证码
#define WEB_INTERFACE_User_GetEmailCode @"/EcoSphere/user/User!getMailCode.page"

//16. 修改邮箱
#define WEB_INTERFACE_User_ChangeEmail @"/EcoSphere/user/User!changeMail.page"

// 17. 处理认证信息（后台管理员的接口）
#define WEB_INTERFACE_User_ProcessAuth @"/EcoSphere/user/User!processAuth.page"

// 18. 判断用户今天是否签到
#define WEB_INTERFACE_User_JudgeCheck @"/EcoSphere/economic/UserCheckLog!judgeCheck.page"

// 19. 让用户签到
#define WEB_INTERFACE_User_QuickSign @"/EcoSphere/economic/UserCheckLog!check.page"

// 20. 注销退出登录
#define WEB_INTERFACE_User_Logout @"/EcoSphere/user/User!logout.page"





///////////    Expert  //////////////
//1. 查询专家列表
#define WEB_INTERFACE_EXPERT_ExpertList @"/EcoSphere/expert/Expert!findExpertList.page"

//2. 获取收藏专家列表
#define WEB_INTERFACE_EXPERT_GetCollectExpert @"/EcoSphere/expert/Expert!getCollectExpertPage.page"

//3. 获取咨询专家列表
#define WEB_INTERFACE_EXPERT_GetConsultationExpert @"/EcoSphere/expert/Expert!getConsultationExpert.page"

//4. 按关键字、分类查询专家列表
#define WEB_INTERFACE_EXPERT_FindListByKeyWordClass @"/EcoSphere/expert/Expert!findPageByKeyWordClass.page"

//5. 专家详情界面--获取专家详情    
#define WEB_INTERFACE_EXPERT_GetExpertDetailByExpertDetailByExpertId @"/EcoSphere/expert/Expert!getExpertDetailByExpertId.page"

//6. 收藏/取消收藏 专家
#define WEB_INTERFACE_EXPERT_CollectExpert @"/EcoSphere/expert/Expert!collectExpert.page"

//7. 点赞/取消点赞 专家                                 
#define WEB_INTERFACE_EXPERT_LikeExpert @"/EcoSphere/expert/Expert!likeExpert.page"

//8. 获取咨询过的专家列表
#define WEB_INTERFACE_EXPERT_GetConsultationExpertPage @"/EcoSphere/expert/Expert!getConsultationExpertPage.page"

//9. 批量删除收藏专家
#define WEB_INTERFACE_EXPERT_DeleteCollectExpert @"/EcoSphere/expert/Expert!deleteCollectExpert.page"

//10. 批量删除咨询专家记录
#define WEB_INTERFACE_EXPERT_DeleteConsultationExpert @"/EcoSphere/expert/Expert!deleteConsultationExpert.page"

//11. 发表咨询咨询\回复
#define WEB_INTERFACE_EXPERT_ConsultationText @"/EcoSphere/expert/Expert!consultationText.page"

//12. 上传专家咨询语音消息
#define WEB_INTERFACE_EXPERT_UploadExpertAudio @"/EcoSphere/attache/ecoAttache!uploadExpertAudio.page"

//13. 发表语音咨询\回复
#define WEB_INTERFACE_EXPERT_ConsultationAudio @"/EcoSphere/expert/Expert!consultationAudio.page"

//14. 获取专家与用户一对一聊天记录
#define WEB_INTERFACE_EXPERT_GetConsultationListByUser @"/EcoSphere/expert/Expert!getConsultationListByUser.page"

//15. 获取此领域的专家列表
#define WEB_INTERFACE_EXPERT_GetSimilarScopeExpert @"/EcoSphere/expert/Expert!getSimilarScopeExpert.page"

//16. 专家获取咨询自己的所有消息列表（专家才有），按咨询用户单独分组
#define WEB_INTERFACE_EXPERT_GetConsultationListByExpert @"/EcoSphere/expert/Expert!getConsultationListByExpert.page"




////////////   Document   ////////////
//1. 按关键词、分类查询文档的列表
#define WEB_INTERFACE_DOCUMENT_FindPageByKeyWordClass @"/EcoSphere/document/Document!findPageByKeyWordClass.page"

//2. 获取个人与文档相关数量：上传数量、下载数量、收藏数量、悬赏数量
#define WEB_INTERFACE_DOCUMENT_GetUserDocumentCount @"/EcoSphere/document/Document!getUserDocumentCount.page"

//3. 文档详细
#define WEB_INTERFACE_DOCUMENT_GetDocumentDetail @"/EcoSphere/document/Document!getDocumentDetail.page"

//4. 文档评论列表的获取
#define WEB_INTERFACE_DOCUMENT_GetCommentPage @"/EcoSphere/document/DocumentComment!getCommentPage.page"

//5. 文档评价
#define WEB_INTERFACE_DOCUMENT_SendComment @"/EcoSphere/document/DocumentComment!comment.page"

//6. 批量删除收藏文档的记录
#define WEB_INTERFACE_DOCUMENT_DeleteCollect @"/EcoSphere/document/Document!deleteCollect.page"

//6-1. 批量删除下载文档的记录
#define WEB_INTERFACE_DOCUMENT_DeleteDownload @"/EcoSphere/document/Document!deleteDownload.page"

//7. 获取用户上传文档
#define WEB_INTERFACE_DOCUMENT_GetUploadPage @"/EcoSphere/document/Document!getUploadPage.page"

//8. 获取用户下载文档
#define WEB_INTERFACE_DOCUMENT_GetDownloadPage @"/EcoSphere/document/Document!getDownloadPage.page"

//9. 获取用户收藏文档
#define WEB_INTERFACE_DOCUMENT_GetCollectPage @"/EcoSphere/document/Document!getCollectPage.page"

//10. 批量删除上传的文章
#define WEB_INTERFACE_DOCUMENT_DeleteDocument @"/EcoSphere/document/Document!deleteDocument.page"

//11. 获取相同领域文档分页(同类)
#define WEB_INTERFACE_DOCUMENT_GetSimilarScopeDocument @"/EcoSphere/document/Document!getSimilarScopeDocument.page"

//12. 收藏/取消收藏 文档
#define WEB_INTERFACE_DOCUMENT_Collect @"/EcoSphere/document/Document!collect.page"

//13. 下载文档记录（登录用户点击下载文档按钮时调用，不用关心返回值）
#define WEB_INTERFACE_DownloadLog @"/EcoSphere/document/Document!downloadLog.page"




///////////    Product   ////////////
//1. 按关键词、分类查询产品的列表
#define WEB_INTERFACE_PRODUCT_FindPageByKeyWordClass @"/EcoSphere/product/Product!findPageByKeyWordClass.page"

//2. 获取个人与产品相关数量：咨询数量、收藏数量、已回复数量、未回复数量
#define WEB_INTERFACE_PRODUCT_GetUserProductCount @"/EcoSphere/product/Product!getUserProductCount.page"

//3. 产品详情
#define WEB_INTERFACE_PRODUCT_ProductDetail @"/EcoSphere/product/Product!getProductDetail.page"

//4. 获取商家与用户一对一聊天记录
#define WEB_INTERFACE_PRODUCT_GetConsultationListByUser @"/EcoSphere/product/Consultation!getConsultationListByUser.page"

//5. 获取用户收藏产品
#define WEB_INTERFACE_PRODUCT_GetCollectPage @"/EcoSphere/product/Product!getCollectPage.page"

//6. 获取用户咨询产品
#define WEB_INTERFACE_PRODUCT_GetConsultationPage @"/EcoSphere/product/Product!getConsultationPage.page"

//7. 店铺的详细信息
#define WEB_INTERFACE_PRODUCT_GetShopDetail @"/EcoSphere/product/Shop!getShopDetail.page"

//8. 产品排行榜
#define WEB_INTERFACE_PRODUCT_Rank @"/EcoSphere/product/Product!rank.page"

//9. 商家获取出售的产品
#define WEB_INTERFACE_PRODUCT_GetPublishPage @"/EcoSphere/product/Product!getPublishPage.page"

//10. 商家获取咨询的所有产品消息列表（商家才有）
#define WEB_INTERFACE_PRODUCT_GetConsultationListByShop @"/EcoSphere/product/Consultation!getConsultationListByShop.page"

//10-1. 商家获取咨询自己的所有用户消息列表（商家才有）
#define WEB_INTERFACE_PRODUCT_GetConsultationListByProduct @"/EcoSphere/product/Consultation!getConsultationListByProduct.page"

//11. 商家获取自己的店铺详情
#define WEB_INTERFACE_PRODUCT_GetShopDetailByUser @"/EcoSphere/product/Shop!getShopDetailByUser.page"

//12. 发表商家咨询\回复
#define WEB_INTERFACE_PRODUCT_ConsultationText @"/EcoSphere/product/Consultation!consultationText.page"

//13. 发表商家语音咨询\回复
#define WEB_INTERFACE_PRODUCT_MerchantConsultationAudio @"/EcoSphere/product/Consultation!consultationAudio.page"

//14. 获取商家与用户一对一聊天记录
#define WEB_INTERFACE_PRODUCT_GetMerchantConsultationListByUser @"/EcoSphere/product/Consultation!getConsultationListByUser.page"

//15. 收藏/取消收藏产品
#define WEB_INTERFACE_PRODUCT_Collect @"/EcoSphere/product/Product!collect.page"

//16. 批量删除咨询产品记录
#define WEB_INTERFACE_PRODUCT_DeleteConsultation @"/EcoSphere/product/Product!deleteConsultation.page"

//17. 批量删除收藏产品记录
#define WEB_INTERFACE_PRODUCT_DeleteCollect @"/EcoSphere/product/Product!deleteCollect.page"




////////////   文件   //////////////
//1. 下载文件
#define WEB_INTERFACE_ATTACH_EcoAttacheDownload @"/EcoSphere/attache/ecoAttache!download.page"

//2. 上传用户头像
#define WEB_INTERFACE_ATTACH_UploadUserAvatar @"/EcoSphere/attache/ecoAttache!uploadUserAvatar.page"

//3. 上传专家图片
#define WEB_INTERFACE_UploadExpertAvatar @"/EcoSphere/attache/ecoAttache!uploadExpertAvatar.page"

//4. 上传商家咨询语音消息
#define WEB_INTERFACE_PRODUCT_UploadMerchantAudio @"/EcoSphere/attache/ecoAttache!uploadProductAudio.page"


//////////    排行榜   ///////////
// 1. 按排行榜类型获取排行榜记录列表
#define WEB_INTERFACE_LOADERBOARD_GetByType @"/EcoSphere/leaderboard/Leaderboard!getByType.page"




////////////   字典   //////////////
// 1. 获取全部领域
#define WEB_INTERFACE_DICTIONARY_GetAll @"/EcoSphere/dictionary/Scope!getAll.page"

// 2. 根据父编码获取分类树
#define WEB_INTERFACE_DICTIONARY_InfoClass_GetInfoClassTree @"/EcoSphere/dictionary/InfoClass!getInfoClassTree.page"


/////////////    碳币    ///////////////
// 1. 获取个人与碳币相关数量：碳币余额、近7天支出、近7天收入
#define WEB_INTERFACE_CARBON_GetUserCarbonCoinCount  @"/EcoSphere/economic/CarbonCoinChangeLog!getUserCarbonCoinCount.page"
// 2. 获取碳币变更记录分页
#define WEB_INTERFACE_CARBON_GetLogPage @"/EcoSphere/economic/CarbonCoinChangeLog!getLogPage.page"




// 获取设备唯一标识符
#define PHONE_ID [[UIDevice currentDevice] identifierForVendor].UUIDString

// 测试图片id
#define PHOTO_ID @"0380C09F-A75B-4D83-8461-84373044D1051465443151_1"
#define USER_ID @"123"
#define USER2_ID @"456"
#define USER3_ID @"789"

// 默认的用户头像
#define DEFAULT_USER_ICON [UIImage imageNamed:@"default_user_icon.png"]

// 图片cell展示中每页的大小
#define DEFAULT_IMAGE_CELL_PAGESIZE @"20"

// 用户信息更新
#define USER_INFO_UPDATE @"userUpdate"
// 用户点赞更新
#define USER_SUPPORT_UPDATE @"supportUpdate"


// 数据返回
#define RESULT_STATUS @"status"       //  数据返回时，校验码
#define RESULT_MESSAGE @"msg"         // 数据返回时的信息提示
#define RESULT_DATA @"data"           // 返回的数据块

// 返回数据正确判断
#define RESULT_RIGHT 101      // 操作成功
#define RESULT_ERROR 001      // 参数不正确、内部逻辑出错、抛出异常情况下返回
#define RESULT_NO_AUTHOR 002  // 没有操作权限


#define RE_LOGIN_MAX_COUNT 5        // 重新登录的次数

// 网络请求方式
#define REQUEST_GET @"GET"
#define REQUEST_POST @"POST"

// 错误提示
#define ERROR_WEB_GET_DATA_FAIL @"请求数据出错"
#define ERROR_WEB_EXCEPTION @"网络不给力"
#define ERROR_ADDRESS_NOT_EXIST @"未获取地址信息"
#define ERROR_SERVERS_WRONG @"服务器出错，返回null"


/**
 *  图片类型
 */
typedef NS_ENUM(NSInteger, PhotoType) {
    /**
     *  拼接的图片类型
     */
    PhotoTypeJoint = 0,
    /**
     *  美化后的图片类型
     */
    PhotoTypeBeautify = 1,
    /**
     *  原图类型
     */
    PhotoTypeOriginal = 2,
    /**
     *  缩略图的类型
     */
    PhotoTypeSmall = 3,
};

/**
 *  用户类型
 */
typedef NS_ENUM(int, UserType) {
    /**
     *  临时用户
     */
    UserTypeTempUser = 0,
    /**
     *  正式用户
     */
    UserTypeFormalUser = 1,
};

/**
 *  用户信息操作类型
 */
typedef NS_ENUM(NSInteger, UserInfoType) {
    /**
     *  用户增加信息
     */
    UserInfoTypeRegister = 0,
    /**
     *  用户修改信息
     */
    UserInfoTypeModify = 1,
};


/**
 *  用户对密码操作的类型
 */
typedef NS_ENUM(NSInteger, UserasswordModifyType) {
    /**
     *  忘记密码
     */
    UserasswordModifyTypeForget = 1,
    /**
     *  用户升级
     */
    UserasswordModifyTypeUpgrade = 2,
};


typedef NS_ENUM(int, UserGetSmsCodeType) {
    UserGetSmsCodeTypeRegister = 0,
    UserGetSmsCodeTypeLogin = 1,
};



/**
 响应进度

 @param progress progress
 */
typedef void (^WebDataResponseProgress) (float progress);


/**
 *  网络数据请求正确时回调的block声明
 *
 *  @param successObject 返回键值对
 */
typedef void (^WebDataResponseSuccess) (id successObject);

/**
 *  网络数据请求错误时回调的block声明
 *
 *  @param error 错误信息
 */
typedef void (^WebDataresponseFailure) (NSError *error);


@interface WebDataResponseInterface : NSObject

/**
 *  封装get网络请求数据接口
 *
 *  @param strApi     接口api
 *  @param parameters 参数列表
 *  @param progress   请求进度
 *  @param success    成功block
 *  @param failure    错误block
 */
+ (void)SessionManagerGetProgressWebDataWithApi:(NSString *)strApi andParameters:(NSDictionary *)parameters andProgress:(WebDataResponseProgress)progress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure;


/**
 *  封装Post网络请求数据接口
 *
 *  @param strApi     接口api
 *  @param parameters 参数列表
 *  @param progress   请求进度
 *  @param success    成功block
 *  @param failure    错误block
 */
+ (void)SessionManagerPostWebDataWithApi:(NSString *)strApi andParameters:(NSDictionary *)parameters andProgress:(WebDataResponseProgress)progress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure;


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
+ (void)SessionManagerWebData:(NSString *)strUrl andApi:(NSString *)strApi andParameters:(NSDictionary *)parameters andRequestType:(NSString *)strType andProgress:(WebDataResponseProgress)webDataDownloadProgress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure andIsEncrypt:(BOOL)isEncrypt andEncryptKeyStr:(NSString *)encryptKeyStr;



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
+ (void)SessionManagerUploadFilesWithStrUrl:(NSString *)strUrl AndApi:(NSString *)apiStr andParameters:(NSDictionary *)parameters andFormData:(void (^)(id <AFMultipartFormData> formData))block andProgress:(WebDataResponseProgress)webDataDownloadProgress andSuccess:(WebDataResponseSuccess)success andFailure:(WebDataresponseFailure)failure;


/**
 下载文件的功能
 
 @param strUrl Url
 @param apiStr ApiStr
 @param webDataDownloadProgress 进度
 @param success 成功后文件Path
 */
+ (void)SessionManagerDownLoadFilesWithStrUrl:(NSString *)strUrl AndApi:(NSString *)apiStr  andProgress:(WebDataResponseProgress)webDataDownloadProgress andSuccess:(WebDataResponseSuccess)success;



/**
 获取用户信息详情的接口
 
 @param userId 用户Id
 */
+ (void)getWebResponseUserInformationWithUserId:(NSString *)userId andsuccessBlock:(WebDataResponseSuccess)success;


/**
 *  监测网络状态
 */
+ (void)checkNetWorkStatus;



@end
