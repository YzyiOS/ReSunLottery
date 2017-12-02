//
//  RSFooter_BasktLotteryVC.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/27.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSFooter_BasktLotteryVC.h"
#import "RSLottertFooter_BascktSectionView.h"
#import "RSFooter_BasktBallModel.h"
#import "RSFooter_BasktBall.h"

@interface RSFooter_BasktLotteryVC ()<UITableViewDelegate,UITableViewDataSource>{
    NSString *_url;
    
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *arrData;

@property (nonatomic, strong) NSMutableArray *selectBtnArr;//保存sectionView的按钮状态

@end

@implementation RSFooter_BasktLotteryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    if (self.play == PlayTypeBasktball) {
        _url = @"/jc/match/jclqResult.json";
    }else{
        _url = @"/jc/match/jczqResult.json";
    }
    
    _selectBtnArr = [[NSMutableArray alloc] initWithCapacity:0];
    [self.view addSubview:self.tableView];
    [self getData];
    // Do any additional setup after loading the view.
}
- (void)getData{
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,_url] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        _arrData = [NSArray yy_modelArrayWithClass:[RSFooter_BasktBallModel class] json:responseDict];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    RSFooter_BasktBallModel *model = _arrData[section];
    if ([_selectBtnArr[section] integerValue] == 1) {
        return model.value.count;
    }else{
        return 0;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RSLottertFooter_BascktSectionView *sectionView = [[RSLottertFooter_BascktSectionView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 44)];
    sectionView.selectEnd = [_selectBtnArr[section] integerValue];
    sectionView.sectionNum = section;
    
    RSFooter_BasktBallModel *model = _arrData[section];
    sectionView.title = model.title;
    [sectionView returnSelectEnd:^(NSDictionary *select) {
        NSDictionary *dic = select;
        [_selectBtnArr removeObjectAtIndex:[dic.allKeys[0] integerValue]];
        
        [_selectBtnArr insertObject:@([dic.allValues[0] integerValue]) atIndex:[dic.allKeys[0] integerValue]];

        [self.tableView reloadData];
    }];
    
    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectBtnArr[indexPath.section]) {
        return 136;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RSFooter_BasktBall *cell = [tableView dequeueReusableCellWithIdentifier:@"acell"];
    if (!cell) {
        cell = [[RSFooter_BasktBall alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"acell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    RSFooter_BasktBallModel *model = _arrData[indexPath.section];
    cell.type = self.play;
    cell.model = model.value[indexPath.row];
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
