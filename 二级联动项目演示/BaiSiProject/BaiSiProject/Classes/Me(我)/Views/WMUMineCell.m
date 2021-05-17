//
//  WMUMineCell.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/5.
//

#import "WMUMineCell.h"
#import "WMUProduct.h"
@interface WMUMineCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgVIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@end
@implementation WMUMineCell
-(void)setProduct:(WMUProduct *)product {
    _product = product;
    self.imgVIcon.image = [UIImage imageNamed:product.icon];
    self.lblTitle.text = product.title;
}
@end
