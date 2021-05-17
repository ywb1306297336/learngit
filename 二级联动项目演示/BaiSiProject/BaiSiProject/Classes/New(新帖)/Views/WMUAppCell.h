//
//  WMUAppCell.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WMUApp;
@interface WMUAppCell : UITableViewCell
/** 模型对象属性 */
@property (nonatomic, strong) WMUApp *app;
+(instancetype)appCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
