//
//  WMUAppCell.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/4/29.
//

#import "WMUAppCell.h"
#import "WMUApp.h"
#import <SDWebImage/SDWebImage.h>
@interface WMUAppCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgVIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDownload;
@property (weak, nonatomic) IBOutlet UIButton *btnSub;

@end
@implementation WMUAppCell
- (void)setFrame:(CGRect)frame {
    frame.size.height -= 2;
    [super setFrame:frame];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgVIcon.layer.cornerRadius = 30;
    self.imgVIcon.layer.masksToBounds = YES;
    self.imgVIcon.layer.borderWidth = 2;
    self.imgVIcon.layer.borderColor = WMURandomColor.CGColor;
}

- (void)setApp:(WMUApp *)app {
    _app = app;
    [self.imgVIcon sd_setImageWithURL:app.icon placeholderImage:app.pHImg];
    self.lblName.text = app.name;
    self.lblDownload.text = app.download;
}

+ (instancetype)appCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"app_cell";
    WMUAppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"WMUAppCell" owner:nil options:nil].lastObject;
    }
    return cell;
}

- (IBAction)didClickSubButton {
    self.btnSub.selected = !self.btnSub.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
