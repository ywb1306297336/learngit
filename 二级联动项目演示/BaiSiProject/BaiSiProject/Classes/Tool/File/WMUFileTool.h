//
//  WMUFileTool.h
//  BaiSiProject
//
//  Created by 殷文博 on 2021/5/7.
//  处理文件缓存

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMUFileTool : NSObject
/**
 * 获取文件尺寸
 * @param directoryPath 文件夹路径
 */
+(void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSInteger))completion;
/**
 * 清除文件夹里的所有文件
 * @param directoryPath 文件夹路径
 */
+(void)removeDirectoryPath:(NSString *)directoryPath;
@end

NS_ASSUME_NONNULL_END
