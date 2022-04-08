//
//  ViewController.m
//  JHTagListDemo
//
//  Created by ext.zhaokai1 on 2022/4/8.
//

#import "ViewController.h"
#import "JHHistoryTagListView.h"

@interface ViewController ()

@property (nonatomic, strong) JHHistoryTagListView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tagView = [[JHHistoryTagListView alloc]initWithFrame:CGRectMake(0, 100, KSCREEN_W, 400)];
    _tagView.backgroundColor = [UIColor redColor];
    _tagView.selectBlock = ^(JHHistoryTagModel * _Nonnull model) {
        NSLog(@"%@",model.tagStr);
    };
    [self.view addSubview:_tagView];
    
    
    
    //假数据
    NSString *str = @"是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥";
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger index = 0; index < 30; index++) {
        JHHistoryTagModel *model = [JHHistoryTagModel new];
        model.tagStr = [str substringToIndex:arc4random()%40+1];
        [arr addObject:model];
    }
    _tagView.resourceArr = [arr copy];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *str = @"是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥是大哥大哥";
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger index = 0; index < 30; index++) {
        JHHistoryTagModel *model = [JHHistoryTagModel new];
        model.tagStr = [str substringToIndex:arc4random()%40+1];
        [arr addObject:model];
    }
    _tagView.resourceArr = [arr copy];
}

@end
