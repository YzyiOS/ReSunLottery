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
#import "RSBannerWebVC.h"

@interface RSFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RSFirstBannerView *bannerView;

@property (nonatomic, strong) NSArray *lotteryArr;

@property (nonatomic, strong) NSArray *bannerArr;

@property (nonatomic, strong) UIButton *btnNotice;

@property (nonatomic, strong) NSDictionary *noticeDic;

@end

@implementation RSFirstViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [self setUI];
    [self getData];
    
    // Do any additional setup after loading the view.
}
- (void)getData{
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,@"/home/home.json"] params:@{} cache:NO successBlock:^(id responseDict) {
        _lotteryArr = [NSArray yy_modelArrayWithClass:[RSFirstLotteryModel class] json:responseDict[@"lottery"]];
        _bannerArr = [NSArray yy_modelArrayWithClass:[RSFirstBannerModel class] json:responseDict[@"banner"]];
        _bannerView.bannerArr = _bannerArr;
        _noticeDic = [[NSDictionary alloc] initWithDictionary:responseDict[@"notice"]];
        [self.tableView reloadData];
    } failBlock:^(NSError *error) {
    
    }];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        CGRect bannerRect = CGRectMake(0, 0, k_WIDTH, 174 + 36 + 10);
        _bannerView = [[RSFirstBannerView alloc] initWithFrame:bannerRect];
        _tableView.tableHeaderView = _bannerView;
    }
    return _tableView;
}
- (UIButton *)btnNotice{
    if (!_btnNotice) {
        _btnNotice = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnNotice.backgroundColor = [UIColor blackColor];
        [_btnNotice addTarget:self action:@selector(btnNoticeWeb) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnNotice;
    
}
- (void)btnNoticeWeb{
    RSBannerWebVC *vc = [[RSBannerWebVC alloc] init];
    vc.content = _noticeDic[@"content"];
    vc.title = _noticeDic[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)setUI{
    [self.view addSubview:self.btnNotice];
    [self.btnNotice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top).offset(40);
        make.width.height.mas_offset(20);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 174 + 36 + 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 145 * ((_lotteryArr.count / 3) + (_lotteryArr.count % 3 == 0 ? 0 :1));
    }
    return 100;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        RSFirstTypeTableCell *cell = [RSFirstTypeTableCell  deque:tableView Style:UITableViewCellStyleDefault reuseIdentifier:@"RSFirstTypeTableCell" cellHei:145 * ((_lotteryArr.count / 3) + (_lotteryArr.count % 3 == 0 ? 0 :1))];
        
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
