//
//  WMUApp.m
//  FuncTest01
//
//  Created by 殷文博 on 2021/5/14.
//

#import "WMUApp.h"

@implementation WMUApp
-(void)setIcon:(NSString *)icon {
    _icon = [NSURL URLWithString:icon];
}
-(UIImage *)pHImg {
    return [UIImage imageNamed:@"user_default"];
}
-(instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)appWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}
+(NSArray *)app {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *modleArr = [NSMutableArray arrayWithCapacity:dictArr.count];
    [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WMUApp *app = [WMUApp appWithDictionary:obj];
            [modleArr addObject:app];
    }];
    return modleArr.copy;
}
@end
