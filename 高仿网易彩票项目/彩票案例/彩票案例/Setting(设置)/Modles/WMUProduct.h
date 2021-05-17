//
//  WMUProduct.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUProduct : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)productWithDictionary:(NSDictionary *)dict;
+(NSArray *)product;
@end

NS_ASSUME_NONNULL_END
