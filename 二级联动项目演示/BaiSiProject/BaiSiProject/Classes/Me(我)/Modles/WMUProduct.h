//
//  WMUProduct.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUProduct : NSObject
/** 产品名称 */
@property (nonatomic, copy) NSString *title;
/** 产品图标 */
@property (nonatomic, copy) NSString *icon;
/** 产品url */
@property (nonatomic, copy) NSString *url;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)productWithDictionary:(NSDictionary *)dict;
+(NSMutableArray *)product;
@end

NS_ASSUME_NONNULL_END
