//
//  RSThirdViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSThirdViewController.h"
#import "PeriodTitleCell.h"
#import "LotteryDetailCell.h"

#define HEIGHT_TableViewHeader              10
#define ID_PeriodTitleCell                  @"PeriodTitleCell"
#define ID_LotteryDetailCell                @"LotteryDetailCell"

@interface RSThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)   UITableView               *tableView;

@end

@implementation RSThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"彩票开奖";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadDataOfPeriod];
    [self.view addSubview:self.tableView];
}


- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT)
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[PeriodTitleCell class] forCellReuseIdentifier:ID_PeriodTitleCell];
        [_tableView registerClass:[LotteryDetailCell class] forCellReuseIdentifier:ID_LotteryDetailCell];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark - UITableViewFunc -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        PeriodTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:ID_PeriodTitleCell forIndexPath:indexPath];
        titleCell.periodModel = [periodTitleModel new];
        return titleCell;
    }
    
    LotteryDetailCell *lotteryCell = [tableView dequeueReusableCellWithIdentifier:ID_LotteryDetailCell forIndexPath:indexPath];
    lotteryCell.lotteryType = indexPath.section;
    return lotteryCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return HEIGHT_TableViewHeader;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *marginView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, HEIGHT_TableViewHeader)];
    marginView.backgroundColor = K_GRAY_BG_COLOR;
    return marginView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return  indexPath.row == 0 ? 44.0f : 55.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - NetFunc -
- (void)loadDataOfPeriod {
    
    [RSHttp getRequestURL:@"/api/kj/get" params:nil cache:NO successBlock:^(id responseDict) {
        
    } failBlock:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
