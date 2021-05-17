//
//  WMUSettingCell.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUSettingCell : UITableViewCell
/** cell里具体项字典 */
@property(nonatomic, strong)NSDictionary *item;
//封装自定义创建cell的类方法
+(instancetype)settingCellWithTableView:(UITableView *)tableView;
+(instancetype)settingCellWithTableView:(UITableView *)tableView item:(NSDictionary *)item;
//设置detailTextLabel的方法
-(void)setTimeWithText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
