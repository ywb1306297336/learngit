//
//  WMUProduct.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/14.
//

#import "WMUProduct.h"
@implementation WMUProduct
-(instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}
+(instancetype)productWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}
+(NSArray *)product {
    //1.获取json文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
    //2.加载json文件到NSData对象, 根据给定的path, 加载对应的json文件
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    //3.把NSData转换成NSArray
    NSError *errors;
    NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&errors];
    NSMutableArray *modleArr = [NSMutableArray arrayWithCapacity:dictArr.count];
    for (NSDictionary *dict in dictArr) {
        WMUProduct *pro = [WMUProduct productWithDictionary:dict];
        [modleArr addObject:pro];
    }
    return modleArr;
}
@end
