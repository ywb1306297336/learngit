//
//  WMUADItem.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUADItem : NSObject
/** 广告地址 */
@property (nonatomic, strong) NSString *w_picurl;
/** 广告跳转界面 */
@property (nonatomic, strong) NSString *curl;
/** 宽 */
@property (nonatomic, assign) CGFloat w;
/** 高 */
@property (nonatomic, assign) CGFloat h;
@end

NS_ASSUME_NONNULL_END
