//
//  ViewController.m
//  JHTagListDemo
//
//  Created by ext.zhaokai1 on 2022/4/8.
//

#import "ViewController.h"
#import "JHHistoryTagListView.h"
#import "JHLocalDataTool.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *TxtF;

@property (nonatomic, strong) JHHistoryTagListView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tagView = [[JHHistoryTagListView alloc]initWithFrame:CGRectMake(0, 200, KSCREEN_W, 400)];
    _tagView.backgroundColor = [UIColor redColor];
    _tagView.selectBlock = ^(JHHistoryTagModel * _Nonnull model) {
        NSLog(@"%@",model.tagStr);
    };
    [self.view addSubview:_tagView];
    
    
    //假数据
    NSString *str = @"假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数据假数";
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger index = 0; index < 30; index++) {
        JHHistoryTagModel *model = [JHHistoryTagModel new];
        model.tagStr = [str substringToIndex:arc4random()%30+1];
        [arr addObject:model];
    }
    _tagView.resourceArr = [arr copy];
    
}


- (IBAction)btnAction:(id)sender {
    
    if (_TxtF.text.length == 0) return;
    
    //数据存本地
    NSMutableArray *arr = [[JHLocalDataTool getLocalArray:ListKey] mutableCopy];
    //需求存最近5条
    if (arr.count >= 5) {
        [arr removeLastObject];
    }
    [arr insertObject:_TxtF.text atIndex:0];
    [JHLocalDataTool saveArrayToLocal:[arr copy] withKey:ListKey];
}

- (IBAction)showAction:(id)sender {
    
    NSMutableArray *mArr = [NSMutableArray array];
    NSArray *arr = [JHLocalDataTool getLocalArray:ListKey];
    for (NSString *str in arr) {
        JHHistoryTagModel *model = [JHHistoryTagModel new];
        model.tagStr = str;
        [mArr addObject:model];
    }
    _tagView.resourceArr = [mArr copy];
    
}



@end
