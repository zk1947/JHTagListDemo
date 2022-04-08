//
//  JHHistoryTagLayout.m
//  ZkDemoAll
//
//  Created by ext.zhaokai1 on 2022/3/30.
//  Copyright © 2022 赵凯. All rights reserved.
//

#import "JHHistoryTagLayout.h"

@interface JHHistoryTagLayout ()

@property (nonatomic, assign) CGRect lastFrame; // 上一个item的 布局
@property (nonatomic, strong) NSMutableArray *attributesArray;

@end

@implementation JHHistoryTagLayout
 
- (void)prepareLayout{
 
    [super prepareLayout];
 
    NSMutableArray *layoutInfoArr = [NSMutableArray array];
    // 获取布局信息
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    for (NSInteger section = 0; section < numberOfSections; section++){
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:numberOfItems];
        for (NSInteger item = 0; item < numberOfItems; item++){
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [subArr addObject:attributes];
        }
 
        // 添加到二维数组
        [layoutInfoArr addObject:[subArr copy]];
    }
    // 存储布局信息
    self.attributesArray = [layoutInfoArr copy];
}
 
// 直接使用系统计算的大小 不做更新了
//- (CGSize)collectionViewContentSize{
//    return self.contentSize;
//}
 
// 找出了与指定区域有交接的UICollectionViewLayoutAttributes对象放到一个数组中，然后返回
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *layoutAttributesArr = [NSMutableArray array];
    [self.attributesArray enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger i, BOOL * _Nonnull stop) {
        [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(CGRectIntersectsRect(obj.frame, rect)) { // 如果 item 在rect内
                [layoutAttributesArr addObject:obj];
            }
        }];
    }];
    return layoutAttributesArr;
}
 
// 根据自己的需求,计算每一个item的布局,如果 itemSize是动态的,可以配合代理方法拿到当前 indexPath 的大小
// 这里只自定义了item的布局
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    // 拿到系统为我们计算的布局
    UICollectionViewLayoutAttributes *oldAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
 
    // 创建一个我们期望的布局
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
 
    CGFloat itemX = self.sectionInset.left;          // 默认X值
    CGFloat itemY = oldAttributes.frame.origin.y;   // Y值直接用系统算的
    CGSize itemSize = oldAttributes.size;           // 大小直接代理返回的
 
    // 同一行
    BOOL line = oldAttributes.frame.origin.y == self.lastFrame.origin.y;
 
    // 不换行 && (indexPath.row=0时  self.lastFrame 还未赋值)  调整X值
    if (oldAttributes.frame.origin.x != itemX && indexPath.row != 0 && line) {
        itemX =  self.lastFrame.origin.x + self.lastFrame.size.width + self.minimumInteritemSpacing;
    }
 
    // 赋值
    attributes.frame = CGRectMake(itemX, itemY, itemSize.width, itemSize.height);
 
    // 更新上一个item的位置
    self.lastFrame = CGRectMake(itemX, itemY, itemSize.width, itemSize.height);
    return attributes;
}
 
- (NSMutableArray *)attributesArray{
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}

@end
