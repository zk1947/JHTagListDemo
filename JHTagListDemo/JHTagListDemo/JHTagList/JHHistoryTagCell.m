//
//  JHHistoryTagCell.m
//  ZkDemoAll
//
//  Created by ext.zhaokai1 on 2022/3/30.
//  Copyright © 2022 赵凯. All rights reserved.
//

#import "JHHistoryTagCell.h"

@interface JHHistoryTagCell ()

@property (nonatomic, strong) UILabel *tagLab;

@end

@implementation JHHistoryTagCell

- (void)setModel:(JHHistoryTagModel *)model{
    _model = model;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    self.contentView.layer.cornerRadius = self.bounds.size.height/2.0;
    self.contentView.layer.masksToBounds = YES;
    
    _tagLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    _tagLab.backgroundColor = [UIColor cyanColor];
    _tagLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:kTagFontSize];
    _tagLab.text = _model.tagStr;
    _tagLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_tagLab];
}

@end
