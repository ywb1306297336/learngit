//
//  WMUGuideCell.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUGuideCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *image;
-(void)setCellCount:(int)count currentCellIndex:(int)idx;
@end

NS_ASSUME_NONNULL_END
