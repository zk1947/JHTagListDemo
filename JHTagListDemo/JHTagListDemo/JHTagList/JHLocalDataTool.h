//
//  JHLocalDataTool.h
//  JHTagListDemo
//
//  Created by ext.zhaokai1 on 2022/4/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define ListKey @"ListKey"

@interface JHLocalDataTool : NSObject

/** 获取本地数据源 */
+(NSMutableDictionary *)getLocalResource;

/** 保存数据到本地 */
+(void)saveArrayToLocal:(NSArray *)value withKey:(NSString *)key;

/** 获取本地数据 */
+(NSArray *)getLocalArray:(NSString *)key;

/** 删除本地数据 */
+(void)removeAllLocalData;

@end

NS_ASSUME_NONNULL_END
