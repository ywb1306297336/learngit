//
//  WMUProductCell.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WMUProduct;
@interface WMUProductCell : UICollectionViewCell
/** 模型对象属性 */
@property(nonatomic, strong)WMUProduct *product;
@end

NS_ASSUME_NONNULL_END
