//
//  WMUBottomBarView.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WMUBottomBarView;
@protocol WMUBottomBarViewDelegate <NSObject>
//代理方法
-(void)bottomBarView:(WMUBottomBarView *)bottomBarView didClickBottomBarButtonWithIndex:(int)idx;
@end
@interface WMUBottomBarView : UIView
/** 代理属性 */
@property(nonatomic, weak)id<WMUBottomBarViewDelegate> delegate;
//封装一个创建底部按钮的方法
-(void)addBotttomBarButtonWithImage:(NSString *)normal selected:(NSString *)selected;
@end

NS_ASSUME_NONNULL_END
