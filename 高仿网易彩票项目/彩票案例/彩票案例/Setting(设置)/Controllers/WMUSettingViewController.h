//
//  WMUSettingViewController.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUSettingViewController : UITableViewController
/** 用来保存plist文件名称 */
@property(nonatomic, copy)NSString *plistName;
@end

NS_ASSUME_NONNULL_END
