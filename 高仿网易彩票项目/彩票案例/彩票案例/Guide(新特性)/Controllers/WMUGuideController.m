//
//  WMUGuideController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/15.
//

#import "WMUGuideController.h"
#import "WMUGuideCell.h"
#define WMUCellCount 4
@interface WMUGuideController ()
/** 图片框 */
@property(nonatomic, strong)UIImageView *imgViewIcon;
/** 大文字图片 */
@property(nonatomic, strong)UIImageView *imgViewLargeText;
/** 小文字图片 */
@property(nonatomic, strong)UIImageView *imgViewSmallText;
@end

@implementation WMUGuideController

static NSString * const ID = @"guide_cell";

-(instancetype)init {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //1.设置每个格子的大小
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    //2.设置行间距
    flowLayout.minimumLineSpacing = 0;
    //3.设置水平滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell
    [self.collectionView registerClass:[WMUGuideCell class] forCellWithReuseIdentifier:ID];
    //去掉弹簧效果
    self.collectionView.bounces = NO;
    //去掉滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //设置分页效果
    self.collectionView.pagingEnabled = YES;
    /**
     创建图片框, 并且把图片框添加到UICollectionView当中
     */
    //1.创建一个保存『足球、篮球』的图片框
    UIImageView *imgViewIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:imgViewIcon];
    self.imgViewIcon = imgViewIcon;
    //2.创建一个波浪线图片
    UIImageView *imgViewLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    imgViewLine.x = -201;
    [self.collectionView addSubview:imgViewLine];
    //3.创建大文字图片
    UIImageView *imgViewLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    imgViewLargeText.y = self.collectionView.bounds.size.height * 0.7;
    [self.collectionView addSubview:imgViewLargeText];
    self.imgViewLargeText = imgViewLargeText;
    //4.创建小文字图片
    UIImageView *imgViewSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    imgViewSmallText.y = self.collectionView.bounds.size.height * 0.8;
    [self.collectionView addSubview:imgViewSmallText];
    self.imgViewSmallText = imgViewSmallText;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return WMUCellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取数据(根据当前滚动到第几个cell, 拼接对应的背景图片名称)
    NSString *imgBgName = [NSString stringWithFormat:@"guide%dBackground", (int)(indexPath.row + 1)];
    UIImage *imgBg = [UIImage imageNamed:imgBgName];
    //2.创建cell
    WMUGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //3.设置cell的图片
    cell.image = imgBg;
    //3.1设置"立即体验"按钮是否显示
    [cell setCellCount:WMUCellCount currentCellIndex:(int)indexPath.row];
    return cell;
}
//滚动减速完成
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //1.获取当前滚动偏移的x值
    CGFloat offsetX = scrollView.contentOffset.x;
    //1.1切换图片
    //1.1.1计算出当前滚动到了第几页
    int page = offsetX / scrollView.bounds.size.width;
    //1.1.2拼接图片名称
    NSString *imgIconName = [NSString stringWithFormat:@"guide%d", page + 1];
    NSString *imgLargeName = [NSString stringWithFormat:@"guideLargeText%d", page + 1];
    NSString *imgSmallName = [NSString stringWithFormat:@"guideSmallText%d", page + 1];
    self.imgViewIcon.image = [UIImage imageNamed:imgIconName];
    self.imgViewLargeText.image = [UIImage imageNamed:imgLargeName];
    self.imgViewSmallText.image = [UIImage imageNamed:imgSmallName];
    //2.设置collectionView里3个图片框的x值为当前滚动的偏移值
    //2.1判断用户滚动的方向
    CGFloat startX;
    if (offsetX > self.imgViewIcon.x) {
        //表示向左滚动
        startX = offsetX + scrollView.bounds.size.width;
    } else {
        //表示向右滚动
        startX = offsetX - scrollView.bounds.size.width;
    }
    self.imgViewIcon.x = startX;
    self.imgViewLargeText.x = startX;
    self.imgViewSmallText.x = startX;
    NSLog(@"%f", self.collectionView.contentSize.width);
    //根据用户滚动方向的不同, 做不同的动画
    [UIView animateWithDuration:0.4 animations:^{
        self.imgViewIcon.x = offsetX;
        self.imgViewLargeText.x = offsetX;
        self.imgViewSmallText.x = offsetX;
    }];
}

#pragma mark <UICollectionViewDelegate>

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
