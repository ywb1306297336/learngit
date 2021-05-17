//
//  WMUQuestionCell.h
//  彩票案例
//
//  Created by 殷文博 on 2021/3/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class WMUQuestion;
@interface WMUQuestionCell : UITableViewCell
/** 模型对象属性 */
@property(nonatomic, strong)WMUQuestion *question;
+(instancetype)questionCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
