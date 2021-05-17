//
//  WMUMeController.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/27.
//

#import "WMUMeController.h"
#import "WMUSettingController.h"
#import "WMUMineCell.h"
#import "WMUProduct.h"
#import "WMUWebViewController.h"

static NSString *ID = @"Mine_cell";

@interface WMUMeController () <UICollectionViewDataSource, UICollectionViewDelegate>
/** 存放模型的数组 */
@property (nonatomic, strong) NSMutableArray *products;
@end

@implementation WMUMeController
#pragma mark - 懒加载
- (NSMutableArray *)products {
    if (!_products) {
        _products = [WMUProduct product];
    }
    return _products;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    UIBarButtonItem *nightItem = [UIBarButtonItem barButtomItemWithNormalBackgroundImage:@"mine-moon-icon" selectedBackgroundImage:@"mine-moon-icon-click" target:self action:@selector(didClickNightButton:)];
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtomItemWithNormalBackgroundImage:@"mine-setting-icon" highlightedBackgroundImage:@"mine-setting-icon-click" target:self action:@selector(didClickSettingButton)];
    self.navigationItem.rightBarButtonItems = @[settingItem, nightItem];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    //加载footerView
    [self setUpFooterView];
    [self resloveData];
}
//打印cell的y值
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    WMULog(@"%@", NSStringFromCGRect(cell.frame));
}
//用空白数据补齐格子
- (void)resloveData {
    NSInteger exter = self.products.count % 4;
    if (exter) {
        exter = 4 - exter;
        for (int i = 0; i < exter; i ++) {
            WMUProduct *product = [[WMUProduct alloc] init];
            [self.products addObject: product];
        }
    }
}
- (void)didClickNightButton:(UIButton *)nightBtn {
    nightBtn.selected = !nightBtn.selected;
}
- (void)didClickSettingButton {
    WMUSettingController *settingC = [[WMUSettingController alloc] init];
    settingC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingC animated:YES];
}
- (void)setUpFooterView {
    /**
     * 创建 UICollectionView的三个必备条件:
     * 1.初始化要设置流水布局
     * 2.cell必须要注册
     * 3.cell必须要自定义
     */
    //1.创建流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置cell的尺寸
    NSInteger cols = 4;
    CGFloat margin = 1;
    CGFloat itemWH = (WMUScreenW - (cols - 1) * margin) / cols;
    NSInteger rows = (self.products.count - 1) / cols + 1;
    //计算collectionView的高
    CGFloat height = rows * itemWH + (rows - 1) * margin;
    flowLayout.itemSize = CGSizeMake(itemWH, itemWH);
    flowLayout.minimumInteritemSpacing = margin;
    flowLayout.minimumLineSpacing = margin;
    //2.创建UICollectionView
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, height) collectionViewLayout:flowLayout];
    //2.1设置背景色
    collectionV.backgroundColor = self.tableView.backgroundColor;
    //2.2设置数据源
    collectionV.dataSource = self;
    //2.3设置代理
    collectionV.delegate = self;
    //3.注册cell
    [collectionV registerNib:[UINib nibWithNibName:@"WMUMineCell" bundle:nil] forCellWithReuseIdentifier:ID];
    self.tableView.tableFooterView = collectionV;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WMUProduct *product = self.products[indexPath.row];
    WMUMineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.product = product;
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    WMUProduct *product = self.products[indexPath.row];
    if (!product.url) return;
    WMUWebViewController *webVC = [[WMUWebViewController alloc] init];
    webVC.hidesBottomBarWhenPushed = YES;
    webVC.url = [NSURL URLWithString:product.url];
    [self.navigationController pushViewController:webVC animated:YES];
}
@end
