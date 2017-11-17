//
//  RSFirstViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/11.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFirstViewController.h"
#import "RSFirstBannerView.h"
#import "RSFirstTypeTableCell.h"

#import "RSFirstLotteryModel.h"
#import "RSFirstBannerModel.h"

@interface RSFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RSFirstBannerView *bannerView;

@property (nonatomic, strong) NSArray *lotteryArr;

@property (nonatomic, strong) NSArray *bannerArr;

@end

@implementation RSFirstViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
    [self.view addSubview:self.tableView];
    [self getData];
    
    // Do any additional setup after loading the view.
}
- (void)getData{
    [RSHttp getRequestURL:@"/home/home.json" params:@{} cache:NO successBlock:^(id responseDict) {
        _lotteryArr = [NSArray yy_modelArrayWithClass:[RSFirstLotteryModel class] json:responseDict[@"lottery"]];
        _bannerArr = [NSArray yy_modelArrayWithClass:[RSFirstBannerModel class] json:responseDict[@"banner"]];
        _bannerView.bannerArr = _bannerArr;
        [self.tableView reloadData];
    } failBlock:^(NSError *error) {
    
    }];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        CGRect bannerRect = CGRectMake(0, 0, k_WIDTH, 174);
        _bannerView = [[RSFirstBannerView alloc] initWithFrame:bannerRect];
        _tableView.tableHeaderView = _bannerView;
    }
    return _tableView;
}
- (void)setUI{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 174;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 490;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {

       RSFirstTypeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RSFirstTypeTableCell"];
        if (!cell) {
            cell = [[RSFirstTypeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RSFirstTypeTableCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.lotteryArr = _lotteryArr;
        return cell;
    }
//    UITableViewCell *acell = [tableView dequeueReusableCellWithIdentifier:@"acell"];
//    if (!acell) {
//        acell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"acell"];
//    }
//    acell.backgroundColor = [UIColor redColor];
//    acell.selectionStyle = UITableViewCellSelectionStyleNone;
    return [UITableViewCell new];
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
