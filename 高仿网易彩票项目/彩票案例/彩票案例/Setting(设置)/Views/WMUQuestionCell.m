//
//  WMUQuestionCell.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/15.
//

#import "WMUQuestionCell.h"
#import "WMUQuestion.h"

@implementation WMUQuestionCell
-(void)setQuestion:(WMUQuestion *)question {
    _question = question;
    self.textLabel.text = question.title;
    //设置右侧accessoryView
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
}
+(instancetype)questionCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"question_cell";
    WMUQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WMUQuestionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
@end
