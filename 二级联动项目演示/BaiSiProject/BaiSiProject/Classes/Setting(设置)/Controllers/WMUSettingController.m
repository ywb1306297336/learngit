//
//  WMUSettingController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/28.
//

#import "WMUSettingController.h"
#import "WMUFileTool.h"
@interface WMUSettingController ()
/** 文件大小 */
@property (nonatomic, assign) NSInteger totalSize;
@end

@implementation WMUSettingController
static NSString * const ID = @"clean_cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [WMUFileTool getFileSize:WMUCachePath completion:^(NSInteger totalSize) {
        self.totalSize = totalSize;
        [self.tableView reloadData];
    }];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [self getSizeStr];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [WMUFileTool removeDirectoryPath:WMUCachePath];
    self.totalSize = 0;
    [self.tableView reloadData];
}
//获取缓存大小的字符串
- (NSString *)getSizeStr {
//    //获取Caches文件夹的路径
//    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    //获取default文件路径
//    NSString *defaultPath = [cachesPath stringByAppendingPathComponent:@"com.hackemist.SDImageCache/default"];
    NSInteger totalSize = self.totalSize;
    NSString *sizeStr = @"清除缓存";
    if (totalSize > 1000 * 1000) {
        CGFloat sizeF = totalSize / 1000.0 / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fMB)", sizeStr, sizeF];
    } else if (totalSize > 1000) {
        CGFloat sizeF = totalSize / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fKB)", sizeStr, sizeF];
    } else if (totalSize > 0) {
        sizeStr = [NSString stringWithFormat:@"%@(%.ldB)", sizeStr, totalSize];
    }
    return sizeStr;
}
@end
