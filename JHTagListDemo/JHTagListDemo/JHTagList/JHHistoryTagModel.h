//
//  JHHistoryTagModel.h
//  ZkDemoAll
//
//  Created by ext.zhaokai1 on 2022/3/30.
//  Copyright © 2022 赵凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JHHistoryTagConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHHistoryTagModel : NSObject

@property (nonatomic, copy) NSString *tagStr;

@property (nonatomic, assign) CGFloat tagWidth;

@end

NS_ASSUME_NONNULL_END
