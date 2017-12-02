//
//  RSSecendViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSecendViewController.h"
#import "RSLottertFooter_BascktSectionView.h"
#import "RSScoreTableCell.h"
#import "RSScorePeriod.h"
#import "RSMatchModel.h"
#import "RSScoreHttpManager.h"

@interface RSSecendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *periodArr;

@property (nonatomic, strong) NSArray *matchArr;

@property (nonatomic, strong) NSMutableArray *selectBtnArr;

@end

@implementation RSSecendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"比分";
    _selectBtnArr = [[NSMutableArray alloc] initWithCapacity:0];
    _periodArr = [[NSMutableArray alloc] initWithCapacity:0];
    [self getDataPeriod];
    
    [RSScoreHttpManager sharedInstance];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
-(void)getDataPeriod{
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,@"/jsbf/jsbf_period.json"] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        [responseDict enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            RSScorePeriod *model = [RSScorePeriod yy_modelWithJSON:obj];
            [self getDataMatch:model];
        }];
        
    } failBlock:^(NSError *error) {
        
    }];
}
- (void)getDataMatch:(RSScorePeriod *)model{
        if ([model.show integerValue]) {
            [_selectBtnArr addObject:@(1)];
        }else{
            [_selectBtnArr addObject:@(0)];
        }
    
    
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,[NSString stringWithFormat:@"/jsbf/match/%@.json",model.period]] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        model.arrMatch = [NSArray yy_modelArrayWithClass:[RSMatchModel class] json:responseDict];
        [_periodArr addObject:model];
        [self.tableView reloadData];
    } failBlock:^(NSError *error) {
        
    }];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT) style:UITableViewStyleGrouped];
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
    return _periodArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    RSScorePeriod *model = _periodArr[section];
    return model.arrMatch.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RSLottertFooter_BascktSectionView *sectionView = [[RSLottertFooter_BascktSectionView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 45)];
    RSScorePeriod *model = _periodArr[section];
    sectionView.title = model.title;
    return sectionView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RSScoreTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acell"];
    if (!cell) {
        cell = [[RSScoreTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"acell"];
    }
    RSScorePeriod *model = _periodArr[indexPath.section];
    cell.model = model.arrMatch[indexPath.row];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
