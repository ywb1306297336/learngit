//
//  WMUGameController.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUGameController.h"
#import "WMUApp.h"
#import "WMUAppCell.h"
@interface WMUGameController ()
/** 存放模型的数组 */
@property (nonatomic, strong) NSArray *apps;
@end

@implementation WMUGameController
#pragma mark - 懒加载
- (NSArray *)apps {
    if (!_apps) {
        _apps = [WMUApp app];
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"游戏大厅";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"返回" fgNormal:WMUColor(81, 81, 81, 81) fgHighlighted:WMUColor(255, 81, 147, 1.0) fontSize:17 target:self action:@selector(didClickBackButton)];
    self.tableView.rowHeight = 80;
}
#pragma mark - 监听
- (void)didClickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WMUApp *app = self.apps[indexPath.row];
    WMUAppCell *cell = [WMUAppCell appCellWithTableView:tableView];
    cell.app = app;
    return cell;
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
