//
//  WMUQuestion.m
//  彩票案例
//
//  Created by 殷文博 on 2021/3/15.
//

#import "WMUQuestion.h"

@implementation WMUQuestion
-(instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}
+(instancetype)questionWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}
+(NSArray *)question {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSError *errors;
    NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&errors];
    NSMutableArray *modleArr = [NSMutableArray arrayWithCapacity:dictArr.count];
    for (NSDictionary *dict in dictArr) {
        WMUQuestion *que = [WMUQuestion questionWithDictionary:dict];
        [modleArr addObject:que];
    }
    return modleArr;
}
@end
