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
#import "RSFirstTypeCollectionVC.h"

@interface RSFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RSFirstBannerView *bannerView;
@end

@implementation RSFirstViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self setUI];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [_tableView registerClass:[RSFirstTypeTableCell class] forCellReuseIdentifier:@"RSFirstTypeTableCell"];
    }
    return _tableView;
}
- (void)setUI{
    CGRect bannerRect = CGRectMake(0, 0, k_WIDTH, 174);
    _bannerView = [[RSFirstBannerView alloc] initWithFrame:bannerRect];
    self.tableView.tableHeaderView = _bannerView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 174;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
  
       RSFirstTypeTableCell *topThreeCell = [tableView dequeueReusableCellWithIdentifier:@"RSFirstTypeTableCell" forIndexPath:indexPath];
        [topThreeCell setVM:[[RSFirstTypeCollectionVC alloc] init]];
    }
    
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
