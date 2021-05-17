//
//  WMUProduct.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/5.
//

#import "WMUProduct.h"

@implementation WMUProduct
-(instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.url = dict[@"url"];
    }
    return self;
}
+(instancetype)productWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}
+(NSMutableArray *)product {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *errors;
    NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&errors];
    NSMutableArray *modleArr = [NSMutableArray arrayWithCapacity:dictArr.count];
    [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WMUProduct *product = [WMUProduct productWithDictionary:obj];
            [modleArr addObject:product];
    }];
    return modleArr;
}
@end
