//
//  JHHistoryTagListView.m
//  ZkDemoAll
//
//  Created by ext.zhaokai1 on 2022/3/30.
//  Copyright © 2022 赵凯. All rights reserved.
//

#import "JHHistoryTagListView.h"

@interface JHHistoryTagListView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation JHHistoryTagListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)setResourceArr:(NSArray *)resourceArr{
    _resourceArr = resourceArr;
    [self.collectionView reloadData];
}

#pragma mark- 配置单元格
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        JHHistoryTagLayout *flowlayout=[[JHHistoryTagLayout alloc]init];
        flowlayout.minimumInteritemSpacing = kTagItemSpace;
        flowlayout.minimumLineSpacing = kTagLineSpace;
        flowlayout.sectionInset = kTagSectionInset;
        flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowlayout];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.delegate=self;
        collectionView.dataSource=self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;
        [self addSubview:collectionView];
        [collectionView registerClass:[JHHistoryTagCell class] forCellWithReuseIdentifier:@"JHHistoryTagCell"];
        _collectionView =collectionView;
    }
    return _collectionView;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.resourceArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHHistoryTagCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"JHHistoryTagCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.model = self.resourceArr[indexPath.row];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHHistoryTagModel *model = self.resourceArr[indexPath.row];
    return CGSizeMake(model.tagWidth, kTagItemHeight);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    JHHistoryTagModel *model = self.resourceArr[indexPath.row];
    if (_selectBlock) {
        _selectBlock(model);
    }
}

@end
