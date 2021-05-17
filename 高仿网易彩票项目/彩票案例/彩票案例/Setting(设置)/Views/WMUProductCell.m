//
//  WMUProductCell.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/14.
//

#import "WMUProductCell.h"
#import "WMUProduct.h"
@interface WMUProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@end
@implementation WMUProductCell
-(void)awakeFromNib {
    [super awakeFromNib];
    //产品图标切圆角
    self.imgViewIcon.layer.cornerRadius = 10;
    //超出边缘的裁剪
    self.imgViewIcon.layer.masksToBounds = YES;
}
-(void)setProduct:(WMUProduct *)product {
    _product = product;
    self.imgViewIcon.image = [UIImage imageNamed:product.icon];
    self.lblTitle.text = product.title;
}
@end
