//
//  WMULiveScorePushController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/12.
//

#import "WMULiveScorePushController.h"
#import "WMUSettingCell.h"

@interface WMULiveScorePushController ()
//记录当前选中行的indexPath
@property (nonatomic, strong) NSIndexPath *idxPath;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIToolbar *toolBar;
@end

@implementation WMULiveScorePushController
#pragma mark - 懒加载
-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.inputView = self.datePicker;
        _textField.inputAccessoryView = self.toolBar;
    }
    return _textField;
}
-(UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        _datePicker.datePickerMode = UIDatePickerModeTime;
    }
    return _datePicker;
}
-(UIToolbar *)toolBar {
    if (!_toolBar) {
        _toolBar = [[UIToolbar alloc] init];
        _toolBar.height = 44;
        _toolBar.barTintColor = [UIColor purpleColor];
        //创建工具栏中的三个按钮
        //cancel
        UIBarButtonItem *itemCancel = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(didClickCancelBtn)];
        //spring
        UIBarButtonItem *itemSpring = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        //done
        UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(didClickDoneBtn)];
        _toolBar.items = @[itemCancel, itemSpring, itemDone];
    }
    return _toolBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
//选中某个cell后会执行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //记录indexPath
    self.idxPath = indexPath;
    //如果点击的是第0组 那么什么都不做
    if (indexPath.section == 0) return;
    //如果点击的不是第0组, 那么再弹出键盘
    //1.创建文本框, 并且把文本框添加到当前cell中, 同时让当前文本框成为第一响应者
    WMUSettingCell *cell = (WMUSettingCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell.contentView addSubview:self.textField];
    [self.textField becomeFirstResponder];
}
//点击完成按钮
-(void)didClickDoneBtn {
    //1.把键盘叫回去
    [self.view endEditing:YES];
    //2.把用户选择的时间设置给detailTextLabel
    //2.1获取用户选择的时间
    NSDate *date = self.datePicker.date;
    //2.2把用户选择的时间转换成字符串类型
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *strTime = [formatter stringFromDate:date];
    //2.3把时间设置给当前选中的cell的detailTextLabel
    WMUSettingCell *cell = [self.tableView cellForRowAtIndexPath:self.idxPath];
    [cell setTimeWithText:strTime];
    //3.把文本框从父控件移除
    [self.textField removeFromSuperview];
}
//点击了取消按钮
-(void)didClickCancelBtn {
    //1.把键盘叫回去
    [self.view endEditing:YES];
    //2.把文本框从父控件移除
    [self.textField removeFromSuperview];
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
