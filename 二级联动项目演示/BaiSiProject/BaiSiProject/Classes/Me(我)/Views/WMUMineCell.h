//
//  WMUMineCell.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WMUProduct;
@interface WMUMineCell : UICollectionViewCell
/** 模型对象属性 */
@property (nonatomic, strong) WMUProduct *product;
@end

NS_ASSUME_NONNULL_END
