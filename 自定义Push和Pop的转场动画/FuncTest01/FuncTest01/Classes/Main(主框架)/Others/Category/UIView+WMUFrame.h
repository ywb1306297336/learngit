//
//  UIView+WMUFrame.h
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WMUFrame)
/** 宽 */
@property (nonatomic, assign) CGFloat wmu_width;
/** 高 */
@property (nonatomic, assign) CGFloat wmu_height;
/** x */
@property (nonatomic, assign) CGFloat wmu_x;
/** y */
@property (nonatomic, assign) CGFloat wmu_y;
/** size */
@property (nonatomic, assign) CGSize wmu_size;
/** origin */
@property (nonatomic, assign) CGPoint wmu_origin;
/** 中心点x */
@property (nonatomic, assign) CGFloat wmu_center_x;
/** 中心点y */
@property (nonatomic, assign) CGFloat wmu_center_y;
@end

NS_ASSUME_NONNULL_END
