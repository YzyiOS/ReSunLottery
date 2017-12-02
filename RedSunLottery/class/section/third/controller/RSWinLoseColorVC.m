//
//  RSWinLoseColorVC.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/29.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSWinLoseColorVC.h"
#import "RSWinLoseColorModel.h"
#import "RSWinLoseColorSectionView.h"
#import "RSWinLoseNumCellView.h"
#import "RSWinLoseColorCell.h"

@interface RSWinLoseColorVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrData;
@property (nonatomic, strong) NSMutableArray *selectBtnArr;

@end

@implementation RSWinLoseColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    _selectBtnArr = [[NSMutableArray alloc] initWithCapacity:0];
    [self.view addSubview:self.tableView];
    [self getData];
    // Do any additional setup after loading the view.
}
- (void)getData{
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,[NSString stringWithFormat:@"/period/%@_h.json",self.lid]] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        _arrData = [NSArray yy_modelArrayWithClass:[RSWinLoseColorModel class] json:responseDict];
        for (int i = 0; i < _arrData.count; i ++) {
            if (i == 0) {
                [_selectBtnArr addObject:@(1)];
            }else{
                [_selectBtnArr addObject:@(0)];
            }
        }
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
    
    return _arrData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RSWinLoseColorSectionView *sectionView = [[RSWinLoseColorSectionView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 100)];
    sectionView.selectEnd = [_selectBtnArr[section] integerValue];
    sectionView.sectionNum = section;
    sectionView.model = _arrData[section];
    [sectionView returnSelectEnd:^(NSDictionary *select) {
        NSDictionary *dic = select;
        [_selectBtnArr removeObjectAtIndex:[dic.allKeys[0] integerValue]];
        
        [_selectBtnArr insertObject:@([dic.allValues[0] integerValue]) atIndex:[dic.allKeys[0] integerValue]];
        
        [self.tableView reloadData];
        
    }];
    return sectionView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_selectBtnArr[indexPath.section] integerValue]) {
        return 350;
    }
    
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([_selectBtnArr[section] integerValue]) {
        return 1;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RSWinLoseColorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"acell"];
    if (!cell) {
        cell = [[RSWinLoseColorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"acell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.winModel = _arrData[indexPath.section];
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
