//
//  WMUSettingCell.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/12.
//

#import "WMUSettingCell.h"

@implementation WMUSettingCell
//重写item的set方法
-(void)setItem:(NSDictionary *)item {
    _item = item;
    if (item[@"icon"]) {
        self.imageView.image = [UIImage imageNamed:item[@"icon"]];
    }
    self.textLabel.text = item[@"title"];
    self.detailTextLabel.text = item[@"details"];
    //从保存时间的key_name_time中获取偏好设置的时间
    //这个是plist文件中"key_name_time"键的判断
    if ([self.item[@"key_name_time"] length] > 0) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSString *timeText = [userDefault objectForKey:item[@"key_name_time"]];
        //这个是"偏好设置"(沙盒)中的判断
        if (timeText.length > 0) {
            self.detailTextLabel.text = timeText;
        }
    }
    //设置accessoryView
    if (item[@"accessory"] && [item[@"accessory"] length] > 0) {
        //根据配置, 生成一个类(把字符串"UIImageView"转换成类"UIImageView")
        Class AccessoryClass = NSClassFromString(item[@"accessory"]);
        //根据类创建一个对象
        id accessory_obj = [[AccessoryClass alloc] init];
        //判断给定的对象是否是图片框
        if ([accessory_obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imgView = (UIImageView *)accessory_obj;
            imgView.image = [UIImage imageNamed:item[@"accessory_img"]];
            //设置图片框大小为里面图片的实际大小
            [imgView sizeToFit];
        } else if ([accessory_obj isKindOfClass:[UISwitch class]]) {
            //判断是否是开关, 如果是开关, 那么要为开关注册"value change"事件
            UISwitch *switcher = (UISwitch *)accessory_obj;
            //为开关注册事件
            [switcher addTarget:self action:@selector(didChangeSwitcher:) forControlEvents:UIControlEventValueChanged];
            //从偏好设置中获取数据, 并设置给当前开关
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            switcher.on = [userDefault boolForKey:self.item[@"key_name"]];
        }
        //把accessory_obj赋值给cell的accessoryView属性
        self.accessoryView = accessory_obj;
    }
}
//开关的值改变事件
-(void)didChangeSwitcher:(UISwitch *)switcher {
    //1.获取偏好设置对象
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    //2.写入
    [userDefault setBool:switcher.isOn forKey:self.item[@"key_name"]];
    //3.同步一下
    [userDefault synchronize];
}
//自定义判断cellStyle的私有类方法
+(UITableViewCellStyle)cellStyleWithText:(NSString *)cellStyle {
    if ([cellStyle isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    } else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    } else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    } else {
        return UITableViewCellStyleDefault;
    }
}
+(instancetype)settingCellWithTableView:(UITableView *)tableView item:(NSDictionary *)item {
    static NSString *ID = @"setting_cell";
    WMUSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WMUSettingCell alloc] initWithStyle:[self cellStyleWithText:item[@"cell_style"]] reuseIdentifier:ID];
    }
    cell.detailTextLabel.textColor = [UIColor colorWithRed:173/255.0 green:166/255.0 blue:144/255.0 alpha:1.0];
    return cell;
}
+(instancetype)settingCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"setting_cell";
    WMUSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WMUSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.detailTextLabel.textColor = [UIColor colorWithRed:173/255.0 green:166/255.0 blue:144/255.0 alpha:1.0];
    return cell;
}
-(void)setTimeWithText:(NSString *)text {
    //把时间赋值给detailTextLabel
    self.detailTextLabel.text = text;
    if ([self.item[@"key_name_time"] length] > 0) {
        //把时间储存到偏好设置中
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:text forKey:self.item[@"key_name_time"]];
        [userDefault synchronize];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
