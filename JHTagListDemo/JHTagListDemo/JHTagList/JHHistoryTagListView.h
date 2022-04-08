//
//  JHHistoryTagListView.h
//  ZkDemoAll
//
//  Created by ext.zhaokai1 on 2022/3/30.
//  Copyright © 2022 赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHHistoryTagLayout.h"
#import "JHHistoryTagModel.h"
#import "JHHistoryTagCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SelectBlock)(JHHistoryTagModel *model);

@interface JHHistoryTagListView : UIView

@property (nonatomic, strong) NSArray *resourceArr;

@property (nonatomic, copy) SelectBlock selectBlock;

@end

NS_ASSUME_NONNULL_END
