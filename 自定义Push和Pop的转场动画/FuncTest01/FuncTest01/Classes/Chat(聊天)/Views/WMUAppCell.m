//
//  WMUAppCell.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUAppCell.h"
#import "WMUApp.h"
#import <SDWebImage/SDWebImage.h>
@interface WMUAppCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgVIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDownload;

@end
@implementation WMUAppCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
        cell = [[NSBundle mainBundle] loadNibNamed:@"WMUAppCell" owner:nil options:nil].firstObject;
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
