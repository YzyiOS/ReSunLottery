//
//  RSSSQVC.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSSSQVC.h"
#import "RSSSQSecvtionView.h"
#import "RSSQiuFirstCell.h"
#import "RSSSQiuSection.h"
#import "RSComMoneyView.h"

#import "RSSSQZSModel.h"
#import "RSSSQLSModel.h"
#import "RSCathexisManeger.h"

@interface RSSSQVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RSComMoneyView *bomtonView;

@property (nonatomic, assign) BOOL sectionType;//记录是否打开sectionView下面的cell

@property (nonatomic, strong) NSArray *arrZS;

@property (nonatomic, strong) NSArray *arrLS;

@property (nonatomic, strong) NSMutableArray *redSelectBall;

@property (nonatomic, strong) NSMutableArray *blueSelectBall;

@property (nonatomic, strong) NSMutableArray *redTuoDanSelectBall;

@property (nonatomic, assign) NSInteger palyNum;//1是普通玩法，而是胆拖


@end

@implementation RSSSQVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _sectionType = YES;
    _palyNum = 1;
    _redTuoDanSelectBall = [[NSMutableArray alloc] initWithCapacity:0];
    _redSelectBall = [[NSMutableArray alloc] initWithCapacity:0];
    _blueSelectBall = [[NSMutableArray alloc] initWithCapacity:0];
    self.arrNarBtnModel = @[@"双色球.普通",@"双色球.胆拖"];
    self.view.backgroundColor = K_GRAY_BG_COLOR;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bomtonView];
    [self getData];
    // Do any additional setup after loading the view.
}
- (void)getData{
    
    [RSHttp getRequestURL:[NSString stringWithFormat:@"%@%@",RSBaseStaticUrl,@"/period/1010.json"] params:nil cache:NO successBlock:^(id responseDict) {
        RSLog(@"%@",responseDict);
        _arrZS = [NSArray yy_modelArrayWithClass:[RSSSQZSModel class] json:responseDict[@"zs"]];
        _arrLS = [NSArray yy_modelArrayWithClass:[RSSSQLSModel class] json:responseDict[@"ls"]];
        [self.tableView reloadData];
    } failBlock:^(NSError *error) {
        
        
    }];
    
}
- (void)setSelectNum:(NSInteger)selectNum{
    //1:代表普通玩法。2:代表脱胆
    _palyNum = selectNum;
    self.bomtonView.strMoney = @"0";
    self.bomtonView.strZhuShu = @"0";
    [_redSelectBall removeAllObjects];
    [_redTuoDanSelectBall removeAllObjects];
    [_blueSelectBall removeAllObjects];
    [self.tableView reloadData];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, k_HEIGHT - 45) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = K_GRAY_BG_COLOR;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.alwaysBounceHorizontal = NO;
        _tableView.estimatedRowHeight = 0;
        _tableView.sectionFooterHeight = 10;
        _tableView.sectionHeaderHeight = 10;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"RSSSQiuSection" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"RSSSQiuSection"];
        
    }
    return _tableView;
}
-(RSComMoneyView *)bomtonView{
    if (!_bomtonView) {
        _bomtonView = [[RSComMoneyView alloc] initWithFrame:CGRectMake(0, k_HEIGHT - 45 , k_WIDTH, 45)];
        _bomtonView.backgroundColor = [UIColor whiteColor];
    }
    return _bomtonView;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        RSSSQSecvtionView *sectionView = [[RSSSQSecvtionView alloc] initWithFrame:CGRectMake(0, 0, k_WIDTH, 90)];
        sectionView.select = _sectionType;
        sectionView.zsModel = _arrZS[0];
        sectionView.lsModel = _arrLS[0];
        sectionView.selectbtnType = ^(BOOL select) {
            _sectionType = select;
            NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
            [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        };
        return sectionView;
    }
    return [UIView new];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 90;
    }
    return 10;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 10;
    }
    return 0.001;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_palyNum == 1) {
        return 3;//这里是普通玩法
    }
    return 4;//这里是胆拖玩法
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if (_sectionType) {
            return 1;
        }
        return 0;
    }
    
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            if (_sectionType) {
                return 35 *_arrLS.count + 35;
            }
            return 0;
        }else{
            return 150;
        }
    }else{
        if(_palyNum == 1){//普通玩法
            if (indexPath.section == 1) {
                return 300;
            }else{
                
                return 150;
            }
            return 0;
        }else{
            if (indexPath.section == 1 || indexPath.section == 2) {
                return 300;
            }else{
                
                return 150;
            }
        }
       
        
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0) {
        if (indexPath.row == 0) {
            RSSQiuFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RSSQiuFirstCell"];
            if (!cell) {
                cell = [[RSSQiuFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RSSQiuFirstCell"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.arrContent = _arrLS;
            return cell;
        }else{
            
        }
    }else{
        RSSSQiuSection *cell = [tableView dequeueReusableCellWithIdentifier:@"RSSSQiuSection" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.section == 1) {
            cell.nalColor = K_RedTextColor;
            cell.colorType = 0;
            cell.titleStr = @"至少选择6个红球";
            if (_palyNum == 2) {
                cell.titleStr = @"胆码区 请选择1-5个胆码";
            }
            [cell setUI:33];
            cell.selectBallArr = _redSelectBall;
            cell.arr = ^(NSString *arr) {//返回选中的球
                RSLog(@"胆码 %@",arr);
                if ([_redSelectBall containsObject:arr]) {
                    [_redSelectBall removeObject:arr];
                }else{
                    
                    [_redSelectBall addObject:arr];
                }
                if ([_redTuoDanSelectBall containsObject:arr]) {
                    [_redTuoDanSelectBall removeObject:arr];
                }
                
                [self setNoteTheNumber];
            };
        }else{
            if (_palyNum == 1) {
                cell.nalColor = Color_double_blue;
                cell.colorType = 1;
                cell.titleStr = @"至少选择1个蓝球";
                [cell setUI:16];
                cell.selectBallArr = _blueSelectBall;
                
                cell.arr = ^(NSString *arr) {//返回选中的球
                    if ([_blueSelectBall containsObject:arr]) {
                        [_blueSelectBall removeObject:arr];
                    }else{
                        
                        [_blueSelectBall addObject:arr];
                    }
                    
                    [self setNoteTheNumber];
                };
            }else{
                if (indexPath.section == 2) {
                    cell.nalColor = K_RedTextColor;
                    cell.colorType = 0;
                    cell.titleStr = @"拖码区 至少选择2个拖码";
                    [cell setUI:33];
                    cell.selectBallArr = _redTuoDanSelectBall;
                    cell.arr = ^(NSString *arr) {//返回选中的球
                         RSLog(@"拖码 %@",arr);
                        if ([_redTuoDanSelectBall containsObject:arr]) {
                            [_redTuoDanSelectBall removeObject:arr];
                        }else{
                            [_redTuoDanSelectBall addObject:arr];
                        }
                        if ([_redSelectBall containsObject:arr]) {
                            [_redSelectBall removeObject:arr];
                        }
                        
                        
                        [self setNoteTheNumber];
                    };
                }else{
                    cell.nalColor = Color_double_blue;
                    cell.colorType = 1;
                    cell.titleStr = @"至少选择1个蓝球";
                    [cell setUI:16];
                    cell.selectBallArr = _blueSelectBall;
                    
                    cell.arr = ^(NSString *arr) {//返回选中的球
                        RSLog(@"篮球 %@",arr);
                        if ([_blueSelectBall containsObject:arr]) {
                            [_blueSelectBall removeObject:arr];
                        }else{
                            
                            [_blueSelectBall addObject:arr];
                        }
                        
                        [self setNoteTheNumber];
                    };
                    
                }
                
            }
            
        }
        
        return cell;
        
    }
    
    return [UITableViewCell new];
}
//计算注数
- (void)setNoteTheNumber{
    RSLog(@"%ld",[RSCathexisManeger backNoteNumWithPlayConstant:6 redNum:_redSelectBall.count]);
    if (_palyNum ==1) {
        self.bomtonView.strMoney = [NSString stringWithFormat:@"%ld",[RSCathexisManeger backNoteNumWithPlayConstant:6 redNum:_redSelectBall.count]*2*_blueSelectBall.count];
        self.bomtonView.strZhuShu = [NSString stringWithFormat:@"%ld",[RSCathexisManeger backNoteNumWithPlayConstant:6 redNum:_redSelectBall.count] *_blueSelectBall.count];
    }else{
        if (_redSelectBall.count > 5) {
            [RSProgressHUd showErrorWithText:@"红球最多只能选择5个胆码"];
            [_redSelectBall removeObjectAtIndex:5];
            [self.tableView reloadData];
            return;
        }
        
        self.bomtonView.strMoney = [NSString stringWithFormat:@"%ld",[RSCathexisManeger backNoteNumWithPlayConstant:6 - _redSelectBall.count redNum:_redTuoDanSelectBall.count]*2 *_blueSelectBall.count];
        self.bomtonView.strZhuShu = [NSString stringWithFormat:@"%ld",[RSCathexisManeger backNoteNumWithPlayConstant:6 - _redSelectBall.count redNum:_redTuoDanSelectBall.count] *_blueSelectBall.count];
        [self.tableView reloadData];
    }
    

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
