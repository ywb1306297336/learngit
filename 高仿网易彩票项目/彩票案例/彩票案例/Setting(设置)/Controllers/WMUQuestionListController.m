//
//  WMUQuestionListController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/15.
//

#import "WMUQuestionListController.h"
#import "WMUQuestion.h"
#import "WMUQuestionCell.h"
#import "WMUWebViewController.h"
@interface WMUQuestionListController ()
/** 储存所有问题的数组 */
@property(nonatomic, strong)NSArray *questions;
@end

@implementation WMUQuestionListController
#pragma mark - 懒加载
-(NSArray *)questions {
    _questions = [WMUQuestion question];
    return _questions;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取模型数据
    WMUQuestion *question = self.questions[indexPath.row];
    //2.创建cell
    WMUQuestionCell *cell = [WMUQuestionCell questionCellWithTableView:tableView];
    //3.给cell设置数据
    cell.question = question;
    //4.返回cell
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取模型数据
    WMUQuestion *question = self.questions[indexPath.row];
    //2.创建要push的控制器
    WMUWebViewController *webVC = [[WMUWebViewController alloc] init];
    //3.把模型数据传过去
    webVC.question = question;
    //4.执行跳转
    [self.navigationController pushViewController:webVC animated:YES];
}

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
