//
//  RSSSQVC.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSSQVC.h"
#import "RSSSQSecvtionView.h"

@interface RSSSQVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RSSSQVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrNarBtnModel = @[@"",@""];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.alwaysBounceHorizontal = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RSSSQSecvtionView *sectionView = [[RSSSQSecvtionView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 90)];
    
    return sectionView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 90;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;//这里分为两个section
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 3;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    }else{
        
        
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
