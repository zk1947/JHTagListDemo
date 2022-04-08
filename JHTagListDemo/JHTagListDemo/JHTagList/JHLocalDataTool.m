//
//  JHLocalDataTool.m
//  JHTagListDemo
//
//  Created by ext.zhaokai1 on 2022/4/8.
//

#import "JHLocalDataTool.h"

#define KPath [NSHomeDirectory() stringByAppendingString:@"/Documents/UserMsg.plist"]

@implementation JHLocalDataTool

#pragma mark -获取本地数据源
+(NSMutableDictionary *)getLocalResource{
    NSMutableDictionary *userMsgDic=[NSMutableDictionary dictionaryWithContentsOfFile:KPath];
    if (!userMsgDic) {
        userMsgDic = [NSMutableDictionary dictionary];
    }
    return userMsgDic;
}
#pragma mark -存数据
+(void)saveArrayToLocal:(NSArray *)value withKey:(NSString *)key{
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    [userMsgDic setObject:value forKey:key];
    [userMsgDic writeToFile:KPath atomically:YES];
}
#pragma mark -查数据
+(NSArray *)getLocalArray:(NSString *)key{
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    NSArray *arr = [userMsgDic objectForKey:key];
    return arr ? arr : [NSArray array];
}
#pragma mark -清空本地数据
+(void)removeAllLocalData{
    NSMutableDictionary *userMsgDic = [self getLocalResource];
    [userMsgDic removeAllObjects];
    [userMsgDic writeToFile:KPath atomically:YES];
}

@end
