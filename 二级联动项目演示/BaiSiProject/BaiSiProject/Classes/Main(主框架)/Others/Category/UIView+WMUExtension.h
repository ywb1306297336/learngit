//
//  UIView+WMUExtension.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WMUExtension)
/** 宽 */
@property (nonatomic, assign) CGFloat width;
/** 高 */
@property (nonatomic, assign) CGFloat height;
/** x轴 */
@property (nonatomic, assign) CGFloat x;
/** y轴 */
@property (nonatomic, assign) CGFloat y;
/** 尺寸 */
@property (nonatomic, assign) CGSize size;
/** 坐标 */
@property (nonatomic, assign) CGPoint origin;
/** 中心点X */
@property (nonatomic, assign) CGFloat centerX;
/** 中心点Y */
@property (nonatomic, assign) CGFloat centerY;
@end

NS_ASSUME_NONNULL_END
