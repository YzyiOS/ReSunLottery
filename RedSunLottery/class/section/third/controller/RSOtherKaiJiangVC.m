//
//  RSOtherKaiJiangVC.m
//  RedSunLottery
//
//  Created by haozhong on 2017/12/1.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSOtherKaiJiangVC.h"
#import "RSWinLoseColorModel.h"
#import "RSOtherKaiJiangView.h"

@interface RSOtherKaiJiangVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrData;

@end

@implementation RSOtherKaiJiangVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    [self.view addSubview:self.tableView];
    [self getData];
    // Do any additional setup after loading the view.
}
- (void)getData{
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,[NSString stringWithFormat:@"/period/%@_h.json",self.lid]] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        _arrData = [NSArray yy_modelArrayWithClass:[RSWinLoseColorModel class] json:responseDict];
        [self.tableView reloadData];
    } failBlock:^(NSError *error) {
        
    }];
    
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = K_GRAY_BG_COLOR;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator  =NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.estimatedRowHeight = 44;
        _tableView.sectionFooterHeight = 0;
        _tableView.sectionHeaderHeight = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _arrData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RSOtherKaiJiangView *sectionView = [[RSOtherKaiJiangView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 100)];

    sectionView.model = _arrData[section];

    return sectionView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [UITableViewCell new];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any re昆明msources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
