//
//  WMUSettingViewController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/11.
//

#import "WMUSettingViewController.h"
#import "WMUSettingCell.h"

@interface WMUSettingViewController ()
/** 用来存放所有字典的数组对象 */
@property(nonatomic, strong)NSArray *groups;
@end

@implementation WMUSettingViewController
/**
 重写init方法, 保证创建好的tableView控制器中, tableView的样式都是grouped样式
 */
-(instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}
-(instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}
#pragma mark - 懒加载
-(NSArray *)groups {
    if (!_groups) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.plistName ofType:nil];
        _groups = [NSArray arrayWithContentsOfFile:path];
    }
    return _groups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置左侧返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popViewControllerAnimated:)];
    self.navigationItem.leftBarButtonItem = backItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //1.找到对应的组
    NSDictionary *group = self.groups[section];
    //2.找到组中对应的集合
    NSArray *items = group[@"items"];
    //3.返回子项个数
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取数据
    //1.1获取组信息
    NSDictionary *group = self.groups[indexPath.section];
    //1.2获取具体项的信息
    NSDictionary *item = [group[@"items"] objectAtIndex:indexPath.row];
    //2.创建cell
    WMUSettingCell *cell = [WMUSettingCell settingCellWithTableView:tableView item:item];
    //3.设置cell的数据
    cell.item = item;
    //5.返回cell
    return cell;
}
//选中某行时调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取数据
    //1.1获取组信息
    NSDictionary *group = self.groups[indexPath.section];
    //1.2获取具体项信息
    NSDictionary *item = [group[@"items"] objectAtIndex:indexPath.row];
    //判断是否有function_name这个键
    if ([item[@"function_name"] length] > 0) {
        //表示有对应函数需要执行
        //把方法名转换成一个selector
        SEL func = NSSelectorFromString(item[@"function_name"]);
        //执行这个方法(func)
        //调用func之前, 先判断一下当前self(当前对象)是否有func这个方法
        if ([self respondsToSelector:func]) {
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:func];
            #pragma clang diagnostic pop
        }
    }
    //1.3获取当前点击的项(target_vc)
    NSString *TargetClassName = item[@"target_vc"];
    if (TargetClassName) {
        //1.4把TargetClassName转换成类
        Class TargetClass = NSClassFromString(TargetClassName);
        //2.创建目标控制器的对象
        UIViewController *destVC = [[TargetClass alloc] init];
        //2.1判断如果目标控制器是"设置控制器", 那么还得指定一个plistName
        if ([destVC isKindOfClass:[WMUSettingViewController class]]) {
            WMUSettingViewController *settingsVC = (WMUSettingViewController *)destVC;
            settingsVC.plistName = item[@"plist_name"];
        }
        //设置目标控制器标题
        destVC.navigationItem.title = item[@"title"];
        //3.把目标控制器push到当前导航控制器
        [self.navigationController pushViewController:destVC animated:YES];
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //获取组信息
    NSDictionary *group = self.groups[section];
    return group[@"header"];
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    //获取组信息
    NSDictionary *group = self.groups[section];
    return group[@"footer"];
}
-(void)checkUpdate {
    NSLog(@"-------------当前已是最新版本--------------");
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
