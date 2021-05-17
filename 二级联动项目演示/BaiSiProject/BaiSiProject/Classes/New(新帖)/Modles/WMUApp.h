//
//  WMUApp.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WMUApp : NSObject
/** 应用图片 */
@property (nonatomic, copy) NSURL *icon;
/** 应用名称 */
@property (nonatomic, copy) NSString *name;
/** 下载量 */
@property (nonatomic, copy) NSString *download;
/** 占位图片 */
@property (nonatomic, weak) UIImage *pHImg;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)appWithDictionary:(NSDictionary *)dict;
+(NSArray *)app;
@end

NS_ASSUME_NONNULL_END
