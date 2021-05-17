//
//  WMUHallViewController.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/8.
//

#import "WMUHallViewController.h"

@interface WMUHallViewController ()
@property (nonatomic, weak) UIView *coverView;
@property (nonatomic, weak) UIImageView *imgView;
@end

@implementation WMUHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)didClickActivityButton:(UIButton *)sender {
    //1.创建一个"遮盖", 把整个界面遮盖住
    UIView *coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    [self.tabBarController.view addSubview:coverView];
    self.coverView = coverView;
    //2.再创建一个"图片框", 显示在"遮盖"上面
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    imgView.center = coverView.center;
    //设置imgView能与用户交互
    imgView.userInteractionEnabled = YES;
    [self.tabBarController.view addSubview:imgView];
    self.imgView = imgView;
    //3."图片框"中再创建一个"关闭"按钮
    UIButton *btnClose = [[UIButton alloc] init];
    [btnClose setBackgroundImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    CGFloat w = 20;
    CGFloat h = w;
    CGFloat x = imgView.bounds.size.width - w;
    CGFloat y = 0;
    btnClose.frame = CGRectMake(x, y, w, h);
    //给按钮注册点击事件
    [btnClose addTarget:self action:@selector(clickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:btnClose];
}
//监听关闭按钮点击事件
-(void)clickCloseBtn{
    [UIView animateWithDuration:0.5 animations:^{
            self.coverView.alpha = 0.0;
            self.imgView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [self.coverView removeFromSuperview];
            [self.imgView removeFromSuperview];
        }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

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
