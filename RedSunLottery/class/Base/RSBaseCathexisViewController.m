//
//  RSBaseCathexisViewController.m
//  RedSunLottery
//
//  Created by haozhong on 2017/11/21.
//  Copyright © 2017年 RedSun. All rights reserved.
//

#import "RSBaseCathexisViewController.h"
#import "RSNarBtnCollectionView.h"

@interface RSBaseCathexisViewController ()<RSNarBtnCollectionViewDelegate>

@property (nonatomic, strong) UIButton *btnNar;
@property (nonatomic, strong) RSNarBtnCollectionView *vc;

@end

@implementation RSBaseCathexisViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    [self setUI];
    // Do any additional setup after loading the view.
}
- (void)setArrNarBtnModel:(NSArray *)arrNarBtnModel{
    _arrNarBtnModel = arrNarBtnModel;
    [_btnNar setTitle:self.arrNarBtnModel[0] forState:UIControlStateNormal];
}
- (void)setUI{
    _btnNar = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnNar.frame = CGRectMake(0, 0, k_WIDTH - 150, 30);
    _btnNar.titleLabel.font = RSFont(22);
    [_btnNar setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnNar setTitle:self.arrNarBtnModel[0] forState:UIControlStateNormal];
    [_btnNar addTarget:self action:@selector(btnNarCilck) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _btnNar;
    _vc = [[RSNarBtnCollectionView alloc] init];
    _vc.delegate = self;
}
- (void)btnNarCilck{
    
    _vc.modelArr = self.arrNarBtnModel;
    _vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    for (UIView *view in self.view.subviews) {
        if (view == _vc.view) {
            return;
        }
    }
    [self.view addSubview:_vc.view];
}
- (void)backSelectNum:(NSInteger)num{
    self.selectNum = num;
    
    [_btnNar setTitle:_vc.modelArr[num - 1] forState:UIControlStateNormal];
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
