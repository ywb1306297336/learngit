//
//  WMUMoreProductsController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/14.
//

#import "WMUMoreProductsController.h"
#import "WMUProduct.h"
#import "WMUProductCell.h"
@interface WMUMoreProductsController ()
/** 用来保存所有产品信息 */
@property(nonatomic, strong)NSArray *products;
@end

@implementation WMUMoreProductsController
static NSString * const ID = @"product_cell";
#pragma mark - 懒加载
-(NSArray *)products {
    if (!_products) {
        _products = [WMUProduct product];
    }
    return _products;
}
-(instancetype)init {
    //创建一个布局对象(流水布局)
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //每个格子大小
    flowLayout.itemSize = CGSizeMake(80, 80);
    //修改格子与格子之间的水平间距(最小水平间距)
    flowLayout.minimumInteritemSpacing = 0;
    //修改格子与格子之间的垂直间距(最小垂直间距)
    flowLayout.minimumLineSpacing = 10;
    //设置组间距
    flowLayout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);
    return [super initWithCollectionViewLayout:flowLayout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell, 注册一个类
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    //注册cell, 注册一个xib
    UINib *nib = [UINib nibWithNibName:@"WMUProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    //设置UICollectionView的背景图片
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //返回组的个数
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //返回每一组有多少格子
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取数据
    WMUProduct *modle = self.products[indexPath.row];
    //2.创建cell
    WMUProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //3.给cell设置数据
    cell.product = modle;
    //4.返回cell
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//点击某个单元格后执行
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取当前选中行的模型数据
    WMUProduct *modle = self.products[indexPath.row];
    //2.打印其标题
    NSLog(@"%@", modle.title);
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
