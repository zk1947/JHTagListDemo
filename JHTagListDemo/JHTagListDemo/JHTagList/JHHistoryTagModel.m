//
//  JHHistoryTagModel.m
//  ZkDemoAll
//
//  Created by ext.zhaokai1 on 2022/3/30.
//  Copyright © 2022 赵凯. All rights reserved.
//

#import "JHHistoryTagModel.h"

@implementation JHHistoryTagModel

/// 文案长度超出上限处理
- (NSString *)tagStr{
    //计算最大可显示字数
    int maxTextNum = floor((kTagItemMaxWidth)/(kTagFontSize));
    return _tagStr.length > maxTextNum ?  [NSString stringWithFormat:@"%@...",[_tagStr substringToIndex:maxTextNum]]:_tagStr;
}

/// 计算文案宽度
- (CGFloat)tagWidth{
    CGSize size = [self.tagStr boundingRectWithSize:CGSizeMake(1000, kTagFontSize) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:kTagFontSize]} context:nil].size;
    //增加横向内边距
    CGFloat space = kTagSectionInset.left+kTagSectionInset.right;
    return size.width + space > kTagItemMaxWidth ? kTagItemMaxWidth + space : size.width + space;
}

@end
