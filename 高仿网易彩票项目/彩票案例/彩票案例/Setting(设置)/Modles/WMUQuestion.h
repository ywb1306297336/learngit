//
//  WMUQuestion.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUQuestion : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)questionWithDictionary:(NSDictionary *)dict;
+(NSArray *)question;
@end

NS_ASSUME_NONNULL_END
