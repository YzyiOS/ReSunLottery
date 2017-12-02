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
#import "RSFooter_BasktLotteryVC.h"

#import "RSWinLoseColorVC.h"

#import "RSOtherKaiJiangVC.h"

#import "RSSFPViewController.h"

#define HEIGHT_TableViewHeader              10
#define ID_PeriodTitleCell                  @"PeriodTitleCell"
#define ID_LotteryDetailCell                @"LotteryDetailCell"

@interface RSThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)   UITableView               *tableView;

@property (nonatomic, strong) NSArray *arrData;

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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[PeriodTitleCell class] forCellReuseIdentifier:ID_PeriodTitleCell];
        [_tableView registerClass:[LotteryDetailCell class] forCellReuseIdentifier:ID_LotteryDetailCell];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark - UITableViewFunc -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _arrData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        PeriodTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:ID_PeriodTitleCell forIndexPath:indexPath];
        titleCell.periodModel = _arrData[indexPath.section];
        return titleCell;
    }
    
    LotteryDetailCell *lotteryCell = [tableView dequeueReusableCellWithIdentifier:ID_LotteryDetailCell forIndexPath:indexPath];
    lotteryCell.model = _arrData[indexPath.section];
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
     periodTitleModel *model = _arrData[indexPath.section];
    if ([model.lid integerValue] == 1800 || [model.lid integerValue]== 1810) {
        
        
        
        RSWinLoseColorVC *winVC = [[RSWinLoseColorVC alloc] init];
        winVC.titleStr = model.lname;
        winVC.lid = model.lid;//1800-1810,可以点击进去
        [self.navigationController pushViewController:winVC animated:YES];
        return;
    }else if ([model.lid integerValue] == 1700 || [model.lid integerValue] == 1710){
        RSFooter_BasktLotteryVC *vc = [[RSFooter_BasktLotteryVC alloc] init];
        vc.play = [model.lid integerValue                                                                                                            ];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }else if([model.lid integerValue] == 1010 || [model.lid integerValue]== 1530 || [model.lid integerValue]== 1030){
        RSSFPViewController *pVC = [[RSSFPViewController alloc] init];
        pVC.titleStr = model.lname;
        pVC.lid = model.lid;
        [self.navigationController pushViewController:pVC animated:YES];
        return;
        
    }else{
        RSOtherKaiJiangVC *vcOther = [[RSOtherKaiJiangVC alloc] init];
        vcOther.titleStr = model.lname;
        vcOther.lid = model.lid;
        [self.navigationController pushViewController:vcOther animated:YES];
        return;
        
    }
    
    
    
    
    
   
    
    
}


#pragma mark - NetFunc -
- (void)loadDataOfPeriod {
    
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseMobileUrl,@"/api/kj/get"] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        _arrData = [NSArray yy_modelArrayWithClass:[periodTitleModel class] json:responseDict[@"data"]];
        [self.tableView reloadData];
    } failBlock:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
