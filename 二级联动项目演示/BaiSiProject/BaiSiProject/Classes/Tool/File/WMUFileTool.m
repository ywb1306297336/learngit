//
//  WMUFileTool.m
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/7.
//

#import "WMUFileTool.h"

@implementation WMUFileTool
+(void)getFileSize:(NSString *)directoryPath completion:(nonnull void (^)(NSInteger))completion {
    //获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    //判断是否是文件夹
    BOOL isDirectory;
    //判断文件是否存在, 并且判断是否是文件夹
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isDirectory || !isExist) {
        //创建异常
        NSException *except = [NSException exceptionWithName:@"FileTypeError" reason:@"需要传入文件夹路径而不是文件路径, 且该文件夹必须存在!" userInfo:nil];
        //抛出异常
        [except raise];
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //获取文件夹下所有子路径(包括二级路径)
        NSArray *subPaths = [mgr subpathsAtPath:directoryPath];
        NSInteger totalSize = 0;
        //遍历Caches文件夹下所有子路径
        for (NSString *subPath in subPaths) {
            //获取文件全路径
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            //判断隐藏文件
            if ([filePath containsString:@".DS"]) continue;
            //判断是否是文件夹
            BOOL isDirectory;
            //判断文件是否存在, 并且判断是否是文件夹
            BOOL isExist = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
            if (!isExist || isDirectory) continue;
            //获取文件属性
            NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
            //获取default文件的大小
            NSInteger size = [attr fileSize];
            //将所有文件大小都加起来
            totalSize += size;
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(totalSize);
            }
        });
    });
}
+(void)removeDirectoryPath:(NSString *)directoryPath {
    //获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    //判断是否是文件夹
    BOOL isDirectory;
    //判断文件是否存在, 并且判断是否是文件夹
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isDirectory || !isExist) {
        //创建异常
        NSException *except = [NSException exceptionWithName:@"FileTypeError" reason:@"需要传入文件夹路径而不是文件路径, 且该文件夹必须存在!" userInfo:nil];
        //抛出异常
        [except raise];
    }
    //获取cache文件夹下所有文件(不包括二级路径)
    NSArray *subPaths = [mgr contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString *subPath in subPaths) {
        //获取文件全路径
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        //删除路径
        [mgr removeItemAtPath:filePath error:nil];
    }
}
@end
